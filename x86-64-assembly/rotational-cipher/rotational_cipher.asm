section .text
global rotate
rotate:
    ; rdi = const char *text
    ; rsi = int shift_key
    ; rcx = char *buffer
    ; r8 = char letter
    ; r9 = offset
    ; r10 = 26 // number of letters
    mov rcx, rdx ; move buffer to rcx
    mov r10, 26
check_char:
    movzx r8, byte [rdi] ; get current character
    cmp r8, 'A'          ; char to limits and jump accordingly
    jl copy_char
    cmp r8, 'Z'
    jle capital_letter
    cmp r8, 'a'
    jl copy_char
    cmp r8, 'z'
    jg copy_char
non_capital_letter:
    mov r9, 'a'     ; offset = 'a'
    jmp shift
capital_letter:
    mov r9, 'A'     ; offset = 'A'
shift:
    sub r8, r9      ; remove offset
    add r8, rsi     ; add shift
    xor rdx, rdx    ; zero out for division
    mov rax, r8
    div r10          ; divide char by 26
    mov r8, rdx      ; set char to remainder
    add r8, r9
copy_char:
    mov byte [rcx], r8b ; copy encrypted letter to buffer
increment_buffers:
    inc rdi             ; move to next character
    inc rcx
    cmp byte [rdi], 0   ; check if at end of string
    jne check_char
done:
    mov byte  [rcx], 0
    ret

section .bss

%ifidn __OUTPUT_FORMAT__,elf64
section .note.GNU-stack noalloc noexec nowrite progbits
%endif
