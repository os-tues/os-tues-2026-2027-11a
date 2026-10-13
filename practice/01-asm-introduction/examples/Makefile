# Асемблира и свързва всеки .asm файл в тази директория в изпълним файл със
# същото име:
#
#   make                - всички примери
#   make 04-hello       - само един от тях
#   make clean          - изтрива генерираните файлове
#
# -g -F dwarf добавя информация за gdb - номера на редове и имена.

ASM     := nasm
ASFLAGS := -f elf64 -g -F dwarf
LD      := ld

SRCS := $(wildcard *.asm)
OBJS := $(SRCS:.asm=.o)
BINS := $(SRCS:.asm=)

.PHONY: all clean

# Обектните файлове са изброени изрично, за да не ги изтрие make след
# свързването - ще ги разглеждаме с objdump.
all: $(BINS) $(OBJS)

# Свързване: обектен файл -> изпълним файл.
%: %.o
	$(LD) $< -o $@

# Асемблиране: .asm -> обектен файл.
%.o: %.asm
	$(ASM) $(ASFLAGS) $< -o $@

clean:
	rm -f $(BINS) $(OBJS)
