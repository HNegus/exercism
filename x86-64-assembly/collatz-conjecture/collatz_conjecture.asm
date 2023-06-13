section .text
global steps
steps:
    push rbp
setup:
    cmp edi, 1
    jl illegal  ; if argument < 1
    ; VARIABLES
    ; steps in ecx
    mov ecx, 0
    ; 2 in esi
    mov esi, 2
    ; 3 in r8d
    mov r8d, 3
    ; number is saved in edi
    ; and in eax for division
    mov eax, edi
check_one:
    cmp eax, 1
    je done     ; done if remaining number == 1
step: ; expect number to be in eax
    inc ecx         ; increment total number of steps
    xor edx, edx    ; clear edx for divide
    div esi         ; divide number by 2
    cmp edx, 0      ; check remainder
    jne is_odd      ; jump if odd
    ; If even continue
    mov edi, eax    ; update saved number
    jmp check_one
is_odd:
    imul edi, r8d   ; multiply saved number by 3
    inc edi         ; and add 1
                    ; use the saved number instead of eax because
                    ; multiplication failed
    mov eax, edi    ; set eax to new number
    jmp check_one
illegal:
    mov ecx, -1     ; set steps to -1 if argument is invalid
done:
    mov eax, ecx    ; return number of steps
    pop rbp
    ; Provide your implementation here
    ret

%ifidn __OUTPUT_FORMAT__,elf64
section .note.GNU-stack noalloc noexec nowrite progbits
%endif
