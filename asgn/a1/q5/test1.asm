lis $3              ; input 
.word 1
lis $4              ; output    
.word 2  
lis $5              ; multiplier to aggregate and 2 for dividing 128
.word 3
lis $6              ; result    
.word 4
lis $7              ; ASCII '0'
.word 5
lis $8              ; used to store the multiplied result
.word 6             
lis $9              ; reading input
.word 7
lis $10             ; ASCII '\n'
.word 8
lis $11             ; divisor
.word 9
lis $12             ; flag for negative
.word 10             
lis $15             ; ASCII '-' and value 256
.word 11



sw $3, -4($30)
sw $4, -8($30)
sw $5, -12($30)
sw $6, -16($30)
sw $7, -20($30)
sw $8, -24($30)
sw $9, -28($30)
sw $10, -32($30)
sw $11, -36($30)
sw $12, -40($30)
sw $15, -44($30)
lis $3
.word 44
sub $30, $30, $3

lis $3              ; input 
.word 0xffff0004
lis $4              ; output    
.word 0xffff000c    
lis $5              ; multiplier to aggregate and 2 for dividing 128
.word 10 
lis $6              ; result    
.word 0
lis $7              ; ASCII '0'
.word 48
lis $8              ; used to store the multiplied result
.word 0             
lis $9              ; reading input
.word 0
lis $10             ; ASCII '\n'
.word 0x0A
lis $11             ; divisor
.word 128
lis $12             ; flag for negative
.word 0             
lis $15             ; ASCII '-' and value 256
.word 45

start:
    lw $9, 0($3)
    beq $9, $10, shift
    beq $9, $15, flag
    sub $9, $9, $7
    mult $6, $5
    mflo $8
    add $6, $8, $9
    beq $0, $0, start

flag: 
    add $12, $15, $0
    beq $0, $0, start

adjust:
    lis $15
    .word 256
    sub $6, $15, $6
    beq $0, $0, division

shift:
    lis $5
    .word 2
    beq $12, $15, adjust

division:
    beq $11, $0, end
    div $6, $11
    mfhi $6             ; remainder
    mflo $8             ; quotient
    add $8, $8, $7
    sw $8, 0($4)
    div $11, $5
    mflo $11
    beq $0, $0, division

end:
    sw $10, 0($4)
    lis $3
    .word 44
    add $30, $30, $3
    lw $15, -44($30)
    lw $12, -40($30)
    lw $11, -36($30)
    lw $10, -32($30)
    lw $9, -28($30)
    lw $8, -24($30)
    lw $7, -20($30)
    lw $6, -16($30)
    lw $5, -12($30)
    lw $4, -8($30)
    lw $3, -4($30)
    jr $31
