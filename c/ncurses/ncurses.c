/* ubuntu:
 *	$ sudo apt install libncurses5-dev
 *	$ gcc ncurses.c -o ncurses -lncurses
 *
 * windows:
 *	download `PDCurses`, for example `pdc34dllw.zip`
 *	unzip to get:
 *		curses.h
 *		panel.h
 *		pdcurses.dll
 *		pdcurses.lib
 *	move .h files to MinGW\include\
 *	move pdcurses.lib to MinGW\lib\
 *	move pdcurses.dll to the same directory of your object file
 *	(recommended) or to C:\Windows\SysWOW64\ (not recommended)
 * $ gcc ncurses.c -o ncurses -lpdcurses
 */

/* initscr()				init ncurses data structure, read terminfo file
 *							and allocate memeory. screen will be cleared.
 * endwin()					clear resources of ncurses.
 * noecho()					no echo of key pressed.
 * curs_set(FALSE)			don't show cursor
 * move(y, x)				move cursor to (y,x)
 * printw(str)				print str
 * mvprintw(y, x, str)		move cursor to (y,x) and print str
 * refresh();				remember to refresh after printing
 * getmaxyx(stdscr, y, x);
 *							get screen size, (y,x) is updated.
 * box(stdscr, ACS_VLINE, ACS_HLINE)
 *							draw box
 * getch()					get a char from screen
 * addch()					put a char to screen
 * init_pair(index, COLOR_xxx, COLOR_xxx)
 *							init color pair as (fg, bg)
 * attron(color | decoration)
 *							call this before printing, for example
 *							attron(COLOR_PAIR(index) | A_UNDERLINE);
 */

#include <ncurses.h>
#include <string.h>
#include <stdlib.h>
#include <unistd.h>

void hello()
{
	initscr();
	noecho();
	curs_set(FALSE);
	box(stdscr, ACS_VLINE, ACS_HLINE);
	char *str = "hello, world!";
	mvprintw(LINES/2, (COLS-strlen(str))/2, str);
	refresh();
	getch();
	endwin();
}

void ball()
{
	const int DELAY = 30000;
	int x = 0, y = 0;
	int max_x = 0, max_y = 0;
	int next_x = 0;
	int direction = 1;

	initscr();
	noecho();
	curs_set(FALSE);
	while (TRUE) {
		getmaxyx(stdscr, max_y, max_x);
		clear();
		mvprintw(y, x, "O");
		refresh();

		usleep(DELAY);
		next_x = x + direction;
		if (next_x >= max_x || next_x < 0)
			direction = -direction;
		else
			x = next_x;
	}
	endwin();
}

void help()
{
	printf(	"usage: ncurses [option]\n"
			"-h   hello\n"
			"-b   ball\n"
	);
	exit(0);
}

int main(int argc, char **argv)
{
	if (argc < 2)
		help();

	switch (argv[1][1]) {
		case 'h':	hello();		break;
		case 'b':	ball();			break;
		default:	help();
	}
	return 0;
}
