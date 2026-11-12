#include <fcntl.h>
#include <stdint.h>
#include <stdio.h>
#include <sys/stat.h>
#include <unistd.h>

int main(int argc, char *argv[]) {
  printf("example text\n");
  printf("proccess_id: %d\n", getpid());
  fclose(stdin);
  fprintf(stderr, "error occured\n");
  fflush(stdout);

  /* struct stat fd0_stat; */
  /* stat("/proc/self/fd/0", &fd0_stat); */
  /* printf("I-node number: %ju\n", (uintmax_t)fd0_stat.st_ino); */
  FILE *file = fopen("example.txt", "r");

  int result = fcntl(0, F_GETFD);
  printf("%d\n", result);

  int input_int = 88;
  scanf("%d", &input_int);
  printf("inputed: %d", input_int);

  fclose(file);
  /* sleep(50); */
  return 0;
}
