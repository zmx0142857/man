// gcc thread.c -o thread -lpthread
#include <pthread.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>

char msg[32] = "hello world";

void *run(void *arg)
{
	sleep(1);
	strcpy(msg, "thank you for waiting!");
	pthread_exit("ok");
}

int main()
{
	pthread_t th;
	// pthread_create(线程对象, 线程属性, 函数, 函数参数)
	if (pthread_create(&th, NULL, run, NULL) != 0) {
		puts("pthread_create failed");
		exit(-1);
	}

	printf("just a moment");
	int n = 3;
	while (n--) {
		putchar('.');
		fflush(stdout);
		usleep(200000);
	}
	putchar('\n');

	void *res;
	pthread_join(th, &res); // 回收线程
	printf("msg: %s\n", msg);
	printf("thread returned %s\n", (char*)res);
	return 0;
}
