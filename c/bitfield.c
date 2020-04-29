#include <stdio.h>

int main()
{
	union {
		struct {
			unsigned a1:1;
			unsigned a2:3;
			unsigned a3:10;
			unsigned a4:5;
			unsigned :2;
			unsigned a5:8;
			unsigned a6:8;
		} bitfield;
		unsigned char byte[8];
	} data = {
		{1, 5, 513, 17, 129, 0x81}
		// 00000000 00000000 00000000 10000001
		// 000|10000 001|00|100 01|100000 0001|101|1
	};
	printf("size: %ld\n", sizeof(data));
	printf("value: %d %d %d %d %d %d\n",
		data.bitfield.a1,
		data.bitfield.a2,
		data.bitfield.a3,
		data.bitfield.a4,
		data.bitfield.a5,
		data.bitfield.a6
	);
	for (int i = 0; i < 8; ++i) {
		printf("%02x ", data.byte[i]);
	}
	putchar('\n');
	return 0;
}
