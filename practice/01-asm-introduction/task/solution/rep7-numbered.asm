; rep7-numbered.asm - допълнителните задачи 1 и 3: дължината се смята от
; асемблера, а пред всяко повторение стои номерът му.
;
;   1: Repeat the message 7 times
;   2: Repeat the message 7 times
;   ...
;   7: Repeat the message 7 times

default rel

section .data
    line    db "0: Repeat the message 7 times", 10  ; '0' ще бъде заменена
    len     equ $ - line                            ; 30 байта

section .text
    global _start

print:
    mov rbx, 0                  ; Инициализираме брояча
cycle:
    inc rbx                     ; броим от 1 до 7
    mov rax, rbx
    add rax, '0'                ; число -> ASCII цифра ('0' + 1 == '1')
    mov [line], al              ; първият байт на line става цифрата

    mov rax, 1                  ; sys_write
    mov rdi, 1                  ; stdout
    mov rsi, line               ; адрес на реда
    mov rdx, len                ; дължина на реда
    syscall

    cmp rbx, 7                  ; Сравняваме rbx с 7
    jnz cycle                   ; Повтаряме, докато rbx != 7

    ret

_start:
    call print

    mov rax, 60                 ; sys_exit
    mov rdi, 0
    syscall
