#include <stdio.h>
#include <termios.h>

int main()
{
	struct termios config;
	tcgetattr(0, &config);
	config.c_lflag &= ~ICANON;	// 禁用 I/O 缓冲
	config.c_lflag |= ~ECHO;	// 无回显
	tcsetattr(0, TCSANOW, &config);
	int c = getchar(); // try it!
	putchar(c);
	return 0;
}
