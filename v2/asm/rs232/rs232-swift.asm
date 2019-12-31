; 5/Jun/2016 21:43 - assemble with casm 4.0 beta
{uses:..\equates-2_0.asm}

; There are a few problems/things I want to improve with with this version of the SwiftLink driver:
; 1) 19.2k communication "looks slower", according to others.
; Not sure why yet.  Wrong BPS rate, I'm guessing?

; 2) Testing out setting parity to "space" so tcpser enters 8-bit binary mode
; (shouldn't get "stuck" during a file transfer looking for valid telnet NVT IAC $ff responses)
; (another option might be to put setting the parity parameter in the OPEN 2 statement in "im")
{undef:set_parity}

; 3) testing out whether un-commenting 'oldout' and 'nchrout' routines actually does anything.
; The code was commented out in the FastAssembler version.
; when the code is uncommented, it outputs lots of data even if DCD is not asserted.
; {undef:comment_out} allows the 'oldout' and 'nchrout' code to be included in the final binary.
{def:comment_out}

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
; io2	= $df00 ; alternate address, not used here
port	= io1
slData    = port   ; SL/T232 data register
slStatus  = port+1 ; SL/T232 status register
slCommand = port+2 ; SL/T232 command register
slControl = port+3 ; SL/T232 control register

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

; $DE01 - SwiftLink status register (slStatus):

statint	= {%:10000000}	; bit 7: 1=ACIA IRQ occurred
statdcd	= {%:01000000}	; bit 6: DCD: 1=Active
			; bit 5: DSR: unused
stattxd	= {%:00010000}	; bit 4: 1=transmit register empty
statrxd	= {%:00001000}	; bit 3: 1=receive register full
			; bit 2: overrun error
			; bit 1: framing error
			; bit 0: parity error

statcd0 = {%:00000000}	; bit 6: 0=carrier detect low
statcd1 = {%:01000000}	; bit 6: 1=carrier detect high

; $DE02 - SwiftLink command register (slCommand):

;	      xxx-----	; bits 7-5: parity
;	      ---x----	; bit 4: echo (should be 0)
;	      ----x---	; bit 3: 1=disable TXD IRQ
;	      -----x--	; bit 2: 1=enable RXD IRQ
;			; bits 3 and 2: 10 = TXD IRQ off, RTS low
;	      ------x-	; bit 1: 1=enable RXD IRQ
;	      -------x	; bit 0: ACIA IRQ "master control"
;			; 0=disable receiver entirely

;        bit 76543210
comint0	= {%:00001010}	; TxD/RxD/ACIA IRQ off, DTR high
			; bit 3: 1 = TxD IRQ off
			; bit 2: 0 = RTS low
			; bit 1: 1 = RxD IRQ off
			; bit 0: 0 = DTR high

comint1	= {%:00001001}	; RxD IRQ off, DTR low
			; bit 3: 1 = TxD IRQ off
			; bit 2: 0 = RTS low
			; bit 1: 0 = RxD IRQ on
			; bit 0: 1 = DTR low

comint2	= {%:00000101}	; TxD + RxD IRQs on
			; bit 3: 0 = TxD IRQ on
			; bit 2: 1 = RTS high
			; bit 1: 0 = RxD IRQ on
			; bit 0: 1 = DTR low

comdtr0	= {%:00001000}	; bit 3: 1 = DTR disabled
comrts0	= {%:00000001}	; bit 0: 1 = RTS disabled

; $DE03 - SwiftLink control register:
			; bit 4: clock source

first:
xx00:
	jmp setup
xx03:
	jmp inable
xx06:
	jmp disabl
xx09:
; forward branch (>) to local (@) "rsget" label instead of the global one
; defined in equates-2_0.asm:
	jmp >@rsget
xx0c:
	jmp >@rsout
xx0f:
	jmp setbaud

bauds:
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
	byte comint1	; initialize with RxD IRQ off, DTR low

vectbl:
oldnmi:
	byte $18
	word nmi64
oldopn:
	byte $1a
	word nopen
oldcls:
	byte $1c
	word nclose
oldchk:
	byte $1e
	word nchkin
oldcho:
	byte $20
	word nchkout
oldclr:
	byte $22
	word nclrch
oldchr:
	byte $24
	word nchrin

{ifndef:comment_out}
; TODO: try uncommenting this: $0830
oldout:
	byte $26
	word nchrout
{endif}

oldget:
	byte $2a
	word ngetin
	byte 0

setup:
; TODO: multiple people have mentioned VICE at startup has an RS232 IRQ pending
; which needs to be acknowledged, so do this. This does not happen on real hardware.

; At startup, $de01 (slStatus) reads %00010000: bit 4: 1=transmit register empty

	lda #comint0	; disable SwiftLink txd/rxd NMIs
	sta slCommand

	ldx #0
	lda #3
	sta 21		; <LINNUM, temp storage: $03xx

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
	lda (20),y	; lda $0300,y
	sta vectbl,x	; re-save it?
	pla		; pop off stack
	sta (20),y
	iny
	inx
	cpy #2
	bcc setup2
	jmp setup1
setup3:
	lda #0
	sta slStatus
	lda #comint1	; rxd irq on
	sta shcomm	; save rxd irq status
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
	lda #{%:00011010}
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
;	lda #{%:00001001} ; no parity

; setting space parity here so that tcpser enters 8-bit binary mode
	lda #{%:11101001} ; space parity?
	sta slCommand
{endif}

	lda #2		; start at 1200 baud
	jmp setbaud

setcarr:
; check for DCD, update $d009 with status
; toggle dcd
	ldy #statcd1	; carrier present?
	lda slStatus
	and #statdcd	; carrier already high?
	beq setcarr1	; yes
	ldy #statcd0	; set low
setcarr1:
	sty carrier	; store DCD status
	rts
;
; ** nmi routine
;
nmi64:
	pha
	txa
	pha
	tya
	pha
	cld
	lda slStatus
	and #statint	; bit 7: 1 = ACIA IRQ active
	beq notacia	; no ACIA IRQ
	lda #comint0	; txd/rxd/ACIA IRQ disabled
	sta slCommand
	jsr rsint
	lda shcomm	; get rxd irq status
	sta slCommand
	pla
	tay
	pla
	tax
	pla
	rti

notacia:
	ldy #0
	jmp rstkey
;
; ** check for character
;
rsint:
	jsr setcarr
	lda slStatus
	and #statrxd	; receive register full?
	beq rsint2	; yes
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
	bcc rsint2
	lda #comrts0	; drop rts
	sta slCommand
;
; ** check if ok to transmit
;
rsint2:
	lda slStatus
	and #stattxd	; transmit register empty?
	beq rsint4	; no
	lda shcomm
	cmp #comint1
	beq rsint4
	ldy rodbs
	lda robuf,y
	sta slData
	iny
	bpl rsint3
	ldy #0
rsint3:
	sty rodbs
	cpy rodbe
	bne rsint4
	lda #comint1
	sta shcomm
rsint4:
	rts
;
; ** disable nmi
;
disabl:
	php
	pha
	lda #comint0	; txd/rxd/acia irq disabled
	sta slCommand
	pla
	plp
	rts
;
; ** enable nmi
;
inable:
	php
	pha
	lda shcomm
	sta slCommand
	pla
	plp
	rts
;
; ** rs232 bsout
;
rsout0:
	jsr rsint
	jmp rsout1
@rsout:
	sta ptr1	; $9e
	sty xsav	; $97
	lda #comint0
	sta slCommand
rsout1:
	lda ptr1	; $9e
	ldy rodbe
	sta robuf,y
	iny
	bpl rsout2
	ldy #0
rsout2:
	cpy rodbs
	beq rsout0
	sty rodbe
	lda #comint2	; txd/rxd enabled
	sta shcomm
rsout4:
	lda shcomm
	sta slCommand
	jmp ret1

xtmp:
	byte 0

nosuch:
	jmp nofile

nchkin:
	stx xtmp
	jsr findfn
	bne nosuch
	jsr devnum
	ldx xtmp
	lda $ba		; current device
	cmp #2		; rs232?
	bne nchkin1
	sta dfltn	; $99 - input device
	clc
	jmp inable

nchkin1:
	jsr disabl
	jsr oldchk
	jmp inable

nchkout:
	stx xtmp
	jsr findfn
	bne nosuch
	jsr devnum
	ldx xtmp
	lda $ba		; current device
	cmp #2		; rs232?
	bne nchkout1
	sta dflto	; $9a - default output device
	clc
	jmp inable

nchkout1:
	jsr disabl
	jsr oldcho
	jmp inable

ngetin:
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
	ldy ridbs
	cpy ridbe
	beq ret2
	lda ribuf,y
	sta ptr1	; $9e
	iny
	bpl rsget1
	ldy #0
rsget1:
	sty ridbs
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
	jsr oldget
	jmp inable

setbaud:
; enter with baud rate # from 'bauds' table in .a
	cmp #254
	bcc setbaud3
	beq setbaud1
	lda shcomm	; get rxd/txd status
	jmp setbaud2
setbaud1:
	lda #comdtr0	; dtr off
setbaud2:
	sta slCommand
	rts
setbaud3:
	and #7
	tay
	lda bauds,y
	sta slControl
	rts

{ifndef:comment_out}
; TODO: try uncommenting this
nchrout:
	jsr disabl
	jsr oldout
	jmp inable
{endif}

nopen:
	jsr disabl
	jsr oldopn
	jmp inable

nclose:
	jsr disabl
	jsr oldcls
	jmp inable

nclrch:
	jsr disabl
	jsr oldclr
	jmp inable

nchrin:
	jsr disabl
	jsr oldchr
	jmp inable
