
sw $1, -4($30)
sw $2, -8($30)
sw $4, -12($30)
sw $6,  -16($30)
sw $5,  -20($30)
sw $31, -24($30)

main:
    lis $1
    .word 10
    lis $2
    .word 20
    lis $4
    .word 40
    lis $5
    .word 50
    lis $31
    .word 100

   


    jal stirling

 

 