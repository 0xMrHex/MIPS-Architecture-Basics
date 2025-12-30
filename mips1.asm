.data 

prompt1: .asciiz "\nEnter x "
prompt2: .asciiz "\nEnter y "
varX: .asciiz "\nX : "
varY: .asciiz "\nY : "
finalR: .asciiz "\nFinal result "

.text


main: 
#___________________________(X)
li $v0, 4 	#print String 
la $a0, prompt1 #choose Enter X  	
syscall 

li $v0, 4 	#print String 
la $a0, varX	#choose X : 
syscall 

li $v0, 5 	#read Int 
syscall 

move $t0, $v0 	#move x to $t0(R8)

#___________________________(Y)
li $v0, 4 	#print String 
la $a0, prompt2 #choose Enter Y 	
syscall 

li $v0, 4 	#print String 
la $a0, varY	#choose Y : 
syscall 

li $v0, 5 	#read Int 
syscall 

move $t1, $v0 	#move Y to $t1(R9)

li $t3, 1 	#move 1 to $t2(R10)

beq $t0, $t3, ELSE 	#if(X == 1) false will move to else
add $t1, $t0, $t0 	#Y = X + X 
li $t0, 0 	#X = 0 
li $v0, 4 	#print String 
la $a0, finalR	#choose Final massege 
syscall 

li $v0, 4	#print string
la $a0, varY	#choose Y:
syscall
move $a0, $t1 	#move Y to console
li $v0, 1	# print console 
syscall

li $v0, 4	#print string
la $a0, varX	#choose Y:
syscall
move $a0, $t0 	#move Y to console
li $v0, 1	# print console 
syscall 
j Exit
 
 
ELSE:add $t1, $t1, $t3	#Y++ 
li $v0, 4	#print string
la $a0, finalR	#choose Y:
syscall 
li $v0, 4	#print string
la $a0, varY	#choose Y:
syscall
move $a0, $t1 	#move Y to console
li $v0, 1	# print console 
syscall

li $v0, 4 
la $a0, varX 
syscall 
move $a0, $t0
li $v0, 1
syscall 

Exit:li $v0, 10	#Exit the program 
syscall

