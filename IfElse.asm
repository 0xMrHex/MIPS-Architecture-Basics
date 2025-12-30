.data
    # Prompts for user input
    msg_g:   .asciiz "Enter value number for g ($s1): "
    msg_h:   .asciiz "Enter value number for h ($s2): "
    msg_i:   .asciiz "Enter value number for i ($s3): "
    msg_j:   .asciiz "Enter value number for j ($s4): "
    msg_res: .asciiz "\nFinal f ($s0) is: "

.text
    .globl main
main:
    # --- Setup ---
    li      $s0, 0          # f = 0

    # --- Input g, h, i, j ---
    
    # Get g ($s1)
    li      $v0, 4          # print_string
    la      $a0, msg_g      
    syscall                 
    li      $v0, 5          # read_int
    syscall                 
    move    $s1, $v0        # $s1 = g
    
    # Get h ($s2)
    li      $v0, 4          # print_string
    la      $a0, msg_h      
    syscall                 
    li      $v0, 5          # read_int
    syscall                 
    move    $s2, $v0        # $s2 = h

    # Get i ($s3)
    li      $v0, 4          # print_string
    la      $a0, msg_i      
    syscall                 
    li      $v0, 5          # read_int
    syscall                 
    move    $s3, $v0        # $s3 = i

    # Get j ($s4)
    li      $v0, 4          # print_string
    la      $a0, msg_j      
    syscall                 
    li      $v0, 5          # read_int
    syscall                 
    move    $s4, $v0        # $s4 = j

    # ========================================
    # --- Core Logic: if (i == j) f = g + h; f = f - i; ---
    # ========================================
    
    # if (i != j) goto L1
    bne     $s3, $s4, L1    # Skip 'if' body if i != j

    # f = g + h
    add     $s0, $s1, $s2   # f = g + h (Executed only if i == j)

L1:
    # f = f - i
    sub     $s0, $s0, $s3   # f = f - i (Executed always)

    # --- Output Result ---
    
    # Print "Final f ($s0) is: "
    li      $v0, 4          # print_string
    la      $a0, msg_res
    syscall
    
    # Print final f ($s0)
    li      $v0, 1          # print_int
    move    $a0, $s0        # load result f
    syscall                 

    # --- Exit Program ---
    li      $v0, 10         # exit
    syscall
