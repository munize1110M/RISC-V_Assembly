addi s0, s0, 0x400 #base address for bubble sort arr
addi s1, s1, 89 #89 #1 num in array
addi s2, s2, 63 #63
addi s3, s3, -55 
addi s4, s4, -107
addi s5, s5, 42
addi s6, s6, 98
addi s7, s7, -425
addi s8, s8, 203
addi s9, s9, 0
addi s10, s10, 303

sw s1, 0(s0)
sw s2, 4(s0)
sw s3, 8(s0)
sw s4, 12(s0)
sw s5, 16(s0)
sw s6, 20(s0)
sw s7, 24(s0)
sw s8, 28(s0)
sw s9, 32(s0)
sw s10, 36(s0)

li s1, 0 #repurpose register s1 to be i (to compare current val)
li s4, 0#repurpose register to add be 0 (this offset val corresponds to i)
li s5, 4#                               (this offset val corresponds to y)
li s3, 8 #repurose register s3 to be 8  (this is the val to compare j to in the inner loop) ex while j < 8 - i
li s7 ,8 #repurpose register s7 to be 8 (this is the val to compare to in the outer loop) ex while i <8
li s6, 0 #repurpose register s6 to be j 

OUTER_LOOP:
	beq s1, s7, DONE
	li s4, 0 #reset mem index vars back to original
    li s5, 4 #^^^
    li s6, 0 #reset j before next iter
    add t5, s1, x0 #store the current val of i in a temp reg
    sub s3, s7, t5
    addi s1, s1, 1 #increment i by one for next iteration
 
    j INNER
INNER:
	add t0, s0, s4
    add t1, s0, s5
    lw t2, 0(t0)
    lw t3, 0(t1)
	bge t2, t3, SORT
    beq s6, s3, OUTER_LOOP
    addi s4, s4, 4
    addi s5, s5, 4
    addi s6, s6, 1
    j INNER
    
SORT:
	sw t3, 0(t0)
    sw t2, 0(t1)
    beq s6, s3, OUTER_LOOP
    addi s4, s4, 4
    addi s5, s5, 4
    addi s6, s6, 1
    j INNER
    
DONE:
	end: