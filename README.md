# How to compile asm programs with nasm?

```
    nasm -f elf64 INPUT_FILE -o OUTPUT_FILE.o;
    ld -o OUTPUT_ELF INPUT_FILE1 INPUT_FILE2 ...;
```

# Registers

![Register](/help/registers.png)

    * rax - temporary register; when we call a syscal, rax must contain syscall number
    * rdx - used to pass 3rd argument to functions
    * rdi - used to pass 1st argument to functions
    * rsi - pointer used to pass 2nd argument to functions


# Control flow
    * JE - if equal
    * JZ - if zero
    * JNE - if not equal
    * JNZ - if not zero
    * JG - if first operand is greater than second
    * JGE - if first operand is greater or equal to second
    * JA - the same that JG, but performs unsigned comparison
    * JAE - the same that JGE, but performs unsigned comparison
