lis $4                             
.word 0

height:
    sw $4, -4($30)
    sw $5, -8($30)
    sw $6, -12($30)
    sw $7,  -16($30)
    sw $8,  -20($30)
    sw $10,  -24($30)
    sw $31, -28($30)
    lis $10
    .word 28
    sub $30, $30, $10

    slt $10, $4, $0
    bne $10, $0, done   ; index < 0
    slt $10, $4, $2
    beq $10, $0, done   ; index >= array size


    lis $10                         ; constant 1
    .word 1

    add $8, $4, $10                 ; index of the second part of the current node
    lis $10                         ; calculate offset
    .word 4
    mult $8, $10                   ; calculate offset
    mflo $8                        
    add $9, $9, $1                  ; get memory address of left node
    lw $4, 0($9)
    ; check if -1

    ; recurse to left
    lis $5          
    .word height                    ; recursive call 
    jalr $5                         ; recursive call
    add $6, $3, $0                  ; store the recursive answer into $6, (temp left register)


    lis $10                         ; constant 1
    .word 1
    add $8, $8, $10                 ; index of the third part of the current node
    lis $10                        ; calculate offset
    .word 4
    mult $4, $9                    ; calculate offset
    mflo $4  
    add $4, $4, $1                  ; get memory address of left node
    lw $4, 0($4)

    ; recurse to the right
    lis $5                              
    .word height                    ; recurse call
    jalr $5                         ; recurse call
    add $7, $3, $0                  ; store recursive answer into &7 (temp right register)
    
    
    sltu $10, $6, $7                 ; branch to appropriate increment
    beq $10, $0, right
    bne $10, $0, left

done:
    lis $3
    .word 0
    beq $0, $0, end

left:
    lis $10
    .word 1
    add $3, $6, $10                 ; update3
    beq $0, $0, end

right:
    lis $10
    .word 1
    add $3, $7, $10
    beq $0, $0, end

end:
    lis $10
    .word 28
    add $30, $30, $10
    lw $4, -4($30)
    lw $5, -8($30)
    lw $6, -12($30)
    lw $7,  -16($30)
    lw $8,  -20($30)
    lw $10,  -24($30)
    lw $31, -28($30)
    jr $31                          

       