lis $4
.word 4
lis $5
.word 1
sw $31, -4($30)      ; push $31 to stack
lis $31
.word 4
sub $30, $30, $31
lis $21             ; load the address of procedure compare
.word compare
 
add $6, $1, $0
add $7, $2, $0
start:      
    beq $7, $5, end 
    lw $8, 0($6)
    add $1, $8, $0
    lw $9, 4($6)
    add $2, $9, $0
    jalr $21
    beq $3, $0, end
    add $6, $6, $4
    sub $7, $7, $5
    beq $0, $0, start

compare: 
    slt $3, $1, $2
    jr $31

end:
   lis $31
   .word 4
   add $30, $30, $31
   lw $31, -4($30) ; pop $31 from stack
   jr $31 ; end of program