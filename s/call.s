# C 语言
int bar(int c, int d)
{
	int e = c + d;
	return e;
}

int foo(int a, int b)
{
	return bar(a, b);
}

int main()
{
	foo(2, 3);
	return 0;
}

# 汇编 (伪)
#
# 每个进程只有一个栈. 在 x86 架构中, 高地址是栈底, 低地址是栈顶
# 栈顶指针 esp 会随着 push 和 pop 命令移动
# 我们的代码一次对一个字 (=4字节) 进行操作, 因此地址总是 4 的倍数
#
# eip 保存入口地址, ebp 保存返回地址
#
# push <reg>
#
#	把寄存器 reg 的内容拷贝一份, 压入栈中
#
# pop <reg>
#
#	把栈顶数据弹出, 赋给寄存器 reg
#
# call func
#
#	push eip		# 保存当前指令指针
#	eip = func		# 给指令指针赋值, 以完成跳转
#
# leave
#
#	esp = ebp
#	pop ebp
#
#	leave 相当于 push ebp; ebp = esp 这两句的逆
#
# ret
#
#	pop eip
#
#	ret 相当于 call 的逆

bar:
	push ebp
	ebp = esp
	esp -= 16

	edx = ebp[12]
	eax = ebp[8]
	eax += edx
	ebp[-4] = eax
	eax = ebp[-4]

	leave
	ret

foo:
	push ebp
	ebp = esp
	esp -= 8

	esp[4] = ebp[12] # 实参赋给形参
	esp[0] = ebp[8]
	call bar

	leave
	ret

main:
	lea esp[4], ecx # ???
	esp &= 0xfffffff0
	push ecx[-4]

	push ebp
	ebp = esp
	push ecx
	esp -= 8

	# 传递参数并调用 foo 函数
	esp[4] = 3
	esp[0] = 2
	call foo

	eax = 0
	esp += 8
	pop ecx
	pop ebp
	lea ecx[-4], esp
	ret
