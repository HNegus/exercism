section .text
global rotate
rotate:
    ; r10 = const char *text
    ; esi = int shift_key
    ; r11 = char *buffer
    ; ebx = char letter
    ; edi = offset
    ; ecx = 26 // number of letters
    push rbx
    mov r10, rdi
    mov r11, rdx ; move buffer to r11
    mov ecx, 26
check_char:
    movzx ebx, byte [r10] ; get current character
    cmp ebx, 'A'          ; char to limits and jump accor10ngly
    jl copy_char
    cmp ebx, 'Z'
    jle capital_letter
    cmp ebx, 'a'
    jl copy_char
    cmp ebx, 'z'
    jg copy_char
non_capital_letter:
    mov edi, 'a'     ; offset = 'a'
    jmp shift
capital_letter:
    mov edi, 'A'     ; offset = 'A'
shift:
    sub ebx, edi      ; remove offset
    add ebx, esi     ; add shift
    xor edx, edx    ; zero out for division
    mov eax, ebx
    div ecx          ; divide char by 26
    mov ebx, edx      ; set char to remainder
    add ebx, edi
copy_char:
    mov byte [r11], bl ; copy encrypted letter to buffer
increment_buffers:
    inc r10             ; move to next character
    inc r11
    cmp byte [r10], 0   ; check if at end of string
    jne check_char
done:
    mov byte  [r11], 0
    pop rbx
    ret

section .bss

%ifidn __OUTPUT_FORMAT__,elf64
section .note.GNU-stack noalloc noexec nowrite progbits
%endif
