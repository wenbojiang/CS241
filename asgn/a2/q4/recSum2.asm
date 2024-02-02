lis $20
.word 0xffff000c        ; output address

stirling:
 
sw $1, -4($30)
sw $2, -8($30)
sw $4, -12($30)
sw $31, -16($30)

lis $4
.word 16
sub $30, $30, $4

lis $3
.word 1
beq $1, $0, done
add $2, $1, $0
lis $4
.word 1
sub $1, $1, $4
lis $4
.word stirling
jalr $4
mult $3, $2
mflo $3
done:
    lis $4
    .word 16
    add $30, $30, $4
    lw $1, -4($30)
    lw $2, -8($30)
    lw $4, -12($30)
    lw $31, -16($30)
    jr $31