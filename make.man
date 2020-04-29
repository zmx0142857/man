make

	-n		打印要执行的命令, 但不执行
	-C dir	执行 dir 目录中的 Makefile

#---- makefile template --------

all: main

# $@ 表示目标
# $^ 表示所有依赖
# $< 表示第一项依赖
# $? 表示所有比目标新的依赖
main: main.o stack.o maze.o
	gcc $^ -o $@

# make 内建规则可以从 .c 生成 .o, 因此只需指定源文件依赖的头文件
main.o: main.h stack.h maze.h
stack.o: stack.h main.h
maze.o: maze.h main.h

# clean 是伪目标
.PHONY: clean

# 前缀 - 表示忽略错误
# 前缀 @ 表示不显示命令本身
clean:
	-rm main *.o
	@echo done

# 没更新过的目标文件原本已在 libsome.a 中, 不必重新打包
libsome.a: foo.o bar.o lose.o win.o 
	ar rs libsome.a $?

# ------------------------------

# a simple version of makefile

CC = gcc
IDIR = .
CFLAGS = -I$(IDIR)
DEPS = test.h
OBJ = main.o test.o

test: $(OBJ)
	$(CC) -o $@ $^ $(CFLAGS)

%.o: %.c $(DEPS)
	$(CC) -c -o $@ $< $(CFLAGS)

# a more advanced version of makefile
# run 'mkdir obj' before you run 'make'!

CC = gcc
IDIR = include
ODIR = obj
LDIR = lib

CFLAGS = -I$(IDIR)
LIBS = 

_DEPS = test.h
DEPS = $(patsubst %,$(IDIR)/%,$(_DEPS))
_OBJ = main.o test.o
OBJ = $(patsubst %,$(ODIR)/%,$(_OBJ))

test: $(OBJ)
	$(CC) -o $@ $^ $(CFLAGS) $(LIBS)

$(ODIR)/%.o: %.c $(DEPS)
	$(CC) -c -o $@ $< $(CFLAGS)

.PHONY: clean

clean:
	rm $(ODIR)/*.o test
