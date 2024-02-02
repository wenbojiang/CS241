
#! /bin/bash
cat kitten.asm | ../../bin/cs241.binasm > kitten.mips
../../bin/mips.stdin kitten.mips < input.txt > output.txt
diff input.txt output.txt
wc -c < input.txt
