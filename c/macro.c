#include <stdio.h>

#define max(a, b)	((a) > (b) ? (a) : (b))
#define join(x, y)	x##y
#define toStr(x)	#x
#define ok()		puts("I'm ok");\
	puts("thanx")
#define skip_space(p, limit)	\
     do { char *lim = (limit);	\
          while (p < lim) {		\
            if (*p++ != ' ') {	\
              p--; break; }}}	\
     while (0)
#define myprintf(templt, ...) fprintf(stderr, templt, __VA_ARGS__)
#define myprintf2(templt, args...) fprintf(stderr, templt, args)
#define class(type, method, args...) type##_##method(type *this, args)

typedef struct {
	int id;
	char name[20];
} Foo;

//void Foo_init(Foo *this, int id, char *name)
void class(Foo, init, int id, char *name)
{
	this->id = id;
	char *p = this->name;
	while (*name)
		*p++ = *name++;
	*p = '\0';
}

int main()
{
	printf("%d\n", max(1, 2));
	printf("%f\n", max(1.5, -2.0));
	printf("%d\n", join(123, 456));
	puts(toStr(I am a string));
	ok();

	Foo foo;
	Foo_init(&foo, 10, "xiaoming");
	printf("%d %s\n", foo.id, foo.name);
	return 0;
}
