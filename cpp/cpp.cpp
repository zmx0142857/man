#include <iostream>
using namespace std;

class A {
public:
	void method() {
		cout << "A\n";
	}
};

class B : public A {
public:
	virtual void method() {
		cout << "B\n";
	}
};

class C : public B {
public:
	void method() {
		cout << "C\n";
	}
};

int main()
{
	C c;
	B &ref = c;
	ref.method();

	B b;
	A &ref2 = b;
	ref2.method();
	return 0;
}

/* cpp 中，virtual 方法的覆盖也必须保证名字，参数列表和返回类型相同。
 * virtual 覆盖的方法不能是 private (private 不能继承)
 * 一旦继承链中有一代是 virtual，下面代代都是 virtual，不论是否显式写出
 * virtual 关键字。
 * 当以引用/指针类型调用对象的方法时，普通方法从该引用/指针类型开始上溯，
 * 直到找到匹配的方法为止。如果该引用/指针类型的该方法有定义
 * （无论是显式定义还是继承而来）且是 virtual
 * 的，则从该对象的实际类型开始上溯。
 */
