
#! /bin/bash
cat print_wb.asm | ../../bin/cs241.binasm > print_wb.mips
../../bin/mips.twoints print_wb.mips


