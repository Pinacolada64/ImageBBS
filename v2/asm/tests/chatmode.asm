' 4/Jun/2016 11:14
' i am assuming this is a header prg which displays saved chats,
' but how is the chat logging function called from within the BBS?

' 4/Apr/2019 3:38
' This is an LtK program, as evidenced by label definitions at
' https://www.floodgap.com/retrobits/ckb/ltk/isam02.html
' and
' https://github.com/sixofdloc/LTK/blob/master/include/ltk_dos_addresses.asm

' FIXME: finish "chat1" display routine - not sure how yet

' legacy native c64 FastAssembler code:
' for pass=1 to 3:org $0801,-(pass=3),8,"@:chatmode"
' print pass;
' this wrote a line of BASIC:
' send "1990 sys"+mid$(str$(ml),2)+":rem new image"
' unsend

{number:1990}
	sys{sym:ml}:rem new image
{asm}
bnkout	=$fc4e		; set ALLMAP mode
			; $8000-$9FFF is shadow (host adapter) RAM in ALLMAP mode

bankin	=$fc71		; set KERTRAP mode
			; $8000-$9FFF is normal RAM in KERTRAP mode

allmap	=$8000		; start of host adapter address space

; LtK DOS primitive subroutines
output	=allmap+$48	; output string: <.x, >.y
fnfile	=allmap+$4b	; search directory for file
clrhdr	=allmap+$6c	; clear HDRBLK buffer
alcont	=allmap+$7b	; allocate contiguous blocks to file
mnsext	=allmap+$9c	; execute DOS mini-sub processor

; DOS mini-subs, addressed as a block offset on LU 10
catlog	=$24		; index catalog

; LtK DOS file types (stored at FILTYP in header block)
cntfil	=$05		; contiguous block sequential data

; LtK host adapter disk RAM buffers (each 1 block in size).
; The following definitions refer to locations within
; the 512 byte 'hdrblk' buffer, which upon locating
; a file, becomes an image of the file's header block

;			; offset
hdrblk	=allmap+$11e0	;		; file header block buffer address (512 bytes)
filnam	=hdrblk+$00	; +$00-0f 'f'	; filename padded w/trailing nulls (max 16 bytes)
nbinfl	=hdrblk+$10	; +$10-11 'nb'	; file size in blocks, includes header
			; 		; "Number of Blocks IN FiLe"
; nrpblk .word $0000	; +$12-13	; records per block (RELative only)
; nbprec .word $0000	; +$14-15	; bytes per record
; nrinfl .word $0000	; +$16-17	; active records in file
; filtyp .word $0000    ; +$18-19 'ty'	; binary file type
; nblkpc .byte $00      ; +$1a		; bytes in last block (MSB)
; loadad .byte $00      ; +$1b		; load address, $0000 if none
; nbytlb .word $0000    ; +$1c-1d	; bytes in last block (LSB)
; usrlun .byte $00      ; +$1e		; binary LU & user
; hdrflg .byte $00      ; +$1f		; valid header block flag ($ac or $af = active header)
; hdradr .word $0000    ; +$20-21 'bl'	; header block address (file origin)

filtyp	=hdrblk+$18	; binary file type
blmilo	=hdrblk+$20	; BLock list (MIddle & LOw order bytes) [aka 'hdradr' seen above]

; 0              0|1 1|  |1   |1 1|1     |2 2
; 0123456789abcdef|0 1|23|4567|8 9|abcdef|0 1
; ----------------+---+--+----+---+------+---
; ffffffffffffffff| nb|..|....|ty |......|bl

size	=16

ml:
	jsr bnkout
	jsr clrhdr
	ldy #7		; 8 chars in filename "chatfile"
loop:
	lda name,y
	sta filnam,y	; copy to header block
	dey
	bpl loop
	jsr fnfile	; find file in currently-logged LU and USER
	bcc found
	sta idxoff	; not found, so create file?
	stx idxblk
	sty idxblk+1
	lda #cntfil	; set filetype to LtK contiguous SEQ file
	sta filtyp
	lda #>size	; set file size to 16 blocks?
	sta nbinfl
	lda #<size
	sta nbinfl+1
	jsr alcont	; attempt to allocate contiguous space
	bcs noroom
	lda idxoff
	pha		; FIXME: missing matching pla
	ldx idxblk
	ldy idxblk+1
	lda #catlog	; load opcode for "index catalog"
	jsr mnsext	; jump to DOS mini-sub processor
	ldx #<msg1
	ldy #>msg1
	jsr output	; output "ChatFile Created"
found:
; Pinacolada here:
; LtK documentation suggests copying the header block out of $8000-$9fff
; once 'fnfile' routine finds the file. I added their snippet which copies the
; first 256 bytes of the header block to 'blokbuf', until now an un-
; referenced label. TODO: maybe should be expanded to copy all 512 bytes.

l00003:
	ldy #0
l00004:
	lda hdrblk,y	; copy header image into safe RAM
	sta blokbuf,y	; outside of the $8000-$9fff range
        iny
	bne l00004	; loop til done
; end of LtK documentation addition

	ldx #<msg2
	ldy #>msg2
	jsr output	; output "Chat Mode:"
	jsr chatmode
done:
	jsr bankin
	jmp $a8f8	; Perform DATA: In effect, it skips the next BASIC
			; statement, much like REM.

noroom:
	ldx #<msg3
	ldy #>msg3
	jsr output	; output "No Room"
	jmp done

msg1:
	ascii "ChatFile Created"
	byte 13,0
msg2:
	ascii "Chat Mode:"
	byte 13,0
msg3:
	ascii "No Room"
	byte 13,0

idxoff:
	byte $00	; index offset?
idxblk:
	word $0000

name:
	ascii "chatfile"

chatmode:
	lda blmilo+0	; block list (middle & low order bytes)
	sta blknum+0
	lda blmilo+1	; block list (middle & low order bytes)
	sta blknum+1
chat0:
	lda 198		; check for keypress
	beq chat1	; none, so continue on
	rts		; key hit, so end
chat1:
; FIXME: missing code. presumably some kind of display function here
	rts

blokbuf:
; define a block of 512 undefined bytes. copy of LtK block header buffer?
	area 512

blknum:
	word $ffff
{endasm}
