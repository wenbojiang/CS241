sw $20, -4($30)
sw $1, -8($30)
sw $2, -12($30)
sw $3, -16($30)
sw $5, -20($30)
sw $6, -24($30)
sw $9, -28($30)
sw $10, -32($30)
sw $11, -36($30)
sw $12, -40($30)
sw $15, -44($30)
sw $29, -48($30)
sw $30, -52($30)

lis $5
.word 52
sub $30, $30, $5


lis $20
.word 0xffff000c        ; output address
lis $2
.word 4
lis $3
.word 1
lis $10
.word 10
lis $9
.word 48
lis $12
.word -3            ; ascii code of minus sign - 48
lis $15
.word 0x80000000  ; negative boundary 

print: 
        add $29, $30, $0
        slt $11, $1, $0 
        bne $11, $0, negative
push:
    div $1, $10
    mflo $1         ; move quotient to $3
    mfhi $5         ; move remainder to $5
    sub $30, $30, $2
    sw $5, 0($30)
    beq $1, $0, pop
    beq $0, $0, push

pop:    beq $3, $0, minus
pop1:   beq $30, $29, end
        lw $6, 0($30)
        add $30, $30, $2
        add $6, $6, $9
        sw $6, 0($20)     ; print digit
        beq $0, $0, pop1

negative:
    beq $1, $15, max
    sub $1, $0, $1
    add $3, $0, $0
    beq $0, $0, push

minus: 
    sub $30, $30, $2
    sw $12, 0($30)
    beq $0, $0, pop1

max: 
    div $1, $10
    mflo $1         ; move quotient to $3
    mfhi $5         ; move remainder to $5
    sub $5, $0, $5
    sub $30, $30, $2
    sw $5, 0($30)
    beq $0, $0, negative
end: 
   
        
    sw $10, 0($20)   ; print a line feed
     lis $5
    .word 52
    add $30, $30, $5
    lw $20, -4($30)
    lw $1, -8($30)
    lw $2, -12($30)
    lw $3, -16($30)
    lw $5, -20($30)
    lw $6, -24($30)
    lw $9, -28($30)
    lw $10, -32($30)
    lw $11, -36($30)
    lw $12, -40($30)
    lw $15, -44($30)
    lw $29, -48($30)
    ;lw $30, -52($30)
    jr $31


