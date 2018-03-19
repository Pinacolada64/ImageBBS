sa		= $b9	; secondary address
STROUT	= $ab1e	; print string
SETNAM	= $ffbd
CHROUT	= $ffd2 ; print character in .A to current output device
bckgrnd0= $d020
bordrclr= $d021


; stack starts at $02a7. code is loaded into it, then IMAIN vector gets changed to $02a7 so next instruction executed is this code
stack
	; restore standard main BASIC program loop address
		lda #<$a483		; 02a7   a9 83    
		sta IMAIN		; 02a9   8d 02 03 
		lda #>$a483		; 02ac   a9 a4    
		sta IMAIN+1		; 02ae   8d 03 03 
	; change border & background colors to black
		lda #$00		; 02b1   a9 00    
		sta bordrclr	; 02b3   8d 20 d0 
		sta bckgrnd0	; 02b6   8d 21 d0 
	; turn off Kernal messages ("LOADING", etc.)
		jsr setmsg		; 02b9   20 90 ff 
	; load "clear screen" character
		lda #$93		; 02bc   a9 93    
	; print it
		jsr chrout		; 02be   20 d2 ff 
	; set row (ldx) and column (ldy) of cursor
		ldx #$0b		; 02c1   a2 0b    
		ldy #$0f		; 02c3   a0 0f    
	; set, not read, cursor position
		clc				; 02c5   18       
		jsr plot		; 02c6   20 f0 ff 
	; get address of "Image 1.2" string to print
		lda #>szImage12	; 02c9   a9 ed    
		ldy #<szImage12	; 02cb   a0 02    
	; print it
		jsr STROUT		; 02cd   20 1e ab 
	; get length of "ml 1.2" filename string
		lda bML12		; 02d0   ad e6 02 
	; get address of "ml 1.2" filename string
		ldx #>sML12		; 02d3   a2 e7    
		ldy #<sML12		; 02d5   a0 02    
	; set up filename to load
		jsr SETNAM		; 02d7   20 bd ff 
	; set secondary address of 1
		lda #$01		; 02da   a9 01    
		sta sa			; 02dc   85 b9    
	; set logical file number of 0
		lda #$00		; 02de   a9 00    
		jsr LOAD		; 02e0   20 d5 ff 
		jmp $c000		; 02e3   4c 00 c0 
	; (bML12 = 'byte', how long the filename string is)
bML12	.byte $06		; 02e6   06
	; (sML12 = "string, 'ml 1.2'")
sML12	.text "ML 1.2"	; 02e7 4d 4c 20 31 2e 32
	; (szImage12 = "string, zero-terminated, 'Image 1.2'")
	; white, ctrl-n (switch to lowercase)
szImage12 .byte $05,$0e	; 02ed 05 0e
		.text "Image 1.2"; c9 4d 41 47 45 20 31 2e 32
		.byte $00

	; don't know what these bytes are: filler?
		rol $fffe,x		; 02fa 3e fe ff

	; BBS serial # prefix ($C1="A"...$C7="G")
	; as assembled, this BBS is "A0001"
bsnpre	.byte $c1		; 02fd   c1
	; BBS serial # value
bsnval .word $0001		; 02fe   01 00
	; stamdard IERROR vector
IERROR	.word $e38b		; 0300   8b e3
	; where code will next be executed after load finishes
imain	.word stack		; 0302   a7 02
