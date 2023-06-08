default rel

section .rodata
msg: db "Goodbye, Mars!", 0

section .text
global hello
hello:
    push rbp
    mov rax, 1
    mov rdi, 1
    mov rsi, [msg]
    mov rdx, 14
    syscall
    ; mov rsp, rbp
    ; pop rbp
    ; pop rbp
    leave
    ret

%ifidn __OUTPUT_FORMAT__,elf64
section .note.GNU-stack noalloc noexec nowrite progbits
%endif
