; $1000 seems to be the practical limit to the amount
; of data you can align in a single align statement (2k)

; one data byte must be inserted between align statements

; align $0800 = 2k

; don't try align $8000 ... abnormal program termination (at least under wine)

orig $6c00
	lda #$01

{info:Aligning to $7000.}
align $0400,$00
	lda #$02

{info:Aligning to $8000.}
align $1000,$00
	lda #$03

{info:Aligning to $8400.}
align $0400,$00
	lda #$04	; $8400

addrcheck $8e00

{info:Aligning to $8e00.}
align $0b00,$00		; $8400 + $0a00 = $8c00

addrcheck $8e00		; passes with beta-c

	byte $ea
; align $0200,$00
;	lda #$05	; $8c00 + $0200 = $8e00


	lda #$06	; $8e00

align $0200,$00

	lda #$07	; $9800

align $0800,$ea

	lda #$08	; $a000

{info:Aligning to $9400.}
align $0600,$00
 	lda #$09

{info:Aligning to $9800.}
align $0400,$00
 	lda #$0a

{info:Aligning to $9c00.}
align $0400,$00
 	lda #$0b

{info:Aligning to $a000.}
align $0400,$00
 	lda #$0c

{info:Aligning to $c000.}
align $2000,$00
	lda #$0d

{info:Aligning to $cb00.}
align $0200,$00
 	lda #$0e

{info:Aligning to $cd00.}
align $0e00,$00
 	lda #$0f

{info:Aligning to $ce00.}
align $0100,00
 	lda #$10
