
#! /bin/bash
cat decimal.asm | ../../bin/cs241.binasm > decimal.mips
../../bin/mips.stdin decimal.mips <<< "-111" > decimal.out
../../bin/cs241.binview decimal.out


