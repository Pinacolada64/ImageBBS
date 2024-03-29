{uses:..\equates-2_0.asm}
orig $c000
; for pass=1 to 3:org $c000,-(pass=3),8,"@:ml.rs232"
; print pass

; get &,16,x parameter (im 3082):
; &,16,0: init user port
; &,16,1: init SwiftLink

; TODO: add SwiftLink/Turbo232 auto-detect from swiftlib
; then just &,16 would fall back to user port if neither detected

ml:
	cpx #2
	bcs ml3
	lda rslow,x
	sta ml1+1
	lda rshigh,x
	sta ml1+2
	ldy #0
	ldx #3
ml1:
	lda rs232a,y
ml2:
	sta rs232,y
	iny
	bne ml1
	inc ml1+2
	inc ml2+2
	dex
	bne ml1
ml3:
	jmp rs232	; $0800

rslow:
	byte <rs232a,<rs232b ; $2d $1f
rshigh:
	byte >rs232a,>rs232b ; $c0 $c3
rs232a:
	{info:INFO: Embedding "rs232-user.bin"}
	embed "rs232-user.bin"
rs232b:
	{info:INFO: Embedding "rs232-swift.bin"}
	embed "rs232-swift.bin"

; FIXED: since load addresses ($00 $08) are part of the binaries,
; the program is JMPing there and hitting a BRK instruction

; in monitor (to skip load address):
; bload "ml.rs232" 0a bffe
; or
; l "ml.rs232" 0a c000
