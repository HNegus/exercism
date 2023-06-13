section .data
; three: dd 3.0e1
three: dq 3

section .text
global age
age:
    push rbp
    mov rax, qword three
    pop rbp
    ret


; four: dq 4.0

; earth_seconds:  dd 31557600
; mercury_year:   dd 0.2408467
; venus_year:     dd 0.61519726
; earth_year:     dd 1.0
; mars_year:      dd 1.8808158
; jupiter_year:   dd 11.862615
; saturn_year:    dd 29.447498
; uranus_year:    dd 84.016846
; neptune_year:   dd 164.79132



%ifidn __OUTPUT_FORMAT__,elf64
section .note.GNU-stack noalloc noexec nowrite progbits
%endif
