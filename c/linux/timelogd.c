#include <stdio.h>
#include <stdlib.h> // exit
#include <unistd.h> // sleep fork
#include <time.h>
#include <sys/stat.h> // umask

int main()
{
	// 创建子进程
	pid_t pid;
	if ((pid = fork()) < 0) {
		perror("fork");
		exit(-1);
	}

	// 父进程退出
	if (pid > 0) {
		exit(0);
	}

	setsid();	// 子进程创建新会话，从而脱离终端
	umask(0);	// 权限掩码设为零，即不加限制
	chdir("/tmp");	// 切换工作目录，以免运行时目录被卸载

	// 将从父进程继承的文件关闭
	for (int i = 0; i < getdtablesize(); ++i) {
		close(i);
	}

	FILE *fp;
	if ((fp = fopen("time.log", "a")) == NULL) {
		perror("fopen 'time.log' failed");
		exit(-1);
	}

	time_t t;
	while (1) {
		time(&t);
		fprintf(fp, "%s", ctime(&t));
		fflush(fp);
		sleep(1);
	}
	return 0;
}
