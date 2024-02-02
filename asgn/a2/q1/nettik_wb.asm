lis $20
.word 0xffff000c        ; output address
lis $21
.word 0xffff0004        ; input address

lis $1
.word -1                ; end of input
lis $5                  ; increment count
.word 1
lis $6                  ; depth of stack
.word 0
lis $7                  ; increment for stack pointer
.word 4
lis $3                  ; store # of bytes from input
.word 0


start:  
    lw  $4, 0($21)          ; read byte from input
    beq $4, $1, result
    add $3, $3, $5
    sub $30, $30, $7        ; decrease stack pointer
    sw  $4, 0($30)           ; store byte on stack
    beq $0, $0, start

result: 
        add $6, $3, $0
loop:   
        lw $4, 0($30)           ; load byte from stack
        sw $4, 0($20)           ; write byte to output
        add $30, $30, $7       ; increase stack pointer
        sub $6, $6, $5
        bne $6, $0, loop
end:   
    ; todo to preserve register value 
    jr $31 ; end of program
