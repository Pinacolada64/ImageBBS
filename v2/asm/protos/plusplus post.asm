; include "equat.s",8
; for pass=1 to 3:org 49152,-(pass=3),8,"@:++ post"
; print"Pass:"pass
;
	jmp proto4
	byte 255
;
; proto 4 for posts (++ post)
;
h:
	word 0
l:
	word 0
x:
	word 0
ptrcom:
	byte "p{$02}"
ptr:
	word 0
ptrpos:
	byte 1,13
xx:
	word 0
ptr2:
	word 0
copy0:
	byte $ff
	word $ffff
copy1:
	byte $ff
	byte $ff
fake:
	word copy2
;
proto4:
	txa
	beq find ;0
	dex
	beq loadindx ;1
	dex
	beq saveindx ;2
	dex
	beq makeindx ;3
	dex
	beq instindx ;4
	dex
	beq deltindx ;5
	dex
	beq nextindx ;6
	dex
	beq setcrskp ;7
	dex
	beq loadpost ;8
	dex
	beq savepost ;9
	dex
	beq numbindx ;10
	dex
	beq readpost ;11
	rts

loadindx:
	jmp loadfile
saveindx:
	jmp savefile
makeindx:
	jmp makefile
instindx:
	jmp insert
deltindx:
	jmp delete
nextindx:
	jmp getnext
setcrskp:
	jmp setskip
loadpost:
	jmp postload
savepost:
	jmp postsave
numbindx:
	jmp indxcnt
readpost:
	jmp postread
;
;
; proto 4 - relfile indexer
;
;* search for an$ in file
;
; get handle to search for
find:
	ldx #0
	jsr usevar ;an$
	ldy #0
loop:
	lda (var+1),y
	sta buffer,y
	iny
	cpy var
	bcc loop
	lda #0
	sta buffer,y
	sty len1
; high = # users
	lda last
	ldx last+1
	sta h
	stx h+1
; low = 1
	lda #0
	ldx #1
	sta l
	stx l+1
; check first
	lda l
	ldx l+1
	sta x
	stx x+1
	jsr check
	beq find12
	bcs find1
;not there, put before start
	jmp xputavar
; check last
find1:
	lda h
	ldx h+1
	sta x
	stx x+1
	jsr check
	beq find12
bcc find2
;not there, put after end
	lda h
	ldx h+1
	inx
	bne *+4
	clc
	adc #1
	sta x
	stx x+1
	jmp xputavar
;found it!
find12:
	jmp putavar
; get midpoint
find2:
	lda l
	cmp h
	bne find3
	lda l+1
	cmp h+1
	bne find3
;not there, put at x
	jmp xputavar
find3:
	clc
	lda l+1
	adc h+1
	sta x+1
	lda l
	adc h
	sta x
	lsr x
	ror x+1
	lda x
	cmp l
	bne find4
	lda x+1
	cmp l+1
	bne find4
	lda h
	ldx h+1
	sta l
	stx l+1
	sta x
	stx x+1
; do pointer command, and input
find4:
	jsr check
	beq find12
	lda x
	ldx x+1
	bcc find11
	sta l
	stx l+1
	jmp find2
find11:
	sta h
	stx h+1
	jmp find2
;
check:
	jsr sendptr
	lda skip
	sta skip2
	beq check2
check1:
	dec skip2
check2:
	ldx #2
	ldy #0
	jsr dskin
	lda skip2
	bne check1
	jmp compare
;
sendptr:
	jsr calcptr
sendcom:
	ldx #15
	jsr chkout
	ldy #0
	ldx #6
loop:
	lda ptrcom,y
	jsr chrout
	iny
	dex
	bne loop
	jmp clrchn
;
copy2:
	byte $ff
	word $ffff
calcptr:
	lda x+1
	asl
	tay
	lda x
	rol
	tax
	clc
	tya
	adc #<last
	sta $fb
	txa
	adc #>last
	sta $fc
	ldy #0
	lda ($fb),y
	sta ptr+1
	iny
	lda ($fb),y
	sta ptr
	rts
;
compare:
	ldy #0
loop:
	lda buffer,y
	cmp buf2,y
	bne compare1
	iny
	cpy len1
	beq compare2
	cpy index
	bne loop
compare2:
	ldy len1
	cpy index
compare1:
	rts
len1:
	byte 0
;
;load index file to end of proto
loadfile:
	ldx #1
	jsr usevar ;a$
	lda var
	ldx var+1
	ldy var+2
	jsr setnam
	ldx #32
	jsr usevar ;dv%
	lda #8
	ldx var+1
	ldy #0
	jsr setlfs
	lda #0
	ldx #<last
	ldy #>last
	jsr loadf
indxcnt:
	lda last
	ldx last+1
	sta var
	stx var+1
	ldx #30
	jmp putvar ;a%
;
;save index file
savefile:
	ldx #1
	jsr usevar ;a$
	lda var
	ldx var+1
	ldy var+2
	jsr setnam
	ldx #32
	jsr usevar ;dv%
	lda #8
	ldx var+1
	ldy #0
	jsr setlfs
	lda #<last
	ldx #>last
	sta var
	stx var+1
	lda last+1
	asl
	tax
	lda last
	rol
	tay
	clc
	txa
	adc #<last
	tax
	tya
	adc #>last
	tay
	clc
	txa
	adc #3
	tax
	tya
	adc #0
	tay
	lda #var
	jmp savef
;
;make index
makefile:
	lda #0
	sta last
	sta last+2
	lda #0
	sta last+1
	sta last+3
	rts
;
xputavar:
	lda #0
	sta ptr
	sta ptr+1
putavar:
	lda ptr+1
	ldx ptr
	sta var
	stx var+1
	ldx #30
	jsr putvar ;a%
	lda x
	ldx x+1
	sta var
	stx var+1
	ldx #31
	jsr putvar ;b%
	lda ptr
	ora ptr+1
	rts
;
;insert into index
; a%=id, b%=pos
;x=pos
insert:
	ldx #31
	jsr usevar ;b%
	lda var
	ldx var+1
	sta x
	stx x+1
;last++
insert1:
	inc last+1
	bne *+4
	inc last
;ptr=id
	ldx #30
	jsr usevar
	lda var
	ldx var+1
	sta ptr+1
	stx ptr
;h=ptr
insert2:
	lda ptr
	ldx ptr+1
	sta h+1
	stx h
	jsr calcptr
	ldy #0
;*x=h
	lda h
	sta ($fb),y
	iny
	lda h+1
	sta ($fb),y
;if x=last then done
	lda x+1
	cmp last+1
	bne insert3
	lda x
	cmp last
	bne insert3
	rts
;x++
insert3:
	inc x+1
	bne *+4
	inc x
	jmp insert2
;
;delete from index
; b%=pos
delete:
	ldx #31
	jsr usevar ;b%
	lda var
	ldx var+1
	sta x
	stx x+1
;*x=*(x+1)
delete1:
	lda x
	cmp last
	bne delete2
	lda x+1
	cmp last+1
	beq delete3
delete2:
	jsr calcptr
	ldy #3
	lda ($fb),y
	pha
	dey
	lda ($fb),y
	tax
	dey
	pla
	sta ($fb),y
	dey
	txa
	sta ($fb),y
;x++
	inc x+1
	bne *+4
	inc x
	jmp delete1
;last--
delete3:
	lda last+1
	bne *+4
	dec last
	dec last+1
;done
	rts
;
getnext:
	ldx #31
	jsr usevar ;b%
	lda var
	ldx var+1
	sta x
	stx x+1
	inc x+1
	bne *+4
	inc x
	jsr calcptr
	jmp putavar
;
setskip:
	sty skip
	rts
skip:
	byte 0
skip2:
	byte 0
;
postload:
	lda copy1
	clc
	adc postsave+1
	eor 766
	bne getnext-1
	jsr makefile
	ldx #31
	jsr usevar; b%
	lda var+1
	sta ptr
	lda var
	sta ptr+1
	lda #<last
	sta $fb
	lda #>last
	sta $fc
postld1:
	 jsr sendcom
	ldx #2
	ldy #3
	jsr dskin
	lda buf2
	sta ptr
	lda buf2+1
	sta ptr+1
	ldy buf2+2
	sty l
	ldx #2
	cpy #0
	beq postld3
	jsr dskin
	ldy #0
postld2:
	lda buf2,y
	sta ($fb),y
	iny
	cpy l
	bne postld2
	lda $fb
	clc
	adc l
	sta $fb
	bcc postld3
	inc $fc
postld3:
	lda ptr
	cmp #0
	bne postld1
	lda ptr+1
	cmp #0
	bne postld1
	jmp indxcnt
;
; save pointers
;
postsave:
	lda copy0
	clc
	adc postread+1
	eor 765
	bne postsave-3
	ldx #30
	jsr usevar ; a%
	lda var+1
	sta xx
	sta ptr
	lda var
	sta xx+1
	sta ptr+1
	jsr sendcom
	ldx #1
	jsr tenwait
	jsr sendcom
	ldx #2
	jsr chkout
	lda #0
	jsr chrout
	jsr chrout
	jsr chrout
	lda #13
	jsr chrout
	jsr sendcom
	ldx #31
	jsr usevar ; b%
	lda var+1
	sta ptr
	lda var
	sta ptr+1
	lda #<last
	sta postsv2+1
	lda #>last
	sta postsv2+2
	lda last+1
	asl
	tax
	lda last
	rol
	tay
	clc
	txa
	adc #<last
	tax
	tya
	adc #>last
	tay
	clc
	txa
	adc #2
	sta l
	tya
	adc #0
	sta l+1
postsv0:
	jsr sendcom
	ldx #2
	ldy #2
	jsr dskin
	jsr sendcom
	lda ptr
	sta ptr2
	lda ptr+1
	sta ptr2+1
	ldx #1
	jsr tenwait
	jsr sendcom
	lda ptr
	sta var+1
	lda ptr+1
	sta var
	ldx #31
	jsr putvar ; b%
	lda buf2
	sta ptr
	lda buf2+1
	sta ptr+1
	cmp #0
	bne postsv1
	lda ptr
	cmp #0
	bne postsv1
	lda xx
	sta buf2
	lda xx+1
	sta buf2+1
	inc xx
	bne postsv1a
	inc xx+1
postsv1a:
	lda xx
	sta ptr
	lda xx+1
	sta ptr+1
	jsr sendcom
	ldx #2
	jsr chkout
	lda #0
	jsr chrout
	jsr chrout
	jsr chrout
	lda #13
	jsr chrout
	jsr sendcom
	lda ptr2
	sta ptr
	lda ptr2+1
	sta ptr+1
	jsr sendcom
	ldx #1
	jsr tenwait
	jsr sendcom
	lda buf2
	sta ptr
	lda buf2+1
	sta ptr+1
postsv1:
	 ldy #0
postsv2
	lda $ffff
	sta buf2+3,y
	iny
	inc postsv2+1
	bne postsv3
	inc postsv2+2
	postsv3
	lda postsv2+1
	cmp l
	bne postsv4
	lda postsv2+2
	cmp l+1
	bne postsv4
	lda #0
	sta ptr
	sta ptr+1
	sta buf2
	sta buf2+1
	jmp postsv5
postsv4:
	cpy #76
	bne postsv2
postsv5:
	sty buf2+2
	iny
	iny
	iny
	sty h
	ldy #0
	ldx #2
	jsr chkout
postsv6:
	lda buf2,y
	jsr chrout
	iny
	cpy h
	bne postsv6
	lda #13
	jsr chrout
	jsr clrchn
	lda ptr
	bne postsv7
	lda ptr+1
	bne postsv7
	rts
postsv7:
	jmp postsv0

postread:
	lda copy2
	clc
	adc postload+1
	eor 767
	bne postsv7-1
	jsr zero
	ldx #17		; rc
	jsr putvar
	ldx #18
	jsr putvar	; sh
	lda #0
	sta readmode    ; 2038
	sta mjump       ; 2024
postrd0:
	jsr minusone
	ldx #15		; lp
	jsr putvar
	ldx #2
	ldy #0
	jsr reader
	lda buf2
	cmp #'^'
	bne postrd1
	ldx #1
	jsr usevar	; a$
	lda var
	cmp #1
	bne postrd1
	jmp postrd2
postrd1:
	ldx #17
	jsr usevar	; rc
	lda var
	bne postrd2
	jmp postrd0
postrd2:
	jsr zero
	ldx #15		; lp
	jmp putvar

usevar:
	lda #29
	jmp usetbl1
tenwait:
	lda #22
	jmp usetbl1
dskin:
	lda #2
	jmp usetbl1
putvar:
	lda #30
	jmp usetbl1
outastr:
	lda #0
	jmp usetbl1
zero:
	lda #31
	jmp usetbl1
minusone:
	lda #32
	jmp usetbl1
reader:
	lda #3
	jmp usetbl1
vers:
	ascii "03/22/90 01:08a{13}"
	ascii "So long, and thanks for all the fish!{13}"
	ascii "---------------------------------------{13}"
	ascii "Copr.1990 New Image"

last:
;	next pass:close 8
;	rem   open 15,8,15,"s0:0:++ 4":print#15,"c0:0:=8:1:++ 4":close 15
;       print "Free for Index:" $ca80 - *
