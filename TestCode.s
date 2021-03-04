.text
Label:
	lui t0, 0x12345
	addi t0,t0, 0x678
	addi t0,t0,1
	add	 t1,x0,t0
    addi t1,t0,-1
	lui  t2,0x80000
	srai t3,t2,1
    srai t4,t2,17
	srli t5,t2,4
	jal  x1,Rutina
	addi t1,t0,0x123
	beq  x0,x0,Label


Rutina:
	addi t0,t0, -1
	addi t1,x0,3
	sw	 t0,-2(t1)
	addi t1,x0,4
	lw	 t4, -3(t1)
	jalr x1,x1,0

