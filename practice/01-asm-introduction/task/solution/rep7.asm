section .data
    message db "Repeat the message 7 times", 10

section .text
    global _start

print:
    mov rbx, 0                  ; Инициализираме брояча
cycle:
    mov rax, 1                  ; sys_write
    mov rdi, 1                  ; file descriptor for stdout
    mov rsi, message            ; адрес на съобщението
    mov rdx, 27                 ; дължина на низа (26 символа + 1 за нов ред)
    syscall

    inc rbx                     ; rbx = rbx + 1
    cmp rbx, 7                  ; Сравняваме rbx с 7
    jnz cycle                   ; Повтаряме, докато rbx != 7

    ret

_start:
    call print

    ; Изход от програмата (sys_exit)
    mov rax, 60
    mov rdi, 0
    syscall
