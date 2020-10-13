.export _copyshort ; prepend labels with _ so C can see them

.import popa, popax
.importzp ptr1, ptr2

src = ptr1 ; borrow runtime zp pointers
dst = ptr2 ; tmp1 and tmp2 are also available


.code

_copyshort:
sta dst ; __fastcall__ so last arg is
stx dst + 1 ; in A/X

jsr popax ; pull src off stack
sta src
stx src + 1

jsr popa ; pull len off stack
pha ; save len for return value
tay
dey
: lda (src),y
sta (dst),y
dey
bpl :-

ldx #0 ; return len in A/X
pla
rts
