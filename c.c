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

#include <string.h>

void *memcpy(dest, src, size);
void memset(ptr, value, size);

#include <stdlib.h>

void *malloc(size);
void free(ptr);

	// example
	int *arr = (int*)malloc(sizeof(int)*n);
	free(arr);

int atoi(str);

void qsort(void *arr, size_t cnt, size_t elem_size,
		int (*compare)(const void *, const void *));
	
void *bsearch(const void *key,
		const void *arr, size_t cnt, size_t elem_size,
		int (*compare)(const void *, const void *));

	// example 1
	int compare(const void *a, const void *b) {
		return ( *(int*)a - *(int*) b );
	}
	
	int arr[] = {40, 10, 100, 90, 20, 25};
	qsort(arr, 6, sizeof(int), compare);

	int *p = (int*)bsearch(20, arr, 6, sizeof(int), compare);
	if (!p) {
		printf("%d is not found\n", 20);
	}

	// example 2 (require string.h)
	char strs[][20] = {"some", "example", "strings", "here"};
	qsort(strs, 4, 20, (int(*)(const void *, const void *)) strcmp);

void srand(unsigned);	// initialize random seed
int rand();				// return pseudo-random int between 0 and RAND_MAX

	// example
	srand(time(NULL));	// require time.h
	printf("%d\n", rand() % 100);

#include <ctype.h>

#include <stdint.h>

int32_t, uint32_t

#include <limits.h>

INT_MAX, INT_MIN, UINT_MAX
