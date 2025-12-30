.data
    # Prompts for user input
    msg_A:   .asciiz "Enter value number for  A ($s1): "
    msg_B:   .asciiz "Enter value number for  B ($s2): "
    msg_C:   .asciiz "Enter value number for  C ($s3): "
    msg_res: .asciiz "\nMax ($s0) is: "

.text
    .globl main
main:
    # --- 1. Get Inputs (A, B, C) ---

    # Get A ($s1)
    li      $v0, 4          # print_string
    la      $a0, msg_A      
    syscall                 
    li      $v0, 5          # read_int
    syscall                 
    move    $s1, $v0        # A = input
    
    # Get B ($s2)
    li      $v0, 4          # print_string
    la      $a0, msg_B      
    syscall                 
    li      $v0, 5          # read_int
    syscall                 
    move    $s2, $v0        # B = input

    # Get C ($s3)
    li      $v0, 4          # print_string
    la      $a0, msg_C      
    syscall                 
    li      $v0, 5          # read_int
    syscall                 
    move    $s3, $v0        # C = input

    # ========================================
    # --- 2. Core Logic: Find Max ---
    # ========================================
    
    move    $s0, $s1        # max = A 

    # Check B vs max
    bgt     $s2, $s0, B_is_max  # if (B > max), jump
    
    # Check C vs max
    bgt     $s3, $s0, C_is_max  # if (C > max), jump
    j       DONE

B_is_max:
    move    $s0, $s2        # max = B

    # Check C vs new max (B)
    bgt     $s3, $s0, C_is_max  # if (C > max), jump
    j       DONE

C_is_max:
    move    $s0, $s3        # max = C

DONE:
    # --- 3. Output Result ---
    
    # Print result message
    li      $v0, 4          # print_string
    la      $a0, msg_res
    syscall
    
    # Print max ($s0)
    li      $v0, 1          # print_int
    move    $a0, $s0        # load max value
    syscall                 

    # --- 4. Exit Program ---
    li      $v0, 10         # exit
    syscall
