#include <stdio.h>
#include <unistd.h>

int main()
{
	pid_t pid;
	if ((pid = fork()) < 0) {
		perror("fork");
		return -1;
	} else if (pid == 0) {
		printf("child process: my pid is %d\n", getpid());
	} else {
		printf("parent process: my pid is %d\n", getpid());
	}
	return 0;
}
