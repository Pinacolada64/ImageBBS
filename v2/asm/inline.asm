orig $c000
; inline.s - assemble with casm

; FIXME: tsr label undefined (commented out in equat.s)
; FIXME: missing "access" label
; FIXME: missing "nchk1" label

; original inline.s has syntax error in line 1566
; also, where does ml.inline fit in to the build process?

; open 15,8,15,"s:ml.inline":close 15
; include "equat.s",8
; for pass=1 to 3:org $c000,-(pass=3),8,"ml.inline":print pass;

ARYTAB	= 47	; start of arrays
VARPNT	= 71	; $47-$48 Pointer to the Current BASIC Variable Value

nchk1	= $ff	; FIXME: just a guess for now

hc000: jmp inline
hc003: jmp inline0
hc006: jmp term
hc009: jmp setvars
hc00c: jmp read0
hc00f: jmp newuser
hc012: jmp btmvar
hc015: jmp clrarr
;
;  jump table routines
;
@outastr:
	lda #0
	jmp usetbl1
dskin:
	lda #2
	jmp usetbl1
tenwait:
	lda #22
	jmp usetbl1
xgetin:
	lda #23
	jmp usetbl1
xchrout:
	sta $fe
xchrout1:
	pha
	txa
	pha
	tya
	pha
	lda #24
	jsr usetbl1
	pla
	tay
	pla
	tax
	pla
	rts
usevar:
	lda #29
	jmp usetbl1
putvar:
	lda #30
	jmp usetbl1
zero:
	lda #31
	jmp usetbl1
minusone:
	lda #32
	jmp usetbl1
chatchk:
	lda #43
	jmp usetbl1
memory:
	lda #44
	jmp usetbl1
prtvar:
	lda #45
	jmp usetbl1
prtvar0:
	lda #46
	jmp usetbl1
carchk:
	lda #47
	jmp usetbl1
getkbd:
	lda #48
	jmp usetbl1
getmod:
	lda #49
	jmp usetbl1
outscn0:
	sta $fe
outscn:
	lda #50
	jmp usetbl1
outmod:
	lda #51
	jmp usetbl1
output:
	lda #55
	jmp usetbl1

; ********************************
; * string input routines
; ********************************

; ********************************
; * input line to an$            *
; ********************************
; * on entry:                    *
; * pl=0 for upper/lower case    *
; * pl=1 for upper case only     *
; * w$ = text that was wrapped   *
; * or text to edit in           *
; * edit mode.                   *
; * p$ = text for prompt         *
; * .x register holds mode       *
; * .y register holds password   *
; * mode flags                   *
; ********************************
; * on exit:                     *
; * an$ = text that was typed    *
; * w$ = text that was wrapped   *
; * location "chat" holds:       *
; * 0 = normal                   *
; * 1 = delete on column one     *
; *     or dot on column one     *
; * 2 = chat check hit           *
; * 3 = carrier/time loss        *
; ********************************

inline:
	stx editor	;  flags
	sty passmode
	ldx #16
	jsr usevar	;  pl
	lda var		;  case lock
	and #1
	sta case
inline0:
	ldy #$00
	sty index
	sty tmp1	; chars typed
	sty mjump
	sty chat	; result code
	sty buffer
	jsr prprompt
	lda editor
	and #$30	; word wrap
	beq in0c	; and edit mode
	ldx #27
	jsr usevar	; w$
	ldy var
	beq in1
	sty tmp1
in0:
	dey
	lda (var+1),y
	sta buffer,y
	cpy #0
	bne in0
in0c:
	ldy #0		; print buffer
	cpy tmp1
	beq in0d
in0a:
	lda buffer,y
	jsr xchrout
	iny
	cpy tmp1
	bcc in0a
	lda tmp1
	sta index
in0d:
	lda editor	; edit mode
	and #$20
	beq in0b
	jsr prcr
	lda #0
	sta index
	jsr prprompt
in0b:
	jsr zero
	ldx #27
	jsr putvar	; w$
in1:
	jsr xgetin	; main loop
	sta $fe
	jsr carchk
	beq in1a
	lda #0
	sta index
	lda #3
	sta chat
	jmp ctrlm
in1a:
	jsr chatchk
	beq in1b
	jsr chatmode
	jmp inline0
in1b:
	lda $fe
	ldy index
	ldx #13		; # of ctrl chars
in2:
	cmp ctrlchrs-1,x
	beq in3
	dex
	bne in2
	jsr ctrlchk
	bcc in1
put:
	cpy llen
	bcc put0
	jmp wrap
put0:
	sta buffer,y
	jsr xchrout
	inc index
	ldy index
	cpy tmp1
	bcc put1
	sty tmp1
put1:
	jmp in1
ctrlchrs:
	byte 04,08,13,20,21,22,23,24,25,14,15,02,46
ctrl:
	word ctrld,ctrli,ctrlm
	word ctrlt,ctrlu,ctrlv
	word ctrlw,ctrlx,ctrly
	word ctrln,ctrlo,ctrlb
	word dot
in3:
	dex
	txa
	asl
	tax
	lda ctrl,x
	sta ctrljm+1
	lda ctrl+1,x
	sta ctrljm+2
	ldy index
ctrljm:
	jmp $ffff

ctrld:
	ldx tmp1
	beq ctrld3
	cpx index
	beq ctrld3
ctrld1:
	cpy tmp1
	bcs ctrld2
	lda buffer+1,y
	sta buffer,y
	iny
	bne ctrld1
ctrld2:
	dec tmp1
ctrld3:
	jmp in1

ctrli:
	ldx tmp1
	cpx llen
	bcs ctrli3
ctrli1:
	cpx index
	beq ctrli2
	lda buffer-1,x
	sta buffer,x
	dex
	jmp ctrli1
ctrli2:
	inc tmp1
	lda #' '
	sta buffer,y
ctrli3:
	jmp in1

ctrlm:
	jsr prcr
	lda index
	sta var
	lda #<buffer
	sta var+1
	lda #>buffer
	sta var+2
	ldx #0
	jsr putvar ; an$
	jmp memory

ctrlt:
	cpy #0
	beq ctrlt1
	lda buffer-1,y
	jsr ctrlt4
	dec index
ctrlt2:
	jmp in1
ctrlt1:
	ldx editor
	bpl ctrlt2
	lda #20
	sta buffer
	lda #1
	sta chat
	rts

ctrlt3:
	eor #128
	jmp xchrout
ctrlt4:
	ldx mci
	bmi ctrlt6
	jsr colorchk
	bcc ctrlt5
	cmp #'{rvrs on}'
	beq ctrlt3
	cmp #'{rvrs off}'
	beq ctrlt3
ctrlt6:
	jmp prdel
ctrlt5:
	rts

ctrlu:
	cpy tmp1
	bcs ctrlu1
	lda buffer,y
	jmp put
ctrlu1:
	jmp in1

ctrlv:
	jsr prcr
	jsr prprompt
	ldy #0
ctrlv1:
	cpy index
	bcs ctrlv2
	lda buffer,y
	jsr xchrout
	iny
	bne ctrlv1
ctrlv2:
	jmp in1

ctrlw:
	cpy #0
	beq ctrlw1
	dey
	lda buffer,y
	jsr ctrlt4
	lda buffer,y
	cmp #' '
	bne ctrlw
ctrlw1:
	sty index
	jmp in1

ctrlx:
	lda #'{pound}'
	jsr xchrout
	jsr prcr
	jmp inline0

ctrly:
	ldy index
	cpy tmp1
	bcs ctrly1
	lda buffer,y
	cmp #' '
	php
	jsr xchrout
	inc index
	plp
	bne ctrly
ctrly1:
	jmp in1

ctrln:
	ldy index
	cpy tmp1
	bcs ctrln1
	lda buffer,y
	jsr xchrout
	inc index
	jmp ctrln
ctrln1:
	jmp in1

ctrlo:
	cpy #0
	beq ctrlo2
	lda #0
	sta tmp2
	lda index
	sta tmp3
ctrlo1:
	ldy tmp2
	lda buffer,y
	ldy index
	cpy llen
	bcs ctrlo2
	sta buffer,y
	inc index
	jsr xchrout
	inc tmp2
	dec tmp3
	bne ctrlo1
ctrlo2:
	ldy index
	cpy tmp1
	bcc ctrlo3
	sty tmp1
ctrlo3:
	jmp in1

ctrlb:
	cpy #0
	beq ctrlb2
ctrlb1:
	lda buffer-1,y
	jsr ctrlt4
	dey
	bne ctrlb1
	sty index
ctrlb2:
	jmp in1

dot:
	cpy #0
	bne dot1
	lda editor
	and #2
	beq dot1
	lda #1
	sta chat
	rts
dot1:
	lda #'.'
	jmp put

wrap:
	sta tmp2
	lda editor
	and #16
	bne wrap0
	lda #7
	jsr xchrout
	jmp in1
wrap0:
	lda tmp2
	cmp #' '
	bne wrap1
	jmp ctrlm
wrap1:
	sta tmp2
	dey
wrap2:
	lda buffer,y
	cmp #' '
	beq wrap3
	dey
	bne wrap2
	lda tmp2
	sta buf2
	lda #1
	sta var
	lda #<buf2
	sta var+1
	lda #>buf2
	sta var+2
	ldx #27
	jsr putvar	; w$
	jmp ctrlm
wrap3:
	ldx #0
	sty tmp3
	iny
	cpy index
	bcs wrap5
wrap4:
	lda buffer,y
	sta buf2,x
	jsr prdel
	inx

;  original source - line 3590 has a corrupted line number
;  3570 wrap4:	lda buffer,y:sta buf2,x
;  3580		jsr prdel:inx:iny	;  These are both linked on the
; *1566*	cpy index:bcc wrap4	;  same logical screen line
; 					;  and 1566 was a syntax error
;  these have been re-entered as:
;  3570 wrap4:	lda buffer,y:sta buf2,x
;  3580		jsr prdel:inx:iny
; *3590*	cpy index:bcc wrap4

;  relist - now has changed to line 3570

;  search for "1566" (in monitor: h 0801 9fff 1e 06)
;  1f01: 1e 06
;  bytes for "3590": 0e 06
;  (C:$1eed) m 1f01 1f02
;  >C:1f01  1e 06                      ..
;  (C:$ca3b) ~ +3590
;  +3590
;  $0e06
;  0007006
;  %1110 00000110
;  (C:$ca3b) > 1f01 06 0e
;  (C:$ca3b)

	iny
	cpy index
	bcc wrap4
wrap5:
	lda tmp2
	sta buf2,x
	inx
	stx var
	lda #<buf2
	sta var+1
	lda #>buf2
	sta var+2
	ldx #$1b
	jsr putvar ; w$
	ldy tmp3
	sty index
	jmp ctrlm

prprompt:
	lda editor
	and #4
	bne prpr1
	lda passmode
	pha
	lda #0
	sta passmode
	ldx #28
	jsr prtvar0 ; p$
	lda #':'
	jsr xchrout
	lda #' '
	jsr xchrout
	pla
	sta passmode
prpr1:
	rts

; build.lst line 224 = inline.asm line 555
; on exit: carry clear if control char
ctrlchk:
	pha
	lda editor
	and #1
	beq ctrlch0
	pla
ctrlchk1:
	jsr colorchk
	bcc ctrlch2
	cmp #'{rvrs on}'
	beq ctrlch2
	cmp #'{rvrs off}'
	beq ctrlch2
	pha
ctrlch0:
	pla
	cmp #32		; space
	bcc ctrlch1
	cmp #128
	bcc ctrlch2
	cmp #160	; shift-space
	bcs ctrlch2
	cmp #133	; f1
	bcc ctrlch1
	cmp #141	; f8
	bcs ctrlch1
ctrlch2:
	sec
	rts
ctrlch1:
	clc
	rts

; on exit: carry clear if color chr
colorchk:
	sty cytmp
	ldy #15
colrch0:
	cmp colors,y
	beq colrch1
	dey
	bne colrch0
	ldy cytmp
	sec
	rts
colrch1:
	ldy cytmp
	clc
	rts

prcr:
	lda #$0d
	jmp xchrout
prdel:
	lda #$14
	jmp xchrout

; *************
; * chat mode *
; *************
chatmode:
	lda #$00
	sta $fe
	sta chatpage
	ldx #34
	jsr prtvar0 ; c1$
	lda #1
	sta inchat
	lda case
	pha
	lda tsr
	pha
	lda #0
	sta case
chat1:
	jsr chatchk
	beq chat3
	lda carrst
	bpl chat1a
	lda #0
	sta carrst
chat1a:
	jsr getkbd
	bne chat2
	jsr getmod
	beq chat1
chat2:
	cmp #'{home}'
	beq chat1
	jsr xchrout
	jmp chat1
chat3:
	pla
	cmp tsr
	bcc chat4
	sta tsr
chat4:
	pla
	sta case
	lda #0
	sta inchat
	ldx #35
	jsr prtvar0 ; c2$
	lda editor
	and #130
	beq chat5
	ldx #39
	jsr prtvar0 ; c3$
chat5:
	ldx #36
	jmp btmvar ; co$

; ********************************
; * setup routines               *
; ********************************

; * setup important variables
setvars:
	jsr zero
	lda access
	bmi setvars1
	ldx #24
	jsr usevar ; ac%
	lda var+1
	sta access
	rts
setvars1:
	and #$7f
	sta access
	sta var+1
	lda #0
	sta var
	ldx #24
	jsr putvar ; ac%
setvars2:
	rts

; ********************************
; * terminal mode                *
; ********************************
term0:
	lda #0
	sta interm
	rts
term:
	lda #1
	sta interm
	lda 653
	cmp #6
	beq term0
	jsr getkbd
	beq term1
	ldx 203
	cpx #63
	bne term2
	ldx 653
	cpx #2
	beq term3
term2:
	sta $fe
	jsr outmod
term1:
	jsr getmod
	lda $fe
	beq term
	jsr outansi
	jmp term
term3:
	jsr rsdisab
	lda 56576
	pha
	and #$fb
	sta 56576
	ldx #4
	jsr tenwait
	pla
	sta 56576
	jsr rsinabl
	jmp term
;
; output to screen, interpret ansi
;
outansi:
	lda nchk1
	and #2
	bne outansi2
	jmp outscn
outansi0:
	ldx #0
	stx ansiptr
	jmp outscn
outansi1:
	inx
	stx ansiptr
	rts
outansi2:
	lda $fe
	ldx ansiptr
	sta ansibuf,x
	lda ansibuf
	cmp #27
	bne outansi0
	cpx #1
	bcc outansi1
	lda ansibuf+1
	cmp #'['
	bne outansi0
	cpx #2
	bcc outansi1
	lda ansibuf,x
	cmp #';'
	beq outansi1
	cmp #'0'
	bcc outansi3
	cmp #':'
	bcc outansi1
outansi3:
	ldx #2
	stx ansiptr
	cmp #'m'
	beq ansim
	cmp #'A'
	beq ansia
	cmp #'B'
	beq ansib
	cmp #'C'
	beq ansic
	cmp #'D'
	beq ansid
	cmp #'F'
	beq ansih
	cmp #'H'
	beq ansih
	cmp #'J'
	beq ansij
	jmp outansi0

ansim0:
	lda #0
	sta ansiptr
	sta ansibuf
	sta ansibuf+1
	rts
ansim:
	jsr ansiparm
	bcs ansim0
	cmp #0
	bne ansim1
	lda #'{rvrs off}'
	jsr outscn0
	jmp ansim
ansim1:
	cmp #7
	bne ansim2
	lda #'{rvrs on}'
	jsr outscn0
	jmp ansim
ansim2:
	cmp #30
	bcc ansim
	cmp #38
	bcs ansim
	sec
	sbc #30
	tax
	lda ansiclrs,x
	jsr outscn0
	jmp ansim

ansia:
	lda #'{up}'
ansia1:
	sta reptchr
	jsr ansiparm
	bcc ansia2
	lda #1
ansia2:
	sta reptcnt
	jsr ansirept
	jmp ansim0

ansib:
	lda #'{down}'
	jmp ansia1

ansic:
	lda #'{right}'
	jmp ansia1

ansid:
	lda #'{left}'
	jmp ansia1

ansij:
	lda #'{clear}'
	jsr outscn0
	jmp ansim0

ansih0:
	jmp ansim0

ansih:
	jsr ansiparm
	bcs ansih0
	sec
	sbc #1
	sta ansiposv
	lda scnpos	; 211
	sta ansiposh
	jsr ansiparm
	bcs ansih1
	sec
	sbc #1
	sta ansiposh

ansih1:
	lda #'{home}'
	jsr outscn0
	lda #'{down}'
	ldx ansiposv
	jsr ansirpt0
	lda #'{right}'
	ldx ansiposh
	jsr ansirpt0
	jmp ansim0

ansirpt0:
	sta reptchr
	stx reptcnt
ansirept:
	lda reptcnt
	beq ansirpt1
	lda reptchr
	jsr outscn0
	dec reptcnt
	jmp ansirept
ansirpt1:
	rts

reptcnt:
	byte 0
reptchr:
	byte 0
ansibuf:
	area 32,18 ; 18 spaces
ansiptr:
	byte 0
ansiposh:
	byte 0
ansiposv:
	byte 0
ansiprm:
	byte 0
ansiclrs:
	ascii "{black}{red}{green}{yellow}{blue}{purple}{cyan}{white}"

ansiparm:
	lda #0
	sta ansiprm
	ldx ansiptr
	lda ansibuf,x
	inc ansiptr
	cmp #';'
	bne ansiprm2
ansiprm1:
	ldx ansiptr
	lda ansibuf,x
	inc ansiptr
ansiprm2:
	cmp #'0'
	bcc ansiprm3
	cmp #':'
	bcc ansiprm4
	clc
	lda ansiprm
	rts

ansiprm3:
	sec
	lda ansiprm
	rts
ansiprm4:
	pha
	lda ansiprm
	asl
	asl
	clc
	adc ansiprm
	asl
	sta ansiprm
	pla
	sec
	sbc #'0'
	clc
	adc ansiprm
	sta ansiprm
	jmp ansiprm1

; print string variable to bottom
btmvar:
	inc scnlock
	lda scnmode
	bne btm2
	lda #$80
	sta $fd
	lda #<1996
	ldy #>1996
	sta $fb
	sty $fc
	ldy #15
	lda #32
	ora $fd
btm0:
	sta ($fb),y
	dey
	bpl btm0
	jsr usevar
	ldy #0
	sty btmx
	sty btmy
	lda var
	beq btm2
	cmp #16
	bcs btm1
	lda #16
	sec
	sbc var
	lsr
	sta btmy
btm1:
	lda (var+1),y
	jsr CheckSpecial ; interpret encoded f-key chars
	sty btmx
	cmp #0
	bmi btm1a
	cmp #64
	bcc btm1a
	eor #64
btm1a:
	ora $fd
	ldy btmy
	sta ($fb),y
btm1b:
	inc btmy
	ldy btmx
	iny
	cpy #16
	bcs btm2
	cpy var
	bcc btm1
btm2:
	dec scnlock
	rts
btmy:
	byte 0
btmx:
	byte 0
;
; * clear the (.x+1)th array
;
clrarr:
	lda ARYTAB	; 47
	sta VARPNT	; 71
	lda ARYTAB+1	; 48
	sta VARPNT+1	; 72
clrar1:
	ldy #2
	lda (71),y
	sta 20
	iny
	lda (71),y
	sta 21
	cpx #0
	beq clrar3
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
	dex
	jmp clrar1
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

spchars:
	byte 44,58,34,42,63,61,13,94 ; ",:"*?=<cr>^"

CheckSpecial:
	cmp #$85
	bcc chkspcl1
	cmp #$8d
	bcs chkspcl1
	stx cxsav
	sec
	sbc #$85
	tax
	lda spchars,x
	ldx cxsav
chkspcl1:
	rts
;
; ********************************
; * file read routines           *
; ********************************

; * unabortable for new user
newuser:
	cpx #$00
	beq newuser1
	stx filenum
newuser1:
	lda #$01
	sta readmode
	jsr readf
	lda #$00
	sta readmode
	rts

; * main file reader

read0:
	cpx #$00
	beq read0a
	stx filenum
read0a:
	cpy #0
	beq readf
	jmp movie
readf:
	ldx filenum
	ldy #0
	jsr dskin
	lda $90
	sta dstat
	lda index
	beq read1
	lda buf2
	cmp #'{up arrow}'
	beq read2
read1:
	jsr zero
	lda index
	cmp #80
	beq read1a
	jsr minusone
read1a:
	ldx #$0f
	jsr putvar ; lp
	jsr zero
	ldx #$11
	jsr putvar ; rc
	jsr <@outastr
	lda dstat
	bne read2
	lda readmode
	bne readf
	ldx #$11
	jsr usevar ; rc
	lda var
	beq readf
read2:
	rts

; ********************************
; * movie view                   *
; ********************************
movie:
	sty movdly
movie1:
	ldx filenum
	jsr chkin
	jsr getin
	sta $fe
	jsr readst
	sta dstat
	jsr clrchn
	ldx movdly
	jsr delay
	jsr output
	lda chat
	bne movie2
	lda dstat
	beq movie1
movie2:
	rts
movdly:
	byte 0
delay:
	ldy #$00
dl1:
	dey
	bne dl1
	dex
	bne dl1
	rts
