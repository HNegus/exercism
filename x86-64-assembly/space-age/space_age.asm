
[default rel]

section .text
global age
age:
    push rbp
    mov rbp, rsp
    ; rdi = int index
    ; rsi = int seconds
    lea rax, [mercury_year]     ; load base array index
    movss xmm1, [rax + rdi*4]   ; load year array value
    mulss xmm1, [earth_seconds] ; multiply by earth seconds
    cvtsi2ss xmm0, qword rsi    ; convert argument into float
    divss xmm0, xmm1            ; seconds / (earth_seconds * planet_year)
    leave
    ret


section .data
earth_seconds:  dd 31557600.0
mercury_year:   dd 0.2408467
venus_year:     dd 0.61519726
earth_year:     dd 1.0
mars_year:      dd 1.8808158
jupiter_year:   dd 11.862615
saturn_year:    dd 29.447498
uranus_year:    dd 84.016846
neptune_year:   dd 164.79132

%ifidn __OUTPUT_FORMAT__,elf64
section .note.GNU-stack noalloc noexec nowrite progbits
%endif
