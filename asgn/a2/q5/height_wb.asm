lis $8
.word 0

height:
    sw $1, -4($30)
    sw $2, -8($30)
    sw $4, -12($30)
    sw $5,  -16($30)
    sw $6,  -20($30)
    sw $7,  -24($30)
    sw $8,   -28($30)
    sw $9,   -32($30)
    sw $10,  -36($30)
    sw $31, -40($30)
    lis $4
    .word 40
    sub $30, $30, $4

    slt $4, $8, $0
    bne $4, $0, done   ; index < 0
    slt $4, $8, $2
    beq $4, $0, done   ; index >= array size

    ; calculate the height of the left subtree
    lis $4
    .word 1
    add $10, $8, $4
    lis $4
    .word 4
    mult $10, $4
    mflo $9
    add $9, $9, $1
    lw $8, 0($9)
    lis $5
    .word height
    jalr $5
    add $6, $3, $0      ; save the height of left tree


    ; calculate  the height of the right subtree
    lis $4
    .word 1
    add $10, $10, $4
    lis $4
    .word 4
    mult $10, $4
    mflo $9
    add $9, $9, $1
    lw $8, 0($9)
    lis $5
    .word height
    jalr $5
    add $7, $3, $0      ; save the height of right tree


    ; the height of the tree under the current node: 1 + max(leftSubTree, rightSubTree)
    sltu $4, $6, $7
    bne $4, $0, right
    beq $0, $0, left

done:
    lis $3
    .word 0
    beq $0, $0, end

right:
    lis $4
    .word 1
    add $3, $7, $4
    beq $0, $0, end

left: 
    lis $4
    .word 1
    add $3, $6, $4
    beq $0, $0, end

end:
    lis $4
    .word 40
    add $30, $30, $4
    lw $1, -4($30)
    lw $2, -8($30)
    lw $4, -12($30)
    lw $5, -16($30)
    lw $6,  -20($30)
    lw $7,  -24($30)
    lw $8,  -28($30)
    lw $9,  -32($30)
    lw $10,  -36($30)
    lw $31, -40($30)
    jr $31
