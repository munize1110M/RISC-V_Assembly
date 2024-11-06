main:
    addi a0, a0, 64 #initialize first num into a0 reg
    addi a1, a1, 96 #initialize second num into a1 reg
    
    jal ra, stack
    #other code on return
    

reorder:
    add t0, a0, x0 #temp save a0 in t0 #This code reorders reg a0 and a1 because code
    add a0, a1, x0 #save a1 into a0    #assumes that a0 is larger
    add a1, t0, x0 #save t0 (original a0) into a1
    j stack

stack:
    blt a0, a1, reorder
    addi sp, sp, -20 #make room on the stack
    sw ra, 0(sp)	#store return address on stack
    sw a0, 4(sp)	#store original a0 val on stack
    sw a1, 8(sp)	#store original a1 val on stack
	
loop:
    blt a0, a1, store #branch to store if t0 is less than B
    beq a1, x0, DONE  #if B is equal to 0, jump to DONE Label
    sub a0, a0, a1    #store in a0, decrememnt A val by B val
    j loop
    
    
store:
    sw a0, 12(sp)	#make previous B new A and make remainder new B
    sw a1, 16(sp)	
    lw a0, 16(sp)	
    lw a1, 12(sp)
    j loop
    
    
DONE:
    add s0, a0, x0 #load GCD into s0
    lw ra, 0(sp) #load original ra from stack
    lw a0, 4(sp) #load original a0 value from stack
    lw a1, 8(sp) #load original a1 value from stack
    addi sp, sp, 20 #clear stack
    jr ra
    