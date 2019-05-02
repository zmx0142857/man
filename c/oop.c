#include <stdio.h>

void game_init()
{
	puts("game.init()");
}

int game_isover()
{
	puts("game.isover()");
	return 1;
}

void game_board_print()
{
	puts("game.board.print()");
}

void game_board_clear()
{
	puts("game.board.clear()");
}

struct {
	void (*init)();
	int (*isover)();
	struct {
		void (*print)();
		void (*clear)();
	} board;
} game = {
	game_init,
	game_isover, {
		game_board_print,
		game_board_clear
	}
};

int main()
{
	game.init();
	game.board.print();
	if (game.isover())
		game.board.clear();
	return 0;
}
