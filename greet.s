main:
    addi a0, a0, 15
    jal ra, greet
    j TERMINATE
    
greet:
 addi a0, a0, -1 # n = n−1
 addi sp, sp, -8 # make room for a0, ra
 sw a0, 4(sp)
 sw ra, 0(sp)
 addi t0, zero, 1 # temporary = 1
 bgt a0, t0, else # if n>1, go to else
 addi a0, zero, 1 # otherwise, return 1
 addi sp, sp, 8 # restore sp
 jr ra # return
INI:
	
else:
 jal greet # recursive call: greet(n-1)
 lw t1, 4(sp) # restore n into t1
 lw ra, 0(sp) # restore ra
 addi sp, sp, 8 # restore sp
 add a0, t1, a0 # a0 = n*greet(n−1)
 jr ra # return
 
TERMINATE:
	end: #crash end for testing purposes