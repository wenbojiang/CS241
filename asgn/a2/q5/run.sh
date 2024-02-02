#! /bin/bash
cat height_wb.asm | ../../bin/cs241.binasm > height_wb.mips
../../bin/mips.array height_wb.mips
