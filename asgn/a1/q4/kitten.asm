sw $20, -4($30)
sw $21, -8($30)
sw $1, -12($30)
sw $5, -16($30)
lis $5
.word 16
sub $30, $30, $5


lis $3
.word 0
lis $20
.word 0xffff000c        ; output address
lis $21
.word 0xffff0004        ; input address
lis $1
.word -1                ; end of input
lis $5
.word 1


start:  lw $4,  0($21)   ; read byte
        beq $4, $1, end
        add $3, $3, $5
        sw $4,  0($20)   ; write byte
        beq $0, $0, start

end:
        lis $5
        .word 16
        add $30, $30, $5
        lw $5, -16($30)
        lw $1, -12($30)
        lw $21, -8($30)
        lw $20, -4($30)
        jr $31
