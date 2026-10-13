; Попълнете местата с ??? така, че съобщението да се отпечата точно 7 пъти.

section .data
    message db "Repeat the message 7 times", 10

section .text
    global _start

print:
    mov rbx, ???                ; Инициализираме брояча
cycle:
    mov rax, ???                ; sys_write
    mov rdi, ???                ; file descriptor for stdout
    mov rsi, message            ; адрес на съобщението
    mov rdx, ???                ; дължина на низа (26 символа + 1 за нов ред)
    syscall

    inc rbx                     ; rbx = rbx + 1
    cmp rbx, ???                ; Сравняваме rbx с 7
    ??? cycle                   ; Повтаряме, докато rbx != 7

    ret

_start:
    call print

    ; Изход от програмата (sys_exit)
    mov rax, ???
    mov rdi, 0
    syscall
