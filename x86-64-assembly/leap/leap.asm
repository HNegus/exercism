section .text
global leap_year
leap_year:
    ; Provide your implementation here
    xor edx, edx
    mov eax, edi
    mov r8, 4
    div r8
    cmp rdx, 0
    jne is_not_leap
divisible_by_four:
    xor rdx, rdx
    mov rax, rdi
    mov r8, 100
    div r8
    cmp rdx, 0
    jne is_not_leap
divisible_by_hundred:
    xor rdx, rdx
    mov rax, rdi
    mov r8, 400
    div r8
    cmp rdx, 0
    jne is_not_leap
is_leap:
    mov rax, 1
    jmp exit
is_not_leap:
    mov rax, 0
exit:
    leave
    ret

%ifidn __OUTPUT_FORMAT__,elf64
section .note.GNU-stack noalloc noexec nowrite progbits
%endif
