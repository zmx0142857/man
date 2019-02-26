/*
 * gcc arguments
 *
 *	-Wall				open all warnings
 *	-fexec-charset=gbk	to compile chinese characters under windoze
 *	-Dxxx=???			define a macro named xxx, valued ???
 */

#include <stdio.h>

FILE *fopen(const char *filename, const char *mode);

	// mode
	//	"r"				read only, file must exist
	//	"w"				clear the file and ready to write,
	//					new file is created if not exist.
	//	"a"				append: write to the end of a file,
	//					new file is created if not exist.

	// example
	FILE *file = fopen("myfile.txt", "w");
	if (file) {
		fputs("hello world", file);
		fclose(file);
	}

#include <string.h>

void *memcpy(dest, src, size);
void memset(ptr, value, size);

#include <stdlib.h>

void *malloc(size);

	// example
	int *arr = (int*)malloc(sizeof(int)*n);

void free(ptr);
int atoi(str);

#include <ctype.h>
