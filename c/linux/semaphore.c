// gcc semaphore.c -o semaphore -lpthread
// 生产者, 消费者问题
#include <semaphore.h>
#include <pthread.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>

#define SIZE 256
char buf[SIZE];
sem_t sem_r, sem_w;

void *reader(void *arg)
{
	while (1) {
		sem_wait(&sem_r); // P 操作
		printf("read %ld characters\n", strlen(buf));
		sem_post(&sem_w); // V 操作
	}
}

void writer()
{
	char *res;
	puts("type 'exit' to exit");
	do {
		sem_wait(&sem_w); // P 操作
		res = fgets(buf, SIZE, stdin); // return NULL if met EOF
		sem_post(&sem_r); // V 操作
	} while (res && strncmp(buf, "exit", 4) != 0);
}

int main()
{
	// sem_init(信号量, 方式(线程间=0, 进程间=1), 初始值)
	if (sem_init(&sem_r, 0, 0) < 0) {
		perror("sem_init(sem_r)");
		exit(-1);
	}
	if (sem_init(&sem_w, 0, 1) < 0) {
		perror("sem_init(sem_w)");
		exit(-1);
	}

	// 为避免线程访问未初始化的信号量,
	// 应先初始化信号量, 再创建线程.
	pthread_t th;
	if (pthread_create(&th, NULL, reader, NULL) != 0) {
		printf("pthread_create failed");
		exit(-1);
	}
	writer();
	return 0;
}
