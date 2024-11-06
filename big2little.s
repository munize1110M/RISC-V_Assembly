lui s0, 0xABCDE
addi s0, s0, 0x123
sw s0, 0x300(zero) #load initial memory address that will be used for the test
addi t0, t0, 0x300 #load base address into t0 register

addi s1, s1, 1 #one
addi s2, s2, 2 #two
addi s3, s3, 3 #three


lbu t1, 0(t0) #load first byte from 0x300 into t1 register
lbu t2, 1(t0) #load second byte from 0x300 into t2 register
lbu t3, 2(t0) #load third byte from 0x300 into t3 register
lbu t4, 3(t0) #load fourth byte from 0x300 into t4 register

sw t4, 0x300(zero) #store 4th byte in new 0x304 address lsb
sw t3, 0x300(s1)   #store 3rd byte in new 0x304 address second byte
sw t2, 0x300(s2)   #store 2nd byte in new 0x304 address third byte
sw t1, 0x300(s3)   #store 1st byte in new 0x304 address 4th byte

end: