data
promptN: .asciiz "Enter how many numbers you will input:"
promptNum: .asciiz "Enter a number:"
countEven: .asciiz "Count of EVEN numbers:"
sumOdd: .asciiz "Sum of ODD numbers:"
newLine: .asciiz "\n"

.text

.globl main
main:
li $t0, 0
li $t2, 0
li $t3, 0

li $v0, 4
la $a0, promptN
syscall
    
li $v0, 5
syscall
move $t1, $v0
    
loop_start:
beq $t0, $t1, print_results

li $v0, 4
la $a0, promptNum
syscall

li $v0, 5
syscall
move $t4, $v0

andi $t5, $t4, 1
beq $t5, $zero, is_even

is_odd:
add $t3, $t3, $t4
j loop_continue

is_even:
addi $t2, $t2, 1

loop_continue:
addi $t0, $t0, 1
j loop_start

print_results:
li $v0, 4
la $a0, countEven
syscall

li $v0, 1
move $a0, $t2
syscall

li $v0, 4
la $a0, newLine
syscall

li $v0, 4
la $a0, sumOdd
syscall

li $v0, 1
move $a0, $t3
syscall

li $v0, 10
syscall
