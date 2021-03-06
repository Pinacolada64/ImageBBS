orig $c000
{include:equates-2_0.asm}
; print "Struct: [" ;
; for pass=1 to 3:org $c000,-(pass=3),8,"@:ml.struct":print pass;
;
;putstring - put string into struct
; &,nn,0,num,arry(a,b),string$
; arry(a,b) = starting element
; num = # of bytes
; string$ = the string
;
;getstring - get string from struct
; &,nn,1,num,arry(a,b),string$
; arry(a,b) = starting element
; num = # of bytes
; string$ = the string
;
;lodstruc - load structure
; &,nn,2,0,arry(a,b),"file",dev
; arry(a,b) = starting element
; "file" = filename
; dev = device #
;
;savstruc - save structure
; &,nn,3,0,arry(a,b),bytes,"file",dev
; arry(a,b) = starting element
; bytes = # of bytes
; "file" = filename
; dev = device #
;
;putdate - put date into struct
; &,nn,4,0,arry(a,b),string$
; arry(a,b) = starting element
; string$ = the date string
;
;getdate - get date from struct
; &,nn,5,0,arry(a,b),string$
; arry(a,b) = starting element
; string$ = the string to put date in
;
;doscan - scan structures
; &,nn,6,num,com,a(a,b),b(a,b),l,bits,test
; num = # of structures to scan
; com = command number
; com = 0: 2 byte and, <>0
; com = 1: 2 byte and, ==0
; com = 2: 2 byte cmp, <
; com = 3: 2 byte cmp, >=
; com = 4: date cmp, <
; com = 5: date cmp, >=
; a(a,b) = starting flags element
; b(a,b) = starting object element
; l = unknown (rns)
; bits = the bits to set if true
; test = the object to test for

ilen = $0061 ;1
istr = $62 ;2
iptr = $64 ;2
jlen = $0069 ;1
jstr = $6a ;2
jptr = $6c ;2
temp = $14 ;2

opandy=57
opcmpy=217
opbne =208
opbcc =144
opbeq =240
opbcs =176

makerm = $b475
; chkcom = $aefd
getnxt = $e206

defbase= $c600

entry1:
	jmp clrarr
entry2:
	sty count
	lda 1
	pha
	lda #$37
	sta 1
	dex
	dex
	txa
	asl
	tax
	lda functbl,x
	sta strucjmp+1
	lda functbl+1,x
	sta strucjmp+2
strucjmp:
	jsr lodstruc
	pla
	sta 1
	rts

functbl:
	word lodstruc	; &,60,2
	word savstruc	; &,60,3
	word putdate	; &,60,4
	word getdate	; &,60,5
	word doscan	; &,60,6
	word sort	; &,60,7
	word scannums	; &,60,8
	word scansum	; &,60,9
	word cpystruc	; &,60,10
	word scanstr	; &,60,11
	word gamescan	; &,60,12

putvar:
	lda #30
	jmp usetbl1

count:
	byte $00
size:
	byte $00
scanfor:
	byte $00,$00,$00,$00,$00,$00 ; 6
bitmask:
	word $0000
invert:
	byte $00
oper:
	byte $00

fnvar:
; $b08b: read variable name from BASIC text
; return address in ($47)
	jsr chkcom
	jsr $b08b
	ldx $47
	ldy $48
	rts

fnvar1:
; same as above, but also return in ($14)
	jsr fnvar
	stx $14
	sty $15
	rts

evalbyt:
	jsr chkcom
	jsr chrgot
	jmp getbytc+3	; $b79e

evalstr:
	jsr chkcom
	jsr frmevl
	jmp $b6a3

evaldate:
	jsr evalstr
	stx var+1 ; $62
	sty var+2 ; $63
	ldy #1
	ldx #0
evald1:
	lda (var+1),y	; $62
	iny
	and #15
	asl
	asl
	asl
	asl
	sta scanfor,x
	lda (var+1),y	; $62
	iny
	and #15
	ora scanfor,x
	sta scanfor,x
	inx
	cpx #5
	bcc evald1
evald2:
	ldy #0
	lda (var+1),y	; $62
	sta scanfor+5
	ldx scanfor+3
	txa
	and #$7f
	cmp #$12
	bne evald3
	txa
	sec
	sbc #$12
	tax
evald3:
	stx scanfor+3
	rts

getword:
	jsr chkcom	; $aefd
	jsr frmnum	; $ad8a
	jsr getadr	; $b7f7
	ldx $14
	ldy $15
	rts

lodstruc:
	jsr fnvar
	tya
	pha
	txa
	pha
	jsr chkcom	; $aefd
	jsr getfile	; 57812
	pla
	tax
	pla
	tay
	lda #0
	jmp loadf	; $ffd5

savstruc:
	jsr fnvar
	tya
	pha
	txa
	pha
	jsr getword
	jsr chkcom	; $aefd
	jsr getfile	; 57812
	clc
	pla
	sta $69
	adc $14
	tax
	pla
	sta $6a
	adc $15
	tay
	lda #$69
	jmp savef	; $ffd8

putdate:
	jsr fnvar1
	jsr evaldate
	ldy #0
	putd1:
	lda scanfor,y
	sta ($14),y
	iny
	cpy #6
	bcc putd1
	rts

getdate:
	jsr fnvar1
	ldy #5
getd1:
	lda ($14),y
	sta scanfor,y
	dey
	bpl getd1
	jsr fnvar
	lda #11
	jsr makerm
	ldx scanfor+3
	txa
	and #$7f
	bne getd0
	txa
	clc
	adc #$12
	tax
getd0:
	stx scanfor+3
	lda scanfor+5
	ldx #0
	ldy #0
	sta (var+1),y ; $62
	iny
getd2:
	lda scanfor,x
	inx
	pha
	lsr
	lsr
	lsr
	lsr
	ora #$30
	sta (var+1),y ; $62
	iny
	pla
	and #15
	ora #$30
	sta (var+1),y ; $62
	iny
	cpx #5
	bcc getd2
getd3:
	ldy #4
getd4:
	lda $0061,y	; var
	sta ($47),y
	dey
	bpl getd4
	rts

opc1:
	byte opandy,opcmpy
opc2:
	byte opbne, opbcc
opc3:
	byte opbeq, opbcs

scanbits:
	txa
	lsr
	tax
	and #1
	tay
	rts

doscan:
	jsr evalbyt
	stx oper
	txa
	and #1
	sta invert
	jsr scanbits
	lda opc1,y
	sta checkc0
	jsr scanbits
	lda opc1,y
	sta checkc1
	jsr scanbits
	lda opc2,y
	sta checkc2
	lda opc3,y
	sta checkc3
	jsr fnvar	; FIXME: which variable?
	txa
	pha
	tya
	pha
	jsr fnvar
	txa
	pha
	tya
	pha
	jsr evalbyt
	stx size
	jsr getword
	sty bitmask
	stx bitmask+1
	lda oper
	and #64
	bne doscan1
	jsr getword
	sty scanfor
	stx scanfor+1
	lda #2
	jmp doscan2
doscan1:
	jsr evaldate
	lda #6
doscan2:
	sta checkc4+2
	pla
	sta $6c
	pla
	sta $6b
	pla
	sta $6a
	pla
	sta $69
	lda #0
	sta var
	sta var+1
	lda count
	beq doscan15
doscan3:
	lda oper
	bmi doscan6
	ldy #1
doscan5:
	lda bitmask,y
	eor #255
	and ($69),y
	sta ($69),y
	dey
	bpl doscan5
doscan6:
	ldy #0
doscan7:
	lda ($6b),y
checkc0:
	cmp scanfor,y
checkc1:
	cmp scanfor,y
	beq checkc4
checkc2:
	bne doscan9
checkc3:
	beq doscan8
checkc4:
	iny
	cpy #2
	bcc doscan7
doscan8:
	lda invert
	bne doscan10
	jmp doscan12
doscan9:
	lda invert
	bne doscan12
doscan10:
	ldy #1
doscan11:
	lda bitmask,y
	ora ($69),y
	sta ($69),y
	dey
	bpl doscan11
	inc var+1
doscan12:
	ldx #2
doscan13:
	clc
	lda size
	adc $69,x
	sta $69,x
	bcc doscan14
	inc $6a,x
doscan14:
	dex
	dex
	bpl doscan13
	dec count
	bne doscan3
doscan15:
	ldx #30
	jmp putvar	; a%

i:
	word $0000
j:
	word $0000
n:
	word $0000
base:
	word $0000

calcp:
	stx temp
	sty temp+1
	txa
	asl
	tax
	tya
	rol
	tay
	clc
	txa
	adc temp
	tax
	tya
	adc temp+1
	tay
	clc
	txa
	adc base
	tax
	tya
	adc base+1
	tay
	rts
calcs:
	stx temp
	sty temp+1
	ldy #0
	lda (temp),y
	pha
	iny
	lda (temp),y
	tax
	iny
	lda (temp),y
	tay
	pla
	rts

strcmp:
	ldy #0
strcmp1:
	lda (jstr),y
	cmp (istr),y
	bne strcmp3
	iny
	cpy jlen
	bcs strcmp2
	cpy ilen
	bcc strcmp1
strcmp2:
	ldy jlen
	cpy ilen
strcmp3:
	rts

strptn:
	ldy #0
strptn1:
	lda (jstr),y
	cmp #137
	beq strptn2
	cmp #136
	beq strptn4
	cmp (istr),y
	bne strptn4
strptn2:
	iny
	cpy jlen
	bcs strptn3
	cpy ilen
	bcc strptn1
strptn3:
	ldy jlen
	cpy ilen
strptn4:
	rts

sort:
	jsr fnvar
	stx base
	sty base+1
	jsr getword
	cpx #0
	bne sort0
	dey
sort0:
	dex
	stx n
	sty n+1
	ldx #0
	ldy #0
	stx i
	sty i+1
sort1:
	jsr calcp
	stx iptr
	sty iptr+1
	jsr calcs
	sta ilen
	stx istr
	sty istr+1
	ldx i
	ldy i+1
sort2:
	inx
	bne sort3
	iny
sort3:
	stx j
	sty j+1
	jsr calcp
	stx jptr
	sty jptr+1
	jsr calcs
	sta jlen
	stx jstr
	sty jstr+1
	jsr strcmp
	bcs sort8
	ldy #2
sort7:
	lda ilen,y
	sta (jptr),y
	lda jlen,y
	sta (iptr),y
	sta ilen,y
	dey
	bpl sort7
sort8:
	ldx j
	ldy j+1
	cpx n
	bne sort2
	cpy n+1
	bne sort2
	ldx i
	ldy i+1
	inx
	bne sort9
	iny
sort9:
	stx i
	sty i+1
	cpx n
	bne sort1
	cpy n+1
	bne sort1
	rts
;
; scan numbers
; &,nn,8,num,siz,acs,a(a,b),a%(a),start
;
scannums:
	jsr evalbyt
	stx size
	jsr getword
	stx scanfor+1
	sty scanfor
	jsr fnvar
	txa
	pha
	tya
	pha
	jsr fnvar
	txa
	pha
	tya
	pha
	jsr evalbyt
	stx var
	lda #0
	sta var+2
	sta var+1
	pla
	sta $6a
	pla
	sta $69
	pla
	sta $6c
	pla
	sta $6b
scannum1:
	lda count
	beq scannum6
	ldy #0
scannum2:
	lda ($6b),y
	and scanfor
	bne scannum3
	iny
	lda ($6b),y
	and scanfor+1
	beq scannum4
scannum3:
	ldy var+2
	lda #0
	sta ($69),y
	iny
	lda var
	sta ($69),y
	iny
	sty var+2
	inc var+1
scannum4:
	inc var
	clc
	lda size
	adc $6b
	sta $6b
	bcc scannum5
	inc $6c
scannum5:
	dec count
	bne scannum1
scannum6:
	lda #0
	sta var
	ldx #30
	jmp putvar ;a%
;
; sum
; &,nn,9,num,siz,a(a,b)
;
scansum:
	jsr evalbyt
	stx size
	jsr fnvar
	stx $6b
	sty $6c
	lda #0
	sta var
	sta var+1
scansum1:
	lda count
	beq scansum4
	ldy #1
	clc
scansum2:
	lda ($6b),y
	adc $0061,y	; var (force zp address)
	sta $0061,y	; var (force zp address)
	dey
	bpl scansum2
	lda size
	adc $6b
	sta $6b
	bcc scansum3
	inc $6c
scansum3:
	dec count
	bne scansum1
scansum4:
	ldx #30
	jmp putvar ;a%
;
; copy
; &,nn,10,size,a1(a,b),a2(a,b)
;
cpystruc:
	jsr fnvar
	stx cpys1+1
	sty cpys1+2
	jsr fnvar
	stx cpys2+1
	sty cpys2+2
	ldy #0
cpys1:
	lda $ffff,y
cpys2:
	sta $ffff,y
	iny
	cpy count
	bcc cpys1
	rts
;
; scan for string
; &,nn,11,num,siz,op,str,a1(a,b),a2(b),start
;
stroplo:
	byte <strcmp,<strptn
strophi:
	byte >strcmp,>strptn
;
scanstr:
	jsr evalbyt
	stx size
	jsr evalbyt
	txa
	and #1
	tax
	lda stroplo,x
	sta scanstr0+1
	lda strophi,x
	sta scanstr0+2
	jsr evalstr
	sta index
	tax
	ldy #0
loop1:
	lda ($22),y
	sta buffer,y
	iny
	dex
	bne loop1
	jsr fnvar
	txa
	pha
	tya
	pha
	jsr fnvar
	txa
	pha
	tya
	pha
	jsr evalbyt
	stx iptr
	lda #0
	sta iptr+1
	pla
	sta jptr+1
	pla
	sta jptr
	pla
	sta istr+1
	pla
	sta istr
	lda #<buffer
	sta jstr
	lda #>buffer
	sta jstr+1
	lda index
	sta jlen
scanstr1:
	lda count
	beq scanstr5
	ldy #0
loop2:
	lda (istr),y
	beq scanstr2
	iny
	bne loop2
scanstr2:
	sty ilen
scanstr0:
	jsr strcmp
	bne scanstr3
	ldy iptr+1
	lda #0
	sta (jptr),y
	iny
	lda iptr
	sta (jptr),y
	iny
	sty iptr+1
scanstr3:
	inc iptr
	clc
	lda size
	adc istr
	sta istr
	bcc scanstr4
	inc istr+1
scanstr4:
	dec count
	bne scanstr1
scanstr5:
	lda #0
	sta var
	lda iptr+1
	lsr
	sta var+1
	ldx #30
	jmp putvar ;a%
;
; tt$(), bb$(), dt$(), ed$(), nn$()
;  a$(),  c$(),  d$(),  e$(),  f$() [?]
; ac%(), so%()

arrays1:
	ascii "tbdenACDEFAS"
arrays2:
	ascii "TBTDN{$80:5}CO"
;
;* clear an array
clrarr:
	cpx #12
	bcs clrar7
	lda 47
	sta 71
	lda 48
	sta 72
clrar0:
	ldy #3
	lda (71),y
	sta 21
	dey
	lda (71),y
	sta 20
	dey
	lda (71),y
	cmp arrays2,x
	bne clrar1
	dey
	lda (71),y
	cmp arrays1,x
	beq clrar3
clrar1:
	clc
	lda 20
	adc 71
	sta 71
	lda 21
	adc 72
	sta 72
	lda 71
	cmp 49
	bne clrar2
	lda 72
	cmp 50
	beq clrar7
clrar2:
	jmp clrar0
clrar3:
	clc
	lda 71
	adc #7
	sta 71
	lda 72
	adc #0
	sta 72
	sec
	lda 20
	sbc #7
	sta 20
	lda 21
	sbc #0
	sta 21
clrar4:
	ldy #0
	tya
	sta (71),y
	inc 71
	bne clrar5
	inc 72
clrar5:
	lda 20
	bne clrar6
	dec 21
clrar6:
	dec 20
	bne clrar4
	lda 21
	bne clrar4
clrar7:
	rts
;
; game scan
; &,60,13,count,size,a$,a%(a,b),b$
;
gamescan:
	jsr evalbyt
	stx size
	jsr evalstr
	lda $22
	sta game2+1
	lda $23
	sta game2+2
	jsr fnvar1
	jsr fnvar
	lda count
	asl
	jsr makerm
	ldy #0
	sty index
game1:
	ldy #1
	lda ($14),y
	asl
	tax
	ldy index
	jsr game2
	jsr game2
	sty index
	clc
	lda $14
	adc size
	sta $14
	lda $15
	adc #0
	sta $15
	dec count
	bne game1
	ldy #4
game3:
	lda $0061,y
	sta ($47),y
	dey
	bpl game3
	rts
;
game2:
	lda $ffff,x
	sta ($62),y
	inx
	iny
	rts

; next pass:close 8:print "]" (*-$c000) "Bytes"
; if (*>=$c600) then print "Too Large!"
