; 5/Jun/2016 21:43 - assemble with casm 4.0 beta
{uses:..\equates-2_0.asm}

; cd /home/ryan/c64/Image BBS/git/ImageBBS/v2/asm/rs232
; ll "rs232-swift.sym"

; FIXME: loop checking for read/write status $02a1 (ENABL); just > 2a1 00 continues

; There are a few problems/things I want to improve with with this version of the SwiftLink driver:
; 1) 19.2k communication "looks slower", according to others.
; Not sure why yet.  Wrong BPS rate, I'm guessing?

; 2) Testing out setting parity to "space" so tcpser enters 8-bit binary mode
; (shouldn't get "stuck" during a file transfer looking for valid telnet NVT IAC $ff responses)
; (another option might be to put setting the parity parameter in the OPEN 2 statement in "im")
{undef:set_parity}

; 3) testing out whether un-commenting 'oldchrout' and 'newchrout' routines actually does anything.
; The code was commented out in the FastAssembler version.
; when the code is uncommented, it outputs lots of data even if DCD is not asserted.
; {undef:comment_out} allows the 'oldchrout' and 'newchrout' code to be included in the final binary.
{undef:comment_out}

; 4) It has been reported that while the BBS is online, if it loads a (large?)
;	module, and the user keeps typing during the load, the loaded module is corrupt.
;	CTS is handled by the 6551, so an IRQ problem?
;	"rsdisab" is called before a load in "disk-io.asm"

; from "fast assembler":
; for pass=1 to 3:org $0800,-(pass=3),8,"@:ml.rs232/swift"

; gets relocated when LOADed and &,16,1 is issued at BBS init
orig $0800

; SwiftLink/Turbo232
  io1	= $de00 ; Base Address of SwiftLink/Turbo232
; io1	= $df00 ; alternate address, not used here
port	= io1
slData    = port   ; SL/T232 data register
slStatus  = port+1 ; SL/T232 status register
slCommand = port+2 ; SL/T232 command register
slControl = port+3 ; SL/T232 control register

{ifdef:swiftlib}
slClock   = port+7 ; SL/T232 clock generator
{endif}

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
; 6	DSR	Data Set Ready		In
; 7	RTS	Request to Send		Out
; 8	CTS	Clear to Send		In	(6551 handles this automatically)
; 9	RI	Ring Indicator		In

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
;             :::::::.--- DTR control, 1 = DTR low
;	  bit 76543210
cmdRtsOff= {%:00001100}	;
			; bit 3: 1 = TxD IRQ on
		; #$0c	; bit 2: 1 = RTS high
			; bit 1: 0 = RxD IRQ on
			; bit 0: 0 = DTR high (inactive)

cmdTxRxOff={%:00001011}	; TxD/RxD IRQ off, DTR low (comint0)
			; bit 3: 1 = TxD IRQ off
		; #$0b	; bit 2: 0 = RTS low
			; bit 1: 1 = RxD IRQ off
			; bit 0: 1 = DTR low

cmdRxOn = {%:00001001}	; RxD IRQ on, RTS/DTR low (comint1)
			; bit 3: 1 = TxD IRQ off
		; #$09	; bit 2: 0 = RTS low
			; bit 1: 0 = RxD IRQ on
			; bit 0: 1 = DTR low

cmdTxRxOn= {%:00000101} ; TxD + RxD IRQs on (comint2)
			; bit 3: 0 = TxD IRQ on
		; #$05	; bit 2: 1 = RTS high
			; bit 1: 0 = RxD IRQ on
			; bit 0: 1 = DTR low

cmdDtrOff= {%:00000001} ; bit 0: 1 = DTR low
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
	jmp >@rsget	; $0809
; label already defined in equates
	jmp >@rsout	; $080c
setbaud:
	jmp >@setbaud	; $080f

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

; these vectors are replaced with their defaults after setup is done
vectbl:
;			; gets rewritten to:
oldnmi:	; $81b
	byte $18	; was $18, NMINV
;	byte $14	; changing  CINV doesn't work
	word slNmiHandler;$fe47 (default) was $08a2
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
oldchrout:
	byte $26
	word newchrout	; $cd83? ($f1ca default)
oldgetin:
	byte $2a
	word newgetin	; $f13e (default)
	byte 0

@setup:
; TODO: multiple people have mentioned VICE at startup has an RS232 IRQ pending
; which needs to be acknowledged, so do this. This does not happen on real hardware.

; At startup, $de01 (slStatus) reads %00010000: bit 4: 1=transmit register empty
{ifdef:swiftlib}
	lda $318
	sta slNmiSave+1
	lda $319
	sta slNmiSave+2
{endif}

; reset rs232 buffer start/end pointers
	lda #$00
	sta ridbs
	sta rodbs
	sta ridbe
	sta rodbe

; set acia for no parity check, no echo, disable transmit interrupt, and enable receive interrupts (RTS and DTR low)
	lda #{%:00001001}
	sta slCommand

;Besides initialization, also call the following code whenever the user
;changes parity or echo mode.

;It creates the "xmitoff" and "xmiton" models used by the interrupt
;handler and main program transmit routine to control the ACIA
;interrupt enabling. If you don't change the models' parity bits,
;you'll revert to "default" parity on the next NMI.

;initialize with transmit interrupts off since
;buffer will be empty

      sta    xmitoff       ;store as a model for future use
      and    #{%:11110000}    ;mask off interrupt bits, keep parity/echo bits
      ora    #{%:00000101}    ;and set bits to enable both transmit and
                           ;receive interrupts
      sta    xmiton        ;store also for future use

; set up vectors:
	ldx #0
	lda #3
	sta 21		; <LINNUM, temp storage: $03xx

;	sei		; won't work with changing $314/315
setup1:
	lda vectbl,x	; get byte denoting offset into vector table at $0300
	beq setup3
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
;	cli		; doesn't work
	lda #0
	lda #xmiton	; rxd/txd irq on
	sta shcomm	; save rxd irq status
	sta slStatus
	jsr inable
	jsr setcarr

{ifdef:set_parity}
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
{endif}

	lda #7		; start at 19.2Kbps
	jmp setbaud

setcarr:
; check for DCD, update $d009 (carrier) with status
; user port is $dd01 bit 4 - carrier checkmark is in irqhn.asm
	pha		; holds mask to re-enable interrupts on the ACIA
	ldy #ImageCD1	; check mark indicator
	lda slStatus
 	and #statDCD	; get DCD from status register
 	beq setcarr1	; carrier present
 	ldy #ImageCD0	; otherwise no check mark
setcarr1:
	sty carrier	; store DCD status
	pla		; restore interrupt status
	rts

; ** new nmi routine
;
slNmiHandler:
; USRADD $312-313: c000 usr(0) address
; CINV   $314-315: cd9c main IRQ
; CBINV  $316-317: fe66 [default]
; NMINV  $318-319: 088a NMI routine
; this gets executed when Restore is tapped
; IBSOUT $326-327: cd83

; FIXME: a) can we chain this to CINV?
; b) change cinv instead of nminv

	pha
	txa
	pha
	tya
	pha
	cld

	lda slStatus
; Now prevent any more NMIs from the ACIA
	ldx #{%:00000011}	; disable all interrupts, bring RTS inactive, and
				; leave DTR active (0)
	stx slCommand		; send to ACIA-- code at end of interrupt handler
				; will re-enable interrupts
	and #{%:00011000}	; mask out all but transmit and
				; receive interrupt indicators
	beq slNmiExit

	jsr rsint		; receive/transmit chars
	lda #shcomm
	sta slCommand
slNmiExit:
	lda #xmiton		; #$09: enable Tx/Rx IRQs
	sta slCommand

	pla
	tay
	pla
	tax
	pla
	rti

;
; ** check for incoming character:
; returns received char in .a
;
rsint:
	jsr setcarr
	lda slStatus
	and #{%:00001000}; bit 3=byte received?
	beq xmitchar	; yes
	lda slData
	ldy ridbe
	sta ribuf,y
	iny
	bpl rsint1
	ldy #0
rsint1:
	sty ridbe
	tya
	sec
	sbc ridbs
	and #127
	cmp #120
	bcc xmitbyte
;	lda #comRTS0	; drop rts?
;	sta slCommand
;
; ** check if ok to transmit
; w exec .rsint2
; del <breakpoint>
;
xmitbyte:
	lda slStatus
	and #{%:00010000}	; bit 4: 1=transmit register empty?
	beq xmitbyte	; yes
xmitchar:
	ldy rodbs
	lda robuf,y
	sta slData
	iny		; move output buffer pointer
	bpl rsint3
	ldy #0
rsint3:
	sty rodbs	; update buffer start
	cpy rodbe
	bne rsint4
	lda #xmiton	; txd irq on
	sta shcomm
rsint4:
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
; ** enable nmi
;
@inable:
	php
	pha
	lda #cmdRxOn	; #$09
	sta slCommand
;me	lda slCommand
;me	and shcomm
;me	sta slCommand
	pla
	plp
	rts
;
; ** rs232 bsout
;
rsout0:
	jsr rsint	; send/receive char
	jmp rsout1

@rsout:
	sta ptr1	; $9e - save char to send in .a
	sty xsav	; $97
	lda #cmdTxRxOff ; comint0
	sta slCommand
rsout1:
	lda ptr1	; $9e - get char to send from .a
	ldy rodbe	; output buffer end pointer
	sta robuf,y
	iny
	bpl rsout2
	ldy #0
rsout2:
	cpy rodbs	; ouput buffer start pointer
	beq rsout0
	sty rodbe
; adding "scroll output window" from rs232-user.asm:
	ldy scnmode	; split screen?
	bne rsout4	; 1=no
	pha		; char in .a
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
	lda #cmdTxRxOn	; comint2
	sta shcomm
rsout4:
;me	lda shcomm
;me	and #cmdTxRxOn	; txd/rxd enabled
	lda shcomm
	sta slCommand
	jmp ret1

xtmp:
	byte 0

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
	bne notget
	pla
;
; ** rs232 getin
;
@rsget:
	sta ptr1	; $9e
	sty xsav	; $97
	ldy ridbs	; get input buffer start
	cpy ridbe	; compare to input buffer end
	beq ret2
	lda ribuf,y
	sta ptr1	; $9e
	iny
	bpl rsget1
	ldy #0
rsget1:
	sty ridbs
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
	bcc inpdisp
	lda ptr1	; $9e
	sta sdisp+10	; put last char rec'd
; end of addition
	lda ridbe
	sec
	sbc ridbs
	and #127
	cmp #100
	bcs ret1
	lda shcomm
	sta slCommand
ret1:
	clc
ret2:
	ldy xsav	; $97
	lda ptr1	; $9e
	rts

notget:
	pla
	jsr disabl
	jsr oldgetin
	jmp inable

@setbaud:
; enter with baud rate # from 'bauds' table in .a
	cmp #254
	bcc setbaud3
	beq setbaud1
	lda slCommand
	and shcomm	; get saved rxd/txd status
	jmp setbaud2
setbaud1:
	and #cmdDtrOff	; dtr off
setbaud2:
	sta slCommand
	rts
setbaud3:
	and #7
	tay
	lda slControl
	and bauds,y
	ora #cmdDtrOff	; 0 = DTR high
	sta slControl
{ifdef:swiftlib}
; from SwiftLib
	lda slTemp
	and #{%:11100000}
	ora #{%:00010000}
	sta slTemp
	txa
	and #$0f
	ora slTemp
	sta slControl
; set clock generator bit
	txa
	and #$30
	beq >@
	lsr
	lsr
	lsr
	lsr
	eor #$03
	sta slClock
; set new parity
@:
	lda slTemp+1
{endif}

	rts

newchrout:
	jsr disabl
	jsr oldchrout
	jmp inable

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

xmiton:
	byte $ff	; storage location for model of command register
			; which turns both receive and transmit interrupts on
xmitoff:
	byte $ff	; storage location for model which turns the receive interrupt
			; on and the transmit interrupt off

	addrcheck $0a7f
