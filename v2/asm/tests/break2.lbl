' break2.s - updated 12/4/2017
' display information (current address, stack pointer, $00, $01) when BRK encountered

' translated from compute!s fast assembler to c64list3.05:
' <http://www.commodoreserver.com/Downloads.asp>
' perhaps xa would work better:
' <http://www.floodgap.com/retrotech/xa/>

{number:10}
	sys{sym:setup}
	poke 828,0:sys 828
	end
{asm}
; 65352	      $FF48
; Main IRQ/BRK Interrupt Entry Point

; Anytime the BRK instruction is encountered or an IRQ interrupt occurs,
; this routine will be executed. The routine first saves the .A, .X,
; and .Y registers on the stack, and then tests the BRK bit of the
; status register (.P) to see if a BRK was executed.  If it was, the
; routine exits through the RAM BRK vector at 790 ($316)

; FF48: 48        PHA		; push .a
; FF49: 8A        TXA		; .x -> .a
; FF4A: 48        PHA		; push .x
; FF4B: 98        TYA		; .y -> .a
; FF4C: 48        PHA		; push .y
; FF4D: BA        TSX		; put stack ptr in .x
; FF4E: BD 04 01  LDA $0104,X   ; 6510 Hardware Stack Area
; ff51: 29 10       AND #$10	; %00010000 | check BRK flag...
; ff53: F0 03       BEQ $FF58	;  NV-BDIZC | ...if not set, branch to IRQ routine
; ff55: 6C 16 03    JMP ($0316)	; Vector: BRK Instruction Interrupt
; ff58: 6C 14 03    JMP ($0314)	; Vector: IRQ Interrupt Routine

; 256-266 $100-$10A Work Area for Floating Point to String Conversions

setup:
	lda #<brk1
	sta $316
	lda #>brk1
	sta $317
	rts
;
brkbuf	= $c000

brk1:
	inc $0400	; I think this is in a loop
	ldx #5		; counter for pulling 6 bytes of stack info
;	lda {%:00100111}	; #27
			; 5: enable bitmap mode?
			; 2-0: fine scroll display?
;	sta $d011
brk2:
	pla		; pull saved .y (1), .x (1), .a (1), address (2)
	sta brkbuf,x
	dex
	bpl brk2
	tsx		; pull stack pointer
	stx brkbuf+6
	sec
	lda 0		; add $00 (6510 On-Chip I/O Data Direction Register) to buffer
	sta brkbuf+7
	lda 1		; add $01 (RAM banking) to buffer
	sta brkbuf+8
	lda $df02	; add $df02 (CIA #2 Register Images) to buffer - copy of
			; $DD02	C2DDRA Data Direction Register A?
	sta brkbuf+9
	lda brkbuf+1	; get low byte of pc
	sbc #2		; subtract 2
	sta brkbuf+1	; update...
	bcs brk2a
	dec brkbuf
brk2a:
	ldy #0
brk2b:
	lda msg1,y
	beq brk2c
	jsr hex2
	iny
	jmp brk2b
brk2c:
	ldx #0
brk3:
	cpx #2
	bcc brk3a
	lda #$20	; space
	jsr hex2
brk3a:
	lda brkbuf,x
	jsr hex
	inx
	cpx #10		; printed 10 bytes?
	bne brk3	; no
	lda #$0d	; yes, output cr
	jsr hex2
	ldy #0
brk3b:
	lda msg2,y	; print 2nd message
	beq brk3c	; until zero byte
	jsr hex2
	iny
	jmp brk3b
brk3c:
	jmp ($a002)	; basic warm start
; here's where things go off the rails:
	ldy #0
brk4:
	pla
	jsr hex
	iny
; this was commented out in original code:
; adds spaces between bytes after msg2
	lda #$20	; space
	jsr hex2
; end commented out
	cpy #16
	bcc brk5
	lda #$0d
	jsr hex2
	ldy #0
brk5:
	tsx
	cpx #$ff
	bne brk4
	lda #$0d
	jsr hex2
	lda #$0d
	jsr hex2

;	rts
	jmp ($a002)	; BASIC warm start vector

; original code crashes here:
; byte 2
;

hex:
	pha
	lsr
	lsr
	lsr
	lsr
	jsr hex1
	pla
hex1:
	and #$0f
	ora #$30
	cmp #$3a
	bcc hex2
	adc #$06
hex2:
	sta char
	txa
	pha
	ldx cpos
	lda char
	cmp #13
	beq hex3
hex2a:
	sta $0400,x	; output to screen mem
	lda #1
hex2b:
	sta $db00,x	; output to color mem
	inx
	stx cpos
	cpx #40
	bcc hex4
hex3:
	clc
	lda hex2a+1
	adc #40
	sta hex2a+1
	lda hex2a+2
	adc #0
	sta hex2a+2
	clc
	lda hex2b+1
	adc #40
	sta hex2b+1
	lda hex2b+2
	adc #0
	sta hex2b+2
	ldx #0
	stx cpos
hex4:
	pla
	tax
	lda char
	rts
;
cpos:
	byte 0
char:
	byte 0
;
msg1:
; Original source had no strings here, "msg1:" and "msg2:" are therefore
; placeholders until I figure out what they're supposed to say

; these 6 bytes are | these are also
; pulled off stack  | displayed by
; by this routine   | this routine
;  0 1  2  3  4  5  | 6  7  8  9
;  addr ac xr yr ?? | sp 00 01 df02
;  033c 30 08 00 00 | f6 2f 37 00

; vice:
;   ADDR A  X  Y  SP 00 01 NV-BDIZC LIN CYC  STOPWATCH
; .;e5d1 00 00 0a f3 2f 37 00100010 012 002  218338122

{alpha:poke}
	ascii "addr ac xr yr ?? sp 00 01 df02"
	byte 13		; <return>
	byte 0		; <null>

msg2:
	ascii "msg2:"
; 	byte $4d	; "m"
; 	byte $53	; "s"
; 	byte $47	; "g"
; 	byte $32	; "2"
; 	byte 58		; ":"
	byte 13		; <return>
	byte 0		; <null>
{endasm}
