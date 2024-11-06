addi a0, a0, 82
add s1, a0, x0

check:
    beq s1, x0, EQ
    blt s1, x0, NO
    addi s1, s1, -9

    j check

EQ:
    addi a1, a1, 0 #done
    j TERMINATE

NO:
    addi a1, a1, 1 #FAIL
    j TERMINATE

TERMINATE:
    end: