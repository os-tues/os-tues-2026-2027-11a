; 03-registers.asm - части на регистрите и редът на байтовете в паметта.
;
;   rax - всичките 64 бита
;   eax - младшите 32 бита
;   ax  - младшите 16 бита
;   ah  - битове 8-15,  al - младшите 8 бита
;
; Програмата не отпечатва нищо - разгледайте я в gdb:
;
;   make 03-registers
;   gdb -q ./03-registers
;   (gdb) break _start
;   (gdb) run
;   (gdb) stepi                 # изпълнява една инструкция
;   (gdb) p/x $rax              # rax в шестнайсетична бройна система
;   (gdb) x/8xb &value          # 8-те байта на value, един по един

default rel                     ; адресите в [] се смятат спрямо rip

section .data
    value   dq 0x1122334455667788

section .text
    global _start

_start:
    mov rax, [value]            ; rax = 0x1122334455667788
    mov al, 0xff                ; rax = 0x11223344556677ff
    mov ah, 0xee                ; rax = 0x112233445566eeff
    mov ax, 0x1234              ; rax = 0x1122334455661234
    mov eax, 0xaabbccdd         ; rax = 0x00000000aabbccdd - записът в eax
                                ;   нулира и горните 32 бита!

    ; Изходният код е само 8 бита - остава младшият байт на rdi.
    mov rdi, 298                ; 298 = 256 + 42
    mov rax, 60                 ; exit
    syscall                     ; echo $? -> 42, защото 298 mod 256 = 42
