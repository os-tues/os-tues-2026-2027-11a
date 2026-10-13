; 06-call-ret.asm - подпрограма, извикана два пъти с call и ret.
;
; call запомня адреса на следващата инструкция в стека и прескача до
; етикета. ret взима този адрес от стека и продължава оттам.
;
;   make 06-call-ret
;   ./06-call-ret
;
; Въпрос: print е над _start във файла. Защо програмата не започва от нея?
; (readelf -h 06-call-ret | grep Entry и nm 06-call-ret)

section .data
    first       db "first", 10
    first_len   equ $ - first
    second      db "second", 10
    second_len  equ $ - second

section .text
    global _start

; print - отпечатва низ на stdout.
;   rsi - адресът на низа
;   rdx - дължината му
print:
    mov rax, 1                  ; write
    mov rdi, 1                  ; stdout
    syscall
    ret                         ; връщаме се след съответния call

_start:
    mov rsi, first
    mov rdx, first_len
    call print

    mov rsi, second
    mov rdx, second_len
    call print

    mov rax, 60                 ; exit
    mov rdi, 0
    syscall
