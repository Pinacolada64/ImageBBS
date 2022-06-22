' ml patcher (c) new image software
' 03/Feb/2020 re-worked using c64list 4.00 by pinacolada
' 21/Aug/2018 20:40 - more labels
' 15/Jul/2016 23:07
' seems you just load the base ml, then the second file loaded is a fragment of ml
' (considered the patch), then the whole thing is re-saved
'  wine c64list4_00.exe ml\ patcher.lbl -prg -d64:test.d64::ML\ PATCHER -ovr -verbose

{alpha:alt}

{:10}
	sys{sym:ml}

{asm}
prtscrn = $e716 ; print char in .a to screen

; kernal calls:
SETLFS  = $ffba
SETNAM  = $ffbd
OPEN	= $ffc0
CLOSE	= $ffc3
CHRIN   = $ffcf	; get char from serial bus
loadfile= $ffd5
savefile= $ffd8

; printables:
colon   = 58

ptr     = $14
num     = 2
buf     = $fb
sal     = 172   ; start address of load
eal     = 174   ; end address of load
first   = 3	; save start address
last    = 5	; save end address

adj:	txa
	ldx #0
adj1:	cmp #10
	bcc adj2
	sbc #10
	inx
	bne adj1
adj2:	ora #$30
	cpx #0
	rts

prmsg:	sta num
	stx ptr
	sty ptr+1
	ldy #0
prmsg1:	lda (ptr),y
	beq prmsg3
	cmp #'%'
	beq prmsg4
	cmp #'$'
	beq prmsg7
	jsr prtscrn ; $e716
	iny
	bne prmsg1
prmsg2: iny
	bne prmsg1
prmsg3: rts
prmsg4: ldx num
	lda #0
prmsg5: pha
	jsr adj
	bne prmsg5
prmsg6: jsr prtscrn ; $e716
	pla
	bne prmsg6
	jmp prmsg2
prmsg7: tya
	pha
prmsg8:
        jsr CHRIN   ; $ffcf
	cmp #13
	beq prmsg9
	jsr putbuf
	jmp prmsg8
prmsg9:
        lda num
	jsr putbuf
	pla
	tay
	jmp prmsg2
;
putbuf:
        ldy #0
	sta (buf),y
	inc buf
	bne putbuf1
	inc buf+1
putbuf1:
        rts
;
file:	ascii "254:ffiilleennaammee"
;
getname:
	jsr prmsg
	ldx #<$200
	ldy #>$200
	stx buf
	sty buf+1
	ldx #<msg4
	ldy #>msg4
	lda #0
	jsr prmsg
	ldx #<file
	ldy #>file
	stx buf
	sty buf+1
	ldx #<msg5
	ldy #>msg5
	lda #colon
	jsr prmsg
	ldx #<msg6
	ldy #>msg6
	lda #0
	jsr prmsg
	ldy #0
	sty num
getname1:
	lda $0200,y
	beq getname2
	cmp #'0'
	bcc getname2
	cmp #':'
	bcs getname2
	sec
	sbc #'0'
	pha
	lda num
	asl
	asl
	clc
	adc num
	asl
	sta num
	pla
	clc
	adc num
	sta num
	iny
	bne getname1
getname2:
	lda #1		; .a 1
	tay		; .y 1
	ldx num		; .x 2
	jsr SETLFS	; $ffba
	ldy #0
getname3:
	iny
	lda file,y
	bne getname3
	tya
	ldx #<file
	ldy #>file
	jmp SETNAM ; $ffbd
;
getfile:
	jsr getname
; open file, check for errors after rts
	jmp OPEN	; open file

msg0:	ascii "{lowercase}Image BBS ML Patcher"
        byte 13,13,0

msg1:	ascii "Original"
        byte 0
msg2:	ascii "Patch"
        byte 0
msg3:   ascii "Output"
        byte 0
msg4:   ascii " File:"
        byte 13
	ascii " Device: $"
	byte 13,0
msg5:   ascii " Drive: $"
        byte 13,0
msg6:   ascii " Filename: $"
        byte 13,0
errormsg:
	ascii "Error opening file."
	byte 13,0

;
; bank out basic
;
ml:
	lda #$36
	sta 1
	ldx #<msg0	; "ML Patcher""
	ldy #>msg0
	jsr prmsg
	ldx #<msg1	; "Original File"
	ldy #>msg1
	jsr getfile	; prints message too

	bcc getaddr	; opened ok

	ldx #<errormsg
	ldy #>errormsg
	lda #0
	jsr prmsg

	lda #1
	jsr CLOSE
	jmp ml

; get load address, save it
getaddr:
	jsr CHRIN
	sta first+1
	jsr CHRIN
	sta first

	lda #1
	jsr CLOSE

	lda #0		; load
	jsr loadfile	; $ffd5

	ldx eal		; ending address of load
	ldy eal+1

	stx last	; save ending address: will be overwritten
	sty last+1	; by new ending address of patch loaded in

; start address (wrong, should be $00 $0c)
; 62941	      $F5DD	     SAVE
; Save RAM to a Device
;
; This is a documented Kernal routine, whose entry in the jump table
; appears at 65496 ($FFD8).
;
; The routine jumps through a RAM vector at 818 ($332).  SAVE is used to
; transfer data directly from RAM to an I/O device.  Since the SAVE
; routine performs an OPEN, it must be preceded by a call to the SETLFS
; routine to specify the logical file number, device number, and
; secondary address, and a call to the SETNAM routine to specify the
; filename (although a SAVE to the cassette can be performed without
; giving a filename).

; 1) A Page 0 pointer to the starting address of the area to be saved
;    should be set up, with the low byte of the address first.

	ldx #sal	; 172
	ldy #sal+1	; 173
	stx first	; 3
	sty first+1	; 4

	ldx #<msg2	; "Patch File""
	ldy #>msg2
	jsr getfile
	bcc patch	; loaded ok

	ldx #<errormsg
	ldy #>errormsg
	lda #0
	jsr prmsg

	lda #1
	jsr CLOSE
	jmp ml

patch:
	ldx #<msg3
	ldy #>msg3
	jsr getname
; 2) The accumulator should be loaded with the Page 0 offset of
;    that pointer, then
	lda #first	; #(s)tart (a)ddress of (l)oad

; 3) the .X and .Y registers should be set with the ending address for
;    the save, and the SAVE routine called.

	ldx #last
	ldy #last+1
	jsr savefile	; $ffd8
; bank in basic
	lda #$37
	sta 1
	rts
{endasm}
