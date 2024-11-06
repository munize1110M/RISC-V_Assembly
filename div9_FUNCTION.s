main:
    addi a0, a0, 81		#Main code that simulates a function call to store_is_div
    jal ra, store_is_div	
    add s0, a0, x0
    #%some other code in main

store_is_div:
    addi sp, sp, -12	#make room on stack
    sw ra, 4(sp)	#store return address on stack
    sw a0, 8(sp)	#store original value on stack to comply with RISC-V standards (a register)
loop:
    beq a0, x0, EQ	#if a0 is equal x0, branch to the EQ label
    blt a0, x0, NO	#if a0 is less than x0, branch to the NO Label
    addi a0, a0, -9	#decrement a0 by 9
    j loop		#jump back to beg of loop

EQ:
    li a0, 0 #done	#set return 0 in a0 to indicate that val is divisible by 9
    j end	 	#jump to end

NO:
    li a0, 1 		#FAIL set return 1 in a1 to indicate that val is NOT divisible by 9
    j end		#jump to end

end:
    lw ra, 4(sp) 	#not technically needed in this program since there were no other function calls within the store_is_div.
    addi sp, sp, 12	#restore stack
    jr ra 		#jump back to caller
