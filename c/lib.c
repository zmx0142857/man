/* gcc arguments
 *
 *	-Wall				open all warnings
 *	-Dxxx=???			define a macro named xxx, valued ???
 *	-fexec-charset=gbk	to compile chinese characters under windoze,
 *						however the best solution is to save file encoding
 *						to utf-8 and run chcp 65001 to set codepage to utf-8
 *						before running gcc
 */

#include <stdio.h>

	FILE *fopen(const char *filename, const char *mode);

	/* mode
	 *
	 *	"r"				read only, file must exist.
	 *	"w"				clear the file to write,
	 *					new file is created if not exist.
	 *	"a"				append: write to the end of a file,
	 *					new file is created if not exist.
	 */

	// example
	FILE *file = fopen("myfile.txt", "w");
	if (file) {
		fputs("hello world", file);
		fclose(file);
	}


	// repeater
	// fgets takes any char until a \n is entered, then a \0 is appended.
	// if size-1 chars (here 999) is entered, then a \0 is appended.
	char buf[1000];
	while (fgets(buf, 1000, stdin)) {
		printf("%s", buf);
	}

	// how fgets ignore input
	char buf[64];
	fgets(buf, 4, stdin);
	puts(buf);
	// discard until end of line
	while (buf[strlen(buf)-1] != '\n')
		fgets(buf, 64, stdin);
	fgets(buf, 4, stdin);
	puts(buf);

	// scanf supports "regex"
	// at most 19 chars, take digits, a-zA-Z and spaces only
	scanf("%19[0-9a-zA-Z ]", buf);
	puts(buf);

#include <string.h>

	void *memcpy(dest, src, size);
	void memset(ptr, value, size);
	strlen

	char *strcpy(char *dest, const char *src)
	{
		while (*src)
			*dest = *src++;
		return dest;
	}

	strcmp
	strstr
	strtok

#include <stdlib.h>

	void *malloc(size);
	void free(ptr);

//	int *arr = malloc(sizeof(int)*n);
//	free(arr);

	int atoi(str);

	void qsort(void *arr, size_t cnt, size_t elem_size,
			int (*compare)(const void *, const void *));
		
	void *bsearch(const void *key,
			const void *arr, size_t cnt, size_t elem_size,
			int (*compare)(const void *, const void *));

//	int compare(const void *a, const void *b) {
//		return ( *(int*)a - *(int*) b );
//	}
//	
//	int arr[] = {40, 10, 100, 90, 20, 25};
//	qsort(arr, 6, sizeof(int), compare);
//
//	int *p = (int*)bsearch(20, arr, 6, sizeof(int), compare);
//	if (!p) {
//		printf("%d is not found\n", 20);
//	}

//	#include <string.h>
//	char strs[][20] = {"some", "example", "strings", "here"};
//	qsort(strs, 4, 20, (int(*)(const void *, const void *)) strcmp);

	void srand(unsigned);	// initialize random seed
	int rand();				// pseudo-random int between 0 and RAND_MAX

//	#include <time.h>
//	srand(time(NULL));
//	printf("%d\n", rand() % 100);

#include <ctype.h>

#include <stdint.h>

int32_t, uint32_t

#include <limits.h>

INT_MAX, INT_MIN, UINT_MAX

#include <time.h>

//	#define timer()		printf("Time elapsed: %lf\n", (double)clock() / CLOCKS_PER_SEC)

#include <locale.h>

//	setlocale (LC_ALL,"");	// use system locale

#include <stdbool.h>

bool, true, false
