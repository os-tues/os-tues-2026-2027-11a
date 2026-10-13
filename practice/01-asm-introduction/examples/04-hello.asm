; 04-hello.asm - отпечатване на низ със системното извикване write.
;
; Същото на C (с обвивките от libc):
;
;   write(1, "Hello, world!\n", 14);
;   _exit(14);
;
;   make 04-hello
;   ./04-hello
;   echo $?                     # 14 - колкото байта е записал write
;
; Опит: сменете файловия дескриптор от 1 на 42 (такъв няма). Какво
; отпечатва echo $? и защо?

section .data
    msg     db "Hello, world!", 10  ; 10 е кодът на '\n' в ASCII
    len     equ $ - msg             ; дължината на msg; смята я асемблерът

section .text
    global _start

_start:
    ; write(1, msg, len)
    mov rax, 1                  ; номер на системното извикване write
    mov rdi, 1                  ; 1-ви аргумент: файлов дескриптор 1 (stdout)
    mov rsi, msg                ; 2-ри аргумент: адресът на низа (без [] -
                                ;   искаме адреса, а не байтовете на него)
    mov rdx, len                ; 3-ти аргумент: брой байтове
    syscall                     ; резултатът е в rax

    ; exit(rax)
    mov rdi, rax                ; изходен код - върнатото от write
    mov rax, 60                 ; exit
    syscall
