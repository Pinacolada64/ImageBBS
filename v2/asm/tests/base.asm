; base.asm
; set $d020/21 to black, clear screen, output 'a'
; wine c64list4_00.exe base.asm -prg -ovr -verbose -d64:test.d64::BASE

orig $c000
	lda #$00	; .C:c000  A9 00       LDA #$00
	sta $d020       ; .C:c002  8D 20 D0    STA $D020
	sta $d021       ; .C:c005  8D 21 D0    STA $D021
	lda #147        ; .C:c008  A9 93       LDA #$93
	jsr $ffd2       ; .C:c00a  20 D2 FF    JSR $FFD2
	lda #65         ; .C:c00d  A9 41       LDA #$41
	jsr $ffd2       ; .C:c00f  20 D2 FF    JSR $FFD2
	rts             ; .C:c012  60          RTS
