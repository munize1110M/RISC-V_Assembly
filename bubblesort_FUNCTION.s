main:
    addi s0, s0, 0x400 #base address for bubble sort arr
    addi a0, a0, -15 #store array values in memory
    addi a1, a1, 42
    addi a2, a2, 73
    addi s1, s1, 19 
    addi s2, s2, -8 
    addi s3, s3, 24 
    addi s4, s4, 16
    addi s5, s5, -2
    addi s6, s6, 99
    addi s7, s7, -78
    addi s8, s8, -21
    addi s9, s9, 23
    addi s10, s10, -88
    addi s11, s11, 49
    addi a3, a3, -101
    sw a0, 0(s0)
    sw a1, 4(s0)
    sw a2, 8(s0)
    sw a3, 12(s0)
    sw s1, 16(s0)
    sw s2, 20(s0)
    sw s3, 24(s0)
    sw s4, 28(s0)
    sw s5, 32(s0)
    sw s6, 36(s0)
    sw s7, 40(s0)
    sw s8, 44(s0)
    sw s9, 48(s0)
    sw s10, 52(s0)
    sw s11, 56(s0)
    jal ra, stack        #jump and link to stack Label
    j TERMINATE		#jump to CRASH state (for testing purposes)
    

stack:
    addi sp, sp, -36 #make room on stack
    sw ra, 4(sp) #store return address in stack
    sw s1, 8(sp) #store s1 in stack
    sw s3, 12(sp) #store s3 in stack
    sw s4, 16(sp) #store s4 in stack
    sw s5, 20(sp) #store s5 in stack
    sw s6, 24(sp) #store s6 in stack
    sw s7, 28(sp) #store s7 in stack
    
    li s1, 0 #repurpose register s1 to be i (to compare current val)
    li s4, 0#repurpose register to add be 0 (this offset val corresponds to i)
    li s5, 4#                               (this offset val corresponds to y)
    li s3,13 #repurose register s3 to be 8  (this is the val to compare j to in the inner loop) ex while j < 8 - i
    li s7 13 #repurpose register s7 to be 8 (this is the val to compare to in the outer loop) ex while i <8
    li s6, 0 #repurpose register s6 to be j 

OUTER_LOOP:
    beq s1, s7, DONE #check if i == 8
    li s4, 0 #reset mem index vars back to original
    li s5, 4 #^^^
    li s6, 0 #reset j before next iter
    add t5, s1, x0 #store the current val of i in a temp reg
    sub s3, s7, t5 #new value of j = 8 - i
    addi s1, s1, 1 #increment i by one for next iteration
 
    j INNER
INNER:
    add t0, s0, s4 #lower mem offset into t0 reg
    add t1, s0, s5 #upper mem offset into t1 reg
    lw t2, 0(t0) #load from lower mem offset into t2 reg
    lw t3, 0(t1) #load from upper mem offset into t3 reg
    bge t2, t3, SORT #go to sort if t2 is greater than or equal to t3
    beq s6, s3, OUTER_LOOP # check if j is equal to zero (inner loop complete) and jump to outer if true
    addi s4, s4, 4 #increment lower mem offset by 4
    addi s5, s5, 4 #increment upper mem offset by 4
    addi s6, s6, 1 #increment j by 1
    j INNER
    
SORT:
    sw t3, 0(t0) #swap places
    sw t2, 0(t1)
    beq s6, s3, OUTER_LOOP #house keeping in bc you took the sort branch
    addi s4, s4, 4 
    addi s5, s5, 4
    addi s6, s6, 1
    j INNER
    
DONE:
	#lw ra, 4(sp)
    lw s1, 8(sp) #restore s1 from stack
    lw s3, 12(sp) #restore s3 from stack
    lw s4, 16(sp) #restore s4 from stack
    lw s5, 20(sp) #restore s5 from stack
    lw s6, 24(sp) #restore s6 from stack
    lw s7, 28(sp) #restore s7 from stack
    jr ra
TERMINATE:
	end:
    