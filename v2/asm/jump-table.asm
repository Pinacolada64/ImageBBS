; print"11/08/90 03:28p"
; jump table for &'s

	word outastr	; &
	word $f400	; &,1  inline	(swap1.asm)
	word dskin	; &,2		(disk-io.asm)
	word $fc00	; &,3  read0	(swap3.asm)
	word getmdm	; &,4
	word getversn	; &,5
	word $f406	; &,6  password	(swap1.asm)
	word prgfile	; &,7
	word dskdir	; &,8
	word $f806	; &,9  btmvar	(swap2.asm)
	word $f800	; &,10 term	(swap2.asm)
	word $ee00	; &,11 clrarr	(struct.asm)
	word $fc03	; &,12 newuser	(swap3.asm)
	word inchr	; &,13
	word dumparr	; &,14
	word convan	; &,15
	word 49152	; &,16
	word 49155	; &,17
	word setmode	; &,18
	word getversn	; &,19
	word getversn	; &,20
	word getversn	; &,21
	word tenwait	; &,22
	word xgetin	; &,23
	word xchrout1	; &,24
	word $f80c	; &,25 sound	(swap2.asm)
	word callmod	; &,26
	word arraysav	; &,27
	word arrayres	; &,28
	word usevar	; &,29
	word putvar	; &,30
	word zero	; &,31
	word minusone	; &,32
	word getarr	; &,33
	word putarr	; &,34
	word getln	; &,35
	word putln	; &,36
	word trapon	; &,37
	word trapoff	; &,38
	word prtln	; &,39
	word forcegc	; &,40
	word setbaud	; &,41
	word $e400	; &,42 ecs	(ecs.asm)
	word chatchk	; &,43
	word trace	; &,44
	word prtvar	; &,45
	word prtvar0	; &,46
	word carchk	; &,47
	word getkbd	; &,48
	word getmod	; &,49
	word outscn	; &,50
	word outmod	; &,51
	word chkflags	; &,52
	word logoff	; &,53
	word $f409	; &,54 useeditr	(swap1.asm)
	word output	; &,55
	word $f803	; &,56 chatmode (swap2.asm)
	word $fc06	; &,57 relread	(swap3.asm)
	word setalm	; &,58
	word farerr	; &,59
	word struct	; &,60
	word poscrsr	; &,61
	word settim	; &,62
	word $f403	; &,63 inline1	(swap1.asm)
	word $f809	; &,64 convstr	(swap2.asm)
	word $fc09	; &,65 convert	(swap3.asm)
	word calcgoto	; &,66
	word $fc0c	; &,67 copyrite (swap3.asm)
	word $ee03	; &,68 struct	(struct.asm)
	word dispstr	; &,69
	word cursposn	; &,70
	word cursmenu	; &,71
