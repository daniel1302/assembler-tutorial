# How to compile asm programs with nasm?

```
    nasm -f elf64 INPUT_FILE -o OUTPUT_FILE.o;
    ld -o OUTPUT_ELF INPUT_FILE1 INPUT_FILE2 ...;
```

# Registers

![Register](/help/registers.png)

    * rax - temporary register; when we call a syscal, rax must contain syscall number
    * rdi - 1st argument
    * rsi - 2nd argument
    * rdx - 3rd argument
    * rcx - 4th argument
    * r8  - 5th argument
    * r9  - 6th argument
    * rbp - base pointer register. It points to the base of the current frame
    * rps - stack pointer. It points to the top of current stack frame


# Control flow
    * JE - if equal
    * JZ - if zero
    * JNE - if not equal
    * JNZ - if not zero
    * JG - if first operand is greater than second
    * JGE - if first operand is greater or equal to second
    * JA - the same that JG, but performs unsigned comparison
    * JAE - the same that JGE, but performs unsigned comparison
