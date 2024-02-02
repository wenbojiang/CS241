bne $1, $0, division
beq $2, $0, result
beq $0, $0, end
division: 
    divu $2, $1
    mfhi $3
    bne $3, $0, end
result:   
    lis $3
    .word 1
    jr $31
end: 
    add $3, $0, $0
    jr $31
