# Допълнителна задача 2: Makefile за задачата.
#
#   make         - изгражда ./rep7 и ./rep7-numbered
#   make clean   - изтрива генерираните файлове

.PHONY: all clean

all: rep7 rep7-numbered

rep7: rep7.o
	ld rep7.o -o rep7

rep7.o: rep7.asm
	nasm -f elf64 rep7.asm -o rep7.o

rep7-numbered: rep7-numbered.o
	ld rep7-numbered.o -o rep7-numbered

rep7-numbered.o: rep7-numbered.asm
	nasm -f elf64 rep7-numbered.asm -o rep7-numbered.o

clean:
	rm -f rep7 rep7.o rep7-numbered rep7-numbered.o
