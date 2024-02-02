#! /bin/bash
cat stirling_wb.asm | ../../bin/cs241.binasm > stirling_wb.mips
../../bin/mips.twoints stirling_wb.mips
