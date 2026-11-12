#include <errno.h>
#include <fcntl.h>
#include <stdint.h>
#include <stdio.h>
#include <string.h>
#include <sys/stat.h>
#include <unistd.h>

int main(int argc, char *argv[]) {
  /* FILE *file = fopen("example.txt", "r"); */
  /* int fd = open("example.txt", O_RDONLY | O_CREAT, S_IRWXU | S_IRGRP); */
  /* int fd = open("example.txt", O_RDONLY | O_CREAT, 0740); */
  int fd = open(argv[1], O_WRONLY);
  if (fd == -1) {
    printf("error while opening\n");
    printf("errno: %d\n", errno);
    if (errno == ENOENT) {
      printf("no such file\n");
    }
    /* } else if (errno == 13) */
    perror("open");

    return 30;
  }

  printf("fd: %d\n", fd);

  char msg[] = "hello world\n";
  unsigned int msg_length = strlen(msg) + 1;
  write(STDOUT_FILENO, msg, msg_length);
  int bytes_written = write(fd, msg, msg_length);
  if (bytes_written == -1) {
    // error
    perror("write");
    return 2;
  }

  char input[11];
  int bytes_read = read(0, input, 10);
  input[10] = '\0';
  write(1, "input: ", 7);
  write(1, input, 10);
  write(1, "\n", 1);
  printf("input: %s\n", input);

  /* fclose(file); */
  if (close(fd) == -1) {
    perror("warning: close failed");
  }

  return 0;
}
