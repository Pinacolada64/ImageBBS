; patch.asm
; output 'b'
; wine c64list4_04.exe patch.asm -prg -ovr -verbose

orig $c00d
	lda #66         ; .C:c00d  A9 41       LDA #$42   'b'
