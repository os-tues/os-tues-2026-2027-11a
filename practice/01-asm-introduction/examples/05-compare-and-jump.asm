; 05-compare-and-jump.asm - сравнение, флагове и условен преход (if/else).
;
; Същото на C:
;
;   if (a == b)
;       write(1, "equal\n", 6);
;   else
;       write(1, "not equal\n", 10);
;
;   make 05-compare-and-jump
;   ./05-compare-and-jump
;
; Опит: сменете стойността на rbx. След това заменете je с jne.
; В gdb след cmp вижте флаговете с p $eflags - търсете ZF.

section .data
    eq_msg  db "equal", 10
    eq_len  equ $ - eq_msg
    ne_msg  db "not equal", 10
    ne_len  equ $ - ne_msg

section .text
    global _start

_start:
    mov rax, 5
    mov rbx, 5
    cmp rax, rbx                ; смята rax - rbx, пази само флаговете:
                                ;   ZF = 1, ако разликата е 0
    je equal                    ; jump if equal - преход, ако ZF = 1

    mov rsi, ne_msg             ; тук сме, ако rax != rbx
    mov rdx, ne_len
    jmp print                   ; безусловен преход - прескачаме „else“

equal:
    mov rsi, eq_msg
    mov rdx, eq_len

print:
    mov rax, 1                  ; write
    mov rdi, 1                  ; stdout
    syscall

    mov rax, 60                 ; exit
    mov rdi, 0
    syscall
