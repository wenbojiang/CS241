 

stirling:
sw $1, -4($30)
sw $2, -8($30)
sw $4, -12($30)
sw $6,  -16($30)
sw $5,  -20($30)
sw $31, -24($30)

lis $4
.word 24
sub $30, $30, $4

lis $3
.word 0
beq $1, $0, nzero         ; n == 0 
beq $2, $0, done           ; k == 0
sltu $5, $1, $2 
bne $5, $0, done           ; n < k  
beq $0, $0, calculate  


nzero:
    beq $2, $0, result      ; k == 0 && n == 0, return 1
    beq $0, $0, done

result:
    lis $3
    .word 1
    beq $0, $0, done


calculate:
    ; f(n,k) = (n-1) * f(n-1,k) + f(n-1,k-1)
    lis $4
    .word 1
    sub $1, $1, $4    
    lis $4
    .word stirling
    jalr $4       ; Recursive call f(n-1, k)
    
    multu $3, $1       ; multiply the result by (n-1)
    mflo $6            ; move result to $3
    lis $4
    .word 1
    sub $2, $2, $4     ; Calculate k-1
    lis $4
    .word stirling
    jalr $4            ; Recursive call f(n-1, k-1)
    add $3, $3, $6     ; Add the result to the previous result

 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 

done:
    lis $4
    .word 24
    add $30, $30, $4
    lw $1, -4($30)
    lw $2, -8($30)
    lw $4, -12($30)
    lw $6, -16($30)
    lw $5, -20($30)
    lw $31, -24($30)
    jr $31