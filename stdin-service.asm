section .data
    SYSCALL_WRITE   equ 1
    STDOUT          equ 1
    SYSCALL_EXIT    equ 60
    EXIT_CODE       equ 0
    EXIT_FAILURE    equ 1

    NEW_LINE        db 0xa
    WRONG_ARGC_INFO db "[ERROR] Must be two command line argument", 0xa
    WRONG_ARG_TYPE  db "[ERROR] Argument type must be int", 0xa
    CHAR_0          db 0x30
    CHAR_9          db 0x39

section .text
    global _start

_start:
    pop rcx
    cmp rcx, 4
    jne argcError
    
    add rsp, 8
    pop rsi
    call strToInt

    mov r9, EXIT_CODE
    jmp exit

strToInt:
    xor rax, rax
    mov rcx, 10

strToInt_Next:
    cmp [rsi], byte 0
    je strToInt_Return
    
    mov bl, [rsi]
    cmp bl, byte 0
    jl argTypeError
 
    sub bl, 48
    mul rcx
    add rax, rbx
    inc rsi
    jmp strToInt_Next    

strToInt_Return:
    ret



argcError:
    mov rax, SYSCALL_WRITE
    mov rdi, STDOUT
    mov rsi, WRONG_ARGC_INFO
    mov rdx, 43
    
    syscall

    mov r9, EXIT_FAILURE
    jmp exit

argTypeError:
    mov rax, SYSCALL_WRITE
    mov rdi, STDOUT
    mov rsi, WRONG_ARG_TYPE
    mov rdx, 36
    
    syscall

    mov r9, EXIT_FAILURE
    jmp exit


exit:
    mov rax, SYSCALL_EXIT
    mov rdi, r9

    syscall
