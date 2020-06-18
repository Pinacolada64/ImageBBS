; 5/Jun/2016 21:43 - assemble with casm 4.0 beta
{uses:..\equates-2_0.asm}

{undef:use1point2}
{ifndef:use1point2}
; cd /home/ryan/c64/Image BBS/git/ImageBBS/v2/asm/rs232
; ll "rs232-swift.sym"

; References:
; https://www.lemon64.com/forum/viewtopic.php?t=73957
; https://www.c64-wiki.com/wiki/Interrupt

; FIXME: loop checking for read/write status $02a1 (ENABL); just > 2a1 00 continues
; terminal code @ $c0b7 (waiting for Shift+C=)
; &,49 getmod $b915
; &,4  getmdm $aab3

; There are a few problems/things I want to improve with with this version of the SwiftLink driver:
; 1) 19.2k communication "looks slower", according to others.
; Not sure why yet.  Wrong BPS rate, I'm guessing?

; 2) Testing out setting parity to "space" so tcpser enters 8-bit binary mode
; (shouldn't get "stuck" during a file transfer looking for valid telnet NVT IAC $ff responses)
; (another option might be to put setting the parity parameter in the OPEN 2 statement in "im")
{undef:set_parity}

; 3) testing out whether un-commenting 'oldchrout' and 'newchrout' routines actually does anything.
; The code was commented out in the FastAssembler version.
; when the code is uncommented, it outputs lots of data via RS232 even if DCD is not asserted.
; {undef:comment_out} allows the 'oldchrout' and 'newchrout' code to be included in the final binary.
{undef:comment_out}

; 4) It has been reported that while the BBS is online, if it loads a (large?)
;	module, and the user keeps typing during the load, the loaded module is corrupt.
;	CTS is handled by the 6551, so an IRQ problem?
;	"rsdisab" is called before a load in "disk-io.asm"

; gets relocated when LOADed and &,16,1 is issued at BBS init
orig $0800

; Using the ACIA frees many addresses in zero page normally used by
; Kernal RS-232 routines. The addresses for the buffer pointers were
; chosen arbitrarily. The buffer vector addresses are those used by
; the Kernal routines.

rhead	= $a7	; pointer to next byte to be removed from
		; receive buffer
rtail	= $a8	; pointer to location to store next byte received
rbuff	= $f7	; receive buffer vector
thead	= $a9	; pointer to next byte to be removed from
		; transmit buffer
ttail	= $aa	; pointer to location to store next byte
		; in transmit buffer
tbuff	= $f9	; transmit buffer vector
xmitcnt	= $ab	; count of bytes remaining in transmit (xmit) buffer
recvcnt = $b4	; count of bytes remaining in receive buffer
errors	= $b5	; DSR, DCD, and received data errors information
xmiton	= $b6	; storage location for model of command register
		; which turns both receive and transmit interrupts on
xmitoff	= $bd	; storage location for model of command register
		; which turns the receive interrupt on and the
		; transmit interrupt off

; SwiftLink/Turbo232
  io1	= $de00 ; Base Address of SwiftLink/Turbo232
; io1	= $df00 ; alternate address, not used here
port	= io1
slData    = port   ; SL/T232 data register
slStatus  = port+1 ; SL/T232 status register
slCommand = port+2 ; SL/T232 command register
slControl = port+3 ; SL/T232 control register

{'ifdef:swiftlib}
slClock   = port+7 ; SL/T232 clock generator
{'endif}

; Kernal routines:
findfn	= $f30f ; Find the File (lfn .x) in the Logical File Table
devnum	= $f31f ; Set Current Logical File, Device #, and Secondary Address
		; http://unusedino.de/ec64/technical/aay/c64/romf31f.htm
nofile	= $f701 ; Output I/O Error Messages: 'FILE NOT OPEN'
rstkey	= $fe56 ; check for an autostart cartridge?
		; http://unusedino.de/ec64/technical/aay/c64/romfe43.htm

; Pin	Signal	Signal Name		DTE Signal direction
; 1	DCD	Data Carrier Detect	In
; 2	RXD	Receive Data		In
; 3	TXD	Transmit Data		Out
; 4	DTR	Data Terminal Ready	Out
; 5	GND	Ground			-
; 6	DSR	Data Set Ready		In	(not connected with tcpser cable)
; 7	RTS	Request to Send		Out
; 8	CTS	Clear to Send		In	(6551 handles this automatically)
; 9	RI	Ring Indicator		In	not connected to ACIA

; $DE01 - SwiftLink status register (slStatus, stat* labels):

; .------------------------------ high if ACIA caused interrupt--
; :				not used in code below
; :
; :.--------------------------- reflects state of DCD line
; ::
; ::.------------------------ reflects state of DSR line
; :::
; :::.-------------------- high if xmit data register is empty
; ::::
; ::::.----------------- high if receive data register full
; :::::
; :::::.------------- high if overrun error
; ::::::
; ::::::.------- high if framing error
; :::::::
; :::::::.--- high if parity error
; 76543210

statDCD 	= {%:01000000}	; bit 6: 1=DCD high
			; #$40
				; bit 5: DSR
statTxDempty	= {%:00010000}	; bit 4: 1=transmit register empty
			; #$10
statRxDfull	= {%:00001000}	; bit 3: 1=receive register full
			; #$08	; bit 2: overrun error
				; bit 1: framing error
				; bit 0: parity error
				; IRQ DCD DSR TxE RxF Ovr Frm Par

; check marks for console:
ImageCD0 = {%:00000000}	; none
ImageCD1 = {%:00010000}	; carrier

; $DE02 - SwiftLink command register (slCommand, cmd* labels):
; Bit #0 acts as a "master control switch" for all interrupts and the chip
; itself. It must be set to enable any interrupts--if it is cleared, all
; interrupts are turned off and the receiver section of the chip is
; disabled. This bit also pulls the DTR line low to enable communication
; with the connected RS-232 device. Clearing this bit causes most Hayes-
; compatible modems to hang up (by bringing DTR high).

; FIXME: Jessie mentions a spurious interrupt is generated when toggling DTR.

; rns: so it looks like we don't want to disable IRQs on the chip.

;	      xxx-----	; bits 7-5: parity
;	      ---x----	; bit 4: echo (normally 0 for no echo)
;	      ----x---	; bit 3: TxD IRQ
;	      -----x--	; bit 2: RxD IRQ
;			;    10: TxD IRQ off, RTS low
;			;    01: TxD IRQ on
;	      ------x-	; bit 1: 1=using RxD IRQ
;	      -------x	; bit 0: ACIA IRQ "master control"
;			; 0=disable receiver entirely
;			; 1=enable IRQs

;             .------------------------- parity control,
;             :.------------------------ bits 7-5
;             ::.----------------------- 000 = no parity
;             :::
;             :::.----------------- bit 4: echo mode, 0 = no echo
;             ::::
;             ::::.------------ bits 3-2: transmit interrupt control
;             :::::.----------- 10 = xmit interrupt off, RTS low
;             ::::::
;             ::::::.------- receive interrupt control, 0 = enabled
;             :::::::
;             :::::::.--- IRQ control, 1 = IRQs enabled
;	  bit 76543210
cmdRtsOff= {%:00001101}	;
			; bit 3: 1 = TxD IRQ on
		; #$0c	; bit 2: 1 = RTS high
			; bit 1: 0 = RxD IRQ on
			; bit 0: 0 = DTR high (inactive)

cmdTxRxOff={%:00001011}	; TxD/RxD IRQ off, DTR low (comint0)
			; bit 3: 1 = TxD IRQ off
		; #$0b	; bit 2: 0 = RTS low
			; bit 1: 1 = RxD IRQ off
			; bit 0: 1 = DTR low (active)

cmdRxOn = {%:00001001}	; RxD IRQ on, RTS/DTR low (comint1)
			; bit 3: 1 = TxD IRQ off
		; #$09	; bit 2: 0 = RTS low
			; bit 1: 0 = RxD IRQ on
			; bit 0: 1 = DTR low (active)

cmdTxRxOn= {%:00000101} ; TxD + RxD IRQs on (comint2)
			; bit 3: 0 = TxD IRQ on
		; #$05	; bit 2: 1 = RTS high
			; bit 1: 0 = RxD IRQ on
			; bit 0: 1 = DTR low (active)

cmdDtrOff= {%:00000001} ; bit 0: 1 = DTR low (active)
		; #$01

; $DE03 - SwiftLink control register (slControl):
			; bit 4: clock source 1=internal
			; bits 3-0: baud rate

; forward branch (>) to local (@) labels instead of the global one
; defined in equates-2_0.asm:
setup:
	jmp >@setup	; $0800
inable:
	jmp >@inable	; $0803
disabl:
	jmp >@disabl	; $0806
; label already defined in equates
; (C:$a83c) h 0 ffff 20 09 08
; 098b
; aab7
	jmp >@rsget	; $0809
; label already defined in equates
; (C:$a83c) h 0 ffff 20 0c 08
; 098e
; bb1e
	jmp >@rsout	; $080c
setbaud:
	jmp >@setbaud	; $080f

; offsets are replaced with JMP
; the new vectors are stored in $03xx, their defaults are transferred back here after setup is done
; so (as an example): $18 $47 $09 => $4c $09 $74
vectbl:
;			; gets rewritten to:
oldnmi:
; test plan:
; watch exec $0800
; m 314 315 (get current irq vector) cd9c

;	byte $18	; NMINV: $fe47, fires only when RESTORE hit
;	byte $14	;  CINV: $cd9c, changing this hasn't worked yet
;	word slNmiHandler;$ (default) was $08a2
oldopen:
	byte $1a
	word newopen	; $f34a (default)
oldclose:
	byte $1c
	word newclose	; $f291 (default)
oldchkin:
	byte $1e
	word newchkin	; $f20e (default)

oldchkout:
	byte $20
	word newchkout	; $f250 (default)

oldclrchn:
	byte $22
	word newclrchn	; $f333 (default)
oldchrin:
	byte $24
	word newchrin	; $f157 (default)
; this was commented out in original code:
;oldchrout:
;	byte $26
;	word newchrout	; $cd83? ($f1ca default)
oldgetin:
	byte $2a
	word newgetin	; $f13e (default)
	byte 0

@setup:
; TODO: multiple people have mentioned VICE at startup has an RS232 IRQ pending
; which needs to be acknowledged, so do this. This does not happen on real hardware.

; SP at entry: f5
; At startup, $de01 (slStatus) reads %00010000: bit 4: 1=transmit register empty

; set acia for no parity check, no echo, disable transmit/receive interrupts (RTS and DTR high)
	lda #{%:00001001}	; #$09: or cmdTxRxOn
	sta slCommand

; reset rs232 input/output buffer head/tail pointers
	lda #$00
	sta rhead
	sta rtail
	sta thead
	sta ttail

	sta xmitcnt
	sta recvcnt

	sta errors

; set addresses of transmit ($0b00)/receive ($1000) buffers (they were $0b80/$0b00)
; $1000 is where the title screen was, doesn't seem to be used elsewhere in code
	sta rbuff
	sta tbuff
	lda #$0b
	sta rbuff+1
	lda #$10
	sta tbuff+1

; 1 stop bit, 8 bit word length, 19200 bps
	lda #{%:00011110}
	sta slControl

; set acia for no parity check, no echo, enable transmit/receive interrupts (RTS and DTR low)
	lda #{%:00001001}	; #$09: or cmdTxRxOn
	sta slCommand

;Besides initialization, also call the following code whenever the user
;changes parity or echo mode.

;It creates the "xmitoff" and "xmiton" models used by the interrupt
;handler and main program transmit routine to control the ACIA
;interrupt enabling. If you don't change the models' parity bits,
;you'll revert to "default" parity on the next NMI.

;initialize with transmit interrupts off since
;buffer will be empty
	sta xmitoff		; #$09, store as a model for future use
	and #{%:11110000}	; mask off interrupt bits, keep parity/echo bits
	ora #{%:00000101}	; and set bits to enable both transmit and
				; receive interrupts (equivalent to cmdTxRxOff)
	sta xmiton		; #$0b, store also for future use

; set up vectors:
	ldx #0
	lda #3
	sta 21		; <LINNUM, temp storage: $03xx

; this works fine...
setup1:
	lda vectbl,x	; get byte denoting offset into vector table at $0300
	beq setup3	; end of vectors
	sta 20		; >LINNUM, temp storage: $xxaa
	lda #$4c	; load JMP instruction
	sta vectbl,x	; replace offset with it
	inx
	ldy #0
setup2:
	lda vectbl,x	; get JMP from table
	pha		; push on stack
	lda (20),y	; get old vector (lda $0300,y)
	sta vectbl,x	; save it
	pla		; pop off stack
	sta (20),y
	iny
	inx
	cpy #2
	bcc setup2
	jmp setup1
setup3:
; something I added in an attempt to get the code to run without tapping Restore - doesn't work...

; http://www.devili.iki.fi/Computers/Commodore/C64/Programmers_Reference/Chapter_3/page_151.html#Other
; irq enable and irq status registers

; irq stuff here, too:
; https://github.com/Pinacolada64/ImageBBS/blob/9d2c53d00dd19206051d3304a24ce96150f3911b/v2/asm/intro.asm#L232
; "raster" is at $cd9a

; w exec .setup3
; change nmi (314/315) $fe47 to (slNmiHandler) which jumps to $fe47
; have tried (318/319) $cd9c but that doesn't seem to work
	sei
	lda $318	; get old NMI vector: $cd9c
	sta slNmiExit+1	; put at end of SL NMI handler
	lda $319
	sta slNmiExit+2

	lda #<slNmiHandler	; replace with SL NMI handler at main NMI routine
	sta $318
	lda #>slNmiHandler
	sta $319
	cli
; end of addition

	lda #xmiton	; #$09? rxd/txd irq on
	sta shcomm	; save rxd irq status
	sta slCommand
	jsr inable
	jsr setcarr

{'ifdef:set_parity}
; 		.------------------------- 0 = one stop bit
; 		:
; 		:.-------------------- word length, bits 6-7
; 		::.------------------- 0 = eight bit word
; 		:::
; 		:::.-------------- clock source, 1 = internal generator
; 		::::
; 		::::.----- baud
; 		:::::.---- rate
; 		::::::.--- bits
; 		:::::::.-- 0-3
;	bit	76543210
	lda #{%:00011010}	; bit 4=1: internal generator
				; bits 3210=1010:
	sta slControl

; The ACIA "command" register controls the parity, echo mode, transmit and
; receive interrupt enabling, hardware "BRK", and (indirectly) the "RTS"
; and "DTR" lines. The value below sets the ACIA for no parity check,
; no echo, disables transmit interrupts, and enables receive interrupts
; (RTS and DTR low).

; 		.------------------------- parity control,
; 		:.------------------------ bits 5-7
; 		::.----------------------- 000 = no parity
; 		:::
; 		:::.----------------- echo mode, 0 = normal (no echo)
; 		::::
; 		::::.------------ transmit interrupt control, bits 2-3
; 		:::::.----------- 10 = xmit interrupt off, RTS low
; 		::::::
; 		::::::.------- receive interrupt control, 0 = enabled
; 		:::::::
; 		:::::::.--- DTR control, 1 = DTR low
;	bit	76543210
;	lda #{%:00001001}	; bits 7-5=000: no parity

; setting "space" parity here so that tcpser enters 8-bit binary mode
	lda slCommand
	and #{%:11100000}	; bits 7-5=111: space parity
	sta slCommand
{'endif}

	lda #$06		; start at 19.2Kbps
	jmp setbaud

;
; ** enable nmi
;
@inable:
	php
	pha
	lda #cmdTxRxOn	; 2.0 #$05
;	lda #$09	; 1.2
	sta slCommand
	pla
	plp
	rts

;
; ** disable nmi
;
@disabl:
	php
	pha
	lda #cmdTxRxOff	; comint0 - #$0b TxD/RxD IRQs disabled
	sta slCommand
	pla
	plp
	rts

;
; ** rs232 getin
; keep in mind buffer is $80 chars
; on exit: .cs=char .a received
;
@rsget:
	sta ptr1	; $9e
	sty xsav	; $97
	lda slStatus
	and #{%:00001000};if bit 3 not set,
	beq ret2	; no received byte in acia, restore registers
	lda slData	; get received byte
	ldy rtail	; index to buffer
	cpy #$80	; 127 bytes
	bcc ret1	; buffer full
	sta (rbuff),y	; and store it
	inc rtail	; move index to next slot
	inc recvcnt	; increment # of bytes received
; added code from rs232-user.asm:rsget1
	ldy scnmode
	bne ret1
	ldy #0
inpdisp:
; scroll input window
	lda sdisp+2,y
	sta sdisp+1,y
	iny
	cpy #9
	bcc inpdisp	; <9? loop back
	lda ptr1	; $9e
	sta sdisp+10	; put last char rec'd
; end of addition
	lda rtail	; input buffer end
	sec
	sbc rhead	; input buffer start
	and #127	;???
	cmp #100	;???
	bcs ret1	; >100 chars in buffer? return
	lda shcomm
	sta slCommand
ret1:
	clc
ret2:
	ldy xsav	; $97
	lda ptr1	; $9e
	rts

;
; ** rs232 bsout
;
; Briefly, each buffer has a "head" and "tail" pointer.
; The head points to the next byte to be removed from the buffer.
; The tail points to the next free location in which to store a byte.
; If the head and tail both point to the same location, the buffer is empty.
; If (tail + 1) = head, the buffer is full.

; *** buffers are $80 (127) bytes ***

@rsout:
 	sta ptr1	; $9e - save char to send in .a
 	sty xsav	; $97
 	lda #cmdTxRxOff	; comint0
 	sta slCommand
 	lda xmitcnt	; any characters to transmit?
 	beq ret1	; no, restore registers
waitTxEmpty:
	lda slStatus
	and #{%:00010000}	; bit 4: 1=transmit register empty?
	beq waitTxEmpty		; yes
xmitchar:
	ldy thead		; get transmit buffer head
	lda (tbuff),y		; get character at head of buffer
	sta slData		; place in acia for transmit
	inc thead		; point to next character in buffer,
				; store new index
	dec xmitcnt		; subtract one from count of bytes
				; in xmit buffer
	beq ret1		; nothing left to transmit

; adding "scroll output window" from rs232-user.asm:
	ldy scnmode	; split screen?
	bne rsout4	; 1=no
	pha		; char still in .a
	ldy #0
outdisp:
	lda sdisp+30,y
	sta sdisp+29,y
	iny
	cpy #9
	bcc outdisp
	pla
	sta sdisp+38
; end addition
rsout4:
	lda #cmdTxRxOn	; comint2
	sta shcomm
;me	lda shcomm
;me	and #cmdTxRxOn	; txd/rxd enabled
;	lda shcomm
	sta slCommand
	jmp ret1	; restore registers

@setbaud:
; &,40,.a=param
; enter with baud rate # from 'bauds' table in .a
; or:
; &,41,254 sets DTR high, &,41,255 sets DTR low (from sub.modem 60305)
	cmp #254	; %11111110
	bcc setbaud3	; <254=baud rate change
	stx >@savex+1
	ldx #$01	; .x=$01: DTR low
	beq setDtr	; .a=$ff: DTR low
	dex		; .x=$00: DTR high
setDtr:
	stx slCommand	; $de02: DTR state
@savex:
	ldx #$ff	; restore .x
	rts
;	bmi $ffff	; branch if N=1 (%1xxxxxxx)

setbaud3:
	and #7
	tay
	lda bauds,y
	sta slControl
	rts

setcarr:
; check for DCD, update $d009 (carrier) with status
; equivalent on user port is $dd01 bit 4
; carrier checkmark is in irqhn.asm, irq5
;me	pha		; holds mask to re-enable interrupts on the ACIA
	ldy #ImageCD1	; check mark indicator
	lda slStatus
 	and #statDCD	; get DCD from status register
 	beq setcarr1	; carrier present
 	ldy #ImageCD0	; otherwise no check mark
setcarr1:
	sty carrier	; store DCD status
;me	pla		; restore interrupt status
	rts
;
; ** new nmi routine
;
slNmiHandler:
; USRADD $312-313: 0c1b usr(0) address
; CINV   $314-315: cd9c main IRQ
; CBINV  $316-317: fe66 [default]
; NMINV  $318-319: 088a NMI routine
; this gets executed when Restore is tapped (generates NMI)
; IBSOUT $326-327: cd83

; FIXME: a) can we chain this to CINV?
; b) change cinv instead of nminv

; 3/10/20: new info
;	lda #{%:10000000}; bit 7=irq acknowledge
;	sta $d019	; IRQ status register: acknowledge nmi

	inc $0400	; just to see that we got here
	pha		; push .a
	txa
	pha		; push .x
	tya
	pha		; push .y
	cld

	lda slStatus

; Now prevent any more NMIs from the ACIA
	ldx #{%:00000011}	; disable all interrupts, bring RTS inactive, and
				; leave DTR active (0)
	stx slCommand		; send to ACIA-- code at end of interrupt handler
				; will re-enable interrupts
	sta errors		; this is really a copy of slStatus to be gotten again
	and #{%:00010000}	; mask out transmit interrupt indicator
	beq >@
	jsr rsget		; receive characters
@:
	lda errors
	and #{%:00001000}	; mask out receive interrupt indicator
	beq slNmiExit

	jsr rsout		; transmit characters
	lda shcomm		; shadow of slCommand
	sta slCommand

	lda #xmitoff		; #$09: disable TxD IRQ
nmiCommand:
	sta slCommand
slNmiExit:
;	lda #{%:10000000}; bit 7=irq enable
;	sta $d01a	; IRQ enable register: allow IRQs

	pla
	tay			; pull .y
	pla
	tax			; pull .x
	pla			; pull .a
	rti

; this crashes?
;slNmiExit:
;	jmp $cd9a	; raster -> $febc (which is pla...rti above)

; original code:
;	jmp rstkey	; $fe56 causes BASIC warm start :(

; the commented out slNmiExit on line 628 is compatible with setup3 - the usual interrupt vector will push some stuff then call ($314), which gets replaced with slNmiHandler
; then slNmiHandler jumps to the original handler in ($314) - which, I'm guessing, warm resets BASIC
; the uncommented slNmiExit won't work real well either, since the default handler will push A, X, and Y
; but slNmiExit then does an rti - the stack still contains the original y, x, a
; setup3: is writing a chain IRQ jump target to slNmiExit, which isn't compatible with the code there that does some pops and an rti - the commented out version just below that does a jump should work with that chaining
; if chaining jumps to a badly behaved IRQ handler you could instead jump directly to $EA31 where the C64's default IRQ handler is
; but rti is not right for a handler vector stored in $314
; if it's meant to be an NMI handler it should be stored at $318,319, should not chain (the default NMI handler does a warm reset), and should do the push/pops your code has

nosuch:
	jmp nofile	; $f701

newchkin:
	stx xtmp
	jsr findfn	; $f30f
	bne nosuch
	jsr devnum	; $f31f
	ldx xtmp
	lda $ba		; current device
	cmp #2		; rs232?
	bne newchkin1
	sta dfltn	; $99 - input device
	clc
	jmp inable

newchkin1:
	jsr disabl
	jsr oldchkin
	jmp inable

newchkout:
	stx xtmp
	jsr findfn	; $f30f
	bne nosuch
	jsr devnum	; $f31f
	ldx xtmp
	lda $ba		; current device
	cmp #2		; rs232?
	bne newchkout1
	sta dflto	; $9a - default output device
	clc
	jmp inable

newchkout1:
	jsr disabl
	jsr oldchkout
	jmp inable

newgetin:
	pha
	lda dflto	; $9a - default output device
	cmp #2
	bne notmodem
	pla
	jmp rsget

notmodem:
	pla		;
	jsr disabl
	jsr oldgetin
	jmp inable

;newchrout:
;	jsr disabl
;	jsr oldchrout
;	jmp inable

newopen:
	jsr disabl
	jsr oldopen
	jmp inable

newclose:
	jsr disabl
	jsr oldclose
	jmp inable

newclrchn:
	jsr disabl
	jsr oldclrchn
	jmp inable

newchrin:
	jsr disabl
	jsr oldchrin
	jmp inable

bauds:
; bit 4=1: use internal clock generator
	byte {%:00010101} ; 0300
	byte {%:00010110} ; 0600
	byte {%:00010111} ; 1200
	byte {%:00011000} ; 2400
	byte {%:00011010} ; 4800
	byte {%:00011100} ; 9600
	byte {%:00011110} ;19200
	byte {%:00011111} ;38400

shcomm:
; saves SwiftLink RxD/TxD IRQ status, DTR status
; "SHadow" register?
	byte cmdRxOn	; initialize with RxD IRQ on, DTR low
			; (to get init commands, I guess)

xtmp:
	byte 0
{else}
orig $0800
{info:INFO: Using 1.2's ml.rs232}
; image 1.2 swiftlink driver - re-sourcing
rsinit:
	jmp >@rsinit	; 4300  4c 36 43
;rsinabl:
	jmp >@rsinabl	; 4303  4c de 43
;rsdisab:
	jmp >@rsdisab	; 4306  4c d4 43
;rsget:
	jmp >@rsget	; 4309  4c 26 44
;rsout:
	jmp >@rsout	; 430c  4c e8 43
;rsbaud:
	jmp >@rsbaud	; 430f  4c 4f 44

bauds:
; bit 4=1: use internal clock generator
	byte {%:00010101};4312  15   300
	byte {%:00010110};4313  16   600
	byte {%:00010111};4314  17  1200
	byte {%:00011000};4315  18  2400
	byte {%:00011010};4316  1a  4800
	byte {%:00011100};4317  1c  9600
	byte {%:00011110};4318  1e 19200
	byte {%:00011111};4319  1f 38400

vectors:
; 0316 - brk
;	byte $16	; 431a  16
;oldbrk:
;	word newbrk	; 431b  97 44
; 0318 - nmi
oldnmi:
	byte $18	; 431d  18
	word newnmi	; 431e  91 43
; 031a - open
oldopen:
	byte $1a	; 4320  1a
	word newopen	; 4321  73 44
; 031c - close
oldclose:
	byte $1c	; 4323  1c
	word newclose	; 4324  7c 44
; 031e - chkin
oldchkin:
	byte $1e	; 4326  1e
	word newchkin	; 4327  f7 43
; 0322 - clrchn
oldclrchn:
	byte $22	; 4329  22
	word newclrchn	; 432a
; 0324 - chrin
oldchrin:
	byte $24	; 432c  24
	word newchrin	; 432d
; 0326 - chrout
oldchrout:
	byte $26	; 432f  26
	word newchrout	; 4330  6a 44
; 032a - getin
oldgetin:
	byte $2a	; 4332  2a
	word newgetin	; 4333  1e 44
; end of table
	byte $00	; 4332  00

@rsinit:
; TxD/RxD IRQ off, DTR low (comint0)
	lda #$0b        ; 4336  a9 0b
	sta $de02       ; 4338  8d 02 de
; set up vectors
	ldx #$00        ; 433b  a2 00
	lda #$03        ; 433d  a9 03
	sta $15		; 433f  85 15
l4341:
	lda vectors,x	; 4341  bd 1a 43
	beq l4365       ; 4344  f0 1f
	sta $14		; 4346  85 14
	lda #$4c        ; 4348  a9 4c
	sta vectors,x	; 434a  9d 1a 43
	inx		; 434d  e8
	ldy #$00        ; 434e  a0 00
l4350:
	lda vectors,x	; 4350  bd 1a 43
	pha		; 4353  48
	lda ($14),y     ; 4354  b1 14
	sta vectors,x	; 4356  9d 1a 43
	pla		; 4359  68
	sta ($14),y     ; 435a  91 14
	iny		; 435c  c8
	inx		; 435d  e8
	cpy #$02        ; 435e  c0 02
	bcc l4350       ; 4360  90 ee
	jmp l4341       ; 4362  4c 41 43
l4365:
	lda #$00        ; 4365  a9 00
	sta $de01       ; 4367  8d 01 de
; enable RxD IRQ
	lda #$09        ; 436a  a9 09
	sta $de02       ; 436c  8d 02 de
; cia #2 data direction register b:
; set bit 4 to output - why?
	lda #$10        ; 436f  a9 10
	sta $dd03       ; 4371  8d 03 dd
	ldx #$00        ; 4374  a2 00
; check for DCD:
	lda $de01       ; 4376  ad 01 de
	and #$40        ; 4379  29 40
	beq l437f       ; 437b  f0 02
	ldx #$10        ; 437d  a2 10
l437f:
	stx cfff       ; 437f  8e ff cf
	lda #$02        ; 4382  a9 02
	jmp >@rsbaud	; 4384  4c 4f 44
l4387:
; from 43a3:
; enable RxD IRQ:
	lda #$09        ; 4387  a9 09
	sta $de02       ; 4389  8d 02 de
	ldy #$00        ; 438c  a0 00
	jmp $fe56       ; 438e  4c 56 fe

newnmi:
	pha		; 4391  48
	txa		; 4392  8a
	pha		; 4393  48
	tya		; 4394  98
	pha		; 4395  48
	cld		; 4396  d8
; get SwiftLink status
	lda $de01       ; 4397  ad 01 de
; TxD/RxD IRQs off:
	ldx #$0b        ; 439a  a2 0b
	stx $de02       ; 439c  8e 02 de
; %10001000? what is it comparing against?
	and #$88        ; 439f  29 88
	beq l4387       ; 43a1  f0 e4
	ldx #$00        ; 43a3  a2 00
; get SwiftLink status
	lda $de01       ; 43a5  ad 01 de
; bit 6: DCD high
	and #$40        ; 43a8  29 40
	beq l43ae       ; 43aa  f0 02
	ldx #$10        ; 43ac  a2 10
l43ae:
	stx cfff       ; 43ae  8e ff cf
; get SwiftLink status
	lda $de01       ; 43b1  ad 01 de
; receive register full?
	and #$08        ; 43b4  29 08
; yes
	beq l43c9       ; 43b6  f0 11
; get byte from acia
	lda $de00       ; 43b8  ad 00 de
; get rs232 recv buffer tail pointer
	ldy $029b       ; 43bb  ac 9b 02
; FIXME: moving 2.0's recv buffer is at $1000
	sta $1000,y     ; 43be  99 00 cb
	iny		; 43c1  c8
	bpl l43c6       ; 43c2  10 02
	ldy #$00        ; 43c4  a0 00
l43c6:
; update rs232 recv buffer tail pointer
	sty $029b       ; 43c6  8c 9b 02
l43c9:
; re-enable RxD IRQ:
	lda #$09        ; 43c9  a9 09
	sta $de02       ; 43cb  8d 02 de
	pla		; 43ce  68
	tay		; 43cf  a8
	pla		; 43d0  68
	tax		; 43d1  aa
	pla		; 43d2  68
	rti		; 43d3  40

@rsdisab:
	php		; 43d4  08
	pha		; 43d5  48
	lda #$0b        ; 43d6  a9 0b
	sta $de02       ; 43d8  8d 02 de
	pla		; 43db  68
	plp		; 43dc  28
	rts		; 43dd  60

@rsinabl:
	php		; 43de  08
	pha		; 43df  48
	lda #$09        ; 43e0  a9 09
	sta $de02       ; 43e2  8d 02 de
	pla		; 43e5  68
	plp		; 43e6  28
	rts		; 43e7  60

@rsout:
	sta $9e		; 43e8  85 9e
l43ea:
; get SwiftLink status
	lda $de01       ; 43ea  ad 01 de
; bit 4: is TxD empty?
	and #$10        ; 43ed  29 10
; yes
	beq l43ea       ; 43ef  f0 f9
	lda $9e		; 43f1  a5 9e
; put it in the acia
	sta $de00       ; 43f3  8d 00 de
	rts		; 43f6  60

newchkin:
	stx l441d       ; 43f7  8e 1d 44
	jsr $f30f       ; 43fa  20 0f f3
	bne l440e       ; 43fd  d0 0f
	jsr $f31f       ; 43ff  20 1f f3
	lda $ba		; 4402  a5 ba
	cmp #$02        ; 4404  c9 02
	bne l4411       ; 4406  d0 09
	sta $99		; 4408  85 99
	clc		; 440a  18
	jmp <@rsinabl	; 440b  4c de 43
l440e:
	jmp $f701       ; 440e  4c 01 f7
l4411:
	ldx l441d	; 4411  ae 1d 44
	jsr <@rsdisab	; 4414  20 d4 43
	jsr oldchkin	; 4417  20 26 43
	jmp <@rsinabl	; 441a  4c de 43
l441d:
	brk		; 441d  00

newgetin:
	pha		; 441e  48
	lda $9a		; 441f  a5 9a
	cmp #$02        ; 4421  c9 02
	bne l4445	; 4423  d0 20
	pla		; 4425  68
@rsget:
	sta $9e		; 4426  85 9e
	sty $97		; 4428  84 97
	ldy $029c       ; 442a  ac 9c 02
	cpy $029b       ; 442d  cc 9b 02
	beq l4440       ; 4430  f0 0e
; FIXME: moving 2.0's xmit buffer to $0b00
	lda $0b00,y     ; 4432  b9 00 cb
	sta $9e		; 4435  85 9e
	iny		; 4437  c8
	bpl l443c       ; 4438  10 02
	ldy #$00        ; 443a  a0 00
l443c:
	sty $029c       ; 443c  8c 9c 02
; added code from rs232-user.asm:rsget1
	ldy scnmode
	bne l4440
	ldy #0
inpdisp:
; scroll input window
	lda sdisp+2,y
	sta sdisp+1,y
	iny
	cpy #9
	bcc inpdisp	; >9? loop back
	lda ptr1	; $9e
	sta sdisp+10	; put last char rec'd
; end of addition
	clc		; 443f  18
l4440:
	ldy $97		; 4440  a4 97
	lda $9e		; 4442  a5 9e
	rts		; 4444  60
l4445:
	pla		; 4445  68
	jsr <@rsdisab	; 4446  20 d4 43
	jsr oldgetin	; 4449  20 32 43
	jmp <@rsinabl	; 444c  4c de 43

@rsbaud:
	cmp #$fe        ; 444f  c9 fe
	bcc l4460       ; 4451  90 0d
	beq l445a       ; 4453  f0 05
	lda #$09        ; 4455  a9 09
	jmp l445c       ; 4457  4c 5c 44
l445a:
	lda #$08        ; 445a  a9 08
l445c:
	sta $de02       ; 445c  8d 02 de
	rts		; 445f  60

l4460:
	and #$07        ; 4460  29 07
	tay		; 4462  a8
	lda bauds,y     ; 4463  b9 12 43
	sta $de03       ; 4466  8d 03 de
	rts		; 4469  60

newchrout:
	jsr <@rsdisab	; 446a  20 d4 43
	jsr oldchrout	; 446d  20 2f 43
	jmp <@rsinabl	; 4470  4c de 43

newopen:
	jsr <@rsdisab	; 4473  20 d4 43
	jsr oldopen	; 4476  20 20 43
	jmp <@rsinabl	; 4479  4c de 43

newclose:
	jsr <@rsdisab	; 447c  20 d4 43
	jsr oldclose	; 447f  20 23 43
	jmp <@rsinabl	; 4482  4c de 43

newclrchn:
	jsr <@rsdisab	; 4485  20 d4 43
	jsr oldclrchn	; 4488  20 29 43
	jmp <@rsinabl	; 448b  4c de 43

newchrin:
	jsr <@rsdisab	; 448e  20 d4 43
	jsr oldchrin	; 4491  20 2c 43
	jmp <@rsinabl	; 4494  4c de 43
cfff:
	byte $00
{endif}
	addrcheck $0a7f	; 49 bytes free
