/*
 * gcc arguments
 *
 *	-Wall				open all warnings
 *	-fexec-charset=gbk	to compile chinese characters under windoze
 *	-Dxxx=???			define a macro named xxx, valued ???
 */

#include <string.h>

void *memcpy(dest, src, size);
void memset(ptr, value, size);

#include <stdlib.h>

void *malloc(size);

	int *arr = (int*)malloc(sizeof(int)*n);

void free(ptr);
int atoi(str);
