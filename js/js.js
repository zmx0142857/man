// ---------------- 添加 js ----------------

1. 直接嵌入

	<html>
	<head>
		<script>
			var name = prompt('What\'s your name?');
			alert('Hello, ' + name + '!');
		</script>
	</head>
	<body>
		...
	</body>
	</html>

2. 引入 js 文件

	<html>
		<head>
			<script src="/static/js/abc.js"></script>
		</head>
	<body>
		...
	</body>
	</html>

// ---------------- 输出调试信息 ----------------

console.log('some log');

// ---------------- 语句与块 ----------------

	var x = 1;	// undefined

	'some str';	// 'some str'

	if (x < 0) {
		return -x;
	} else {
		return x;
	}

! 警告: javascript 会自动在语句末添加分号, 但这有时令人困扰. 如

		return
			{ x < 0 ? -x : x };

将被解释为

		return;
			{ x < 0 ? -x : x };

这会导致函数总是返回 undefined. 正确写法应该是:

return {
	x < 0 ? -x : x
};

解释器不会在 '{' 之后加分号.

// ---------------- 类型与运算 ----------------

Number

	js 不区分整数与浮点数, Number 的例子有:

		123, 0xff00, 0.456, 1.2345e3, -99, NaN, Infinity

	相关运算:

		5 / 2;		// 2.5
		1 / 0;		// Infinity
		-1 / 0;		// -Infinity
		0 / 0;		// NaN, not a number
		10 % 3;		// 1
		10.5 % 3;	// 1.5

String

	用单引号 '' 或双引号 "" 括起来的文本.
	支持 C 语言风格的转义. 另外, '\u####' 表示一个 unicode 字符:

		'\u4e2d\u6587';		// "中文"

	反查编码:

		'♪'.charCodeAt(0).toString(16); // "266a"

	`` 括住多行字符串(ES6):

		`这是一个
		多行
		字符串`

	'+' 连接字符串:

		'数学' + '分析';	// "数学分析"

	模板字符串(ES6):

		var name = '小明';
		var age = 20;
		var msg = `${name}, 你今年${age}岁了!`;

	-----------------------------------------------------------------

	[]					获取字符, 对超出范围的下标, 返回 undefined
	str.length			返回 String 的字符数
	str.toUpperCase()	返回全部大写的拷贝
	str.toLowerCase()	返回全部小写的拷贝
	str.indexOf(s)		返回子串 s 首次出现的下标, 找不到时返回 -1
	str.substring(a=begin, b=end)
						返回一个由区间 [a, b) 确定的子串
	str.substr(beg, len)返回从 beg 开始, 长为 len 的子串
	parseInt(str)		读取 str, 返回一个整数, str 以数字开头即可
	parseFloat(str)		与上一条类似

	-----------------------------------------------------------------

Boolean

	此类型只有 true, false 两种值.

	相关运算:

		&& || !

Array

	Array 可以糅合不同的类型:

		var arr = [1, 3.14, 'Tom', null, true];

	-----------------------------------------------------------------

	[]					获取元素, 对超出范围的下标, 返回 undefined
	arr.length			返回 arr 的元素数. 给 arr.lenth 赋值会引起
						arr 大小变化. arr 变大时, 新增元素是 undefined
	arr.indexOf(a)		返回元素 a 首次出现的下标, 找不到时返回 -1
	arr.slice(a=begin, b=end)
						返回 arr 的截取 [a, b), 使用 slice() 取得拷贝
						时, 该拷贝与 arr 的 '===' 判断将失败.
	arr.push(...)		向 arr 的末尾添加元素, 返回新的 arr.length
	arr.pop()			返回 arr 末尾元素, 并将它移除. pop 一个空数组
						将返回 undefined
	arr.unshift(...)	向 arr 头部添加元素, 返回新的 arr.length
	arr.shift()			返回 arr 头部元素, 并将它移除. shift 一个空数
						组将返回 undefined
	arr.sort()			排序
	arr.reverse()		反转
	arr.splice(a, b, ...)
						"万能方法", 从指定下标 a 开始删除 b 个元素, 再
						从该位置添加若干元素. 返回被删除的元素的数组.
	arr.concat(...)		返回新数组, 把 arr 与 ... 连接起来. 若 ... 中
						有数组, 把它拆开再连接.
	arr + brr			把 arr 与 brr 的元素转换为字符串, 插入若干逗
						号, 再连接为一个字符串.
	arr.join(str)		把 arr 的元素转换为字符串, 用 str 连接起来

	-----------------------------------------------------------------

Object

	一组无序的键-值对:

		var person = {
			name: 'Bob',
			age: 20,
			tags: ['js', 'web', 'mobile'],
			city: 'Beijing',
			'has-car': true,
			zipcode: null
		};

	键的类型是 String, 而值可以是任意类型. 用下面的方法获取属性:

		person.name;		// 'Bob'
		person['has-car'];	// true
		person.girlfriend;	// undefined

	-----------------------------------------------------------------

	obj.property = value	新增属性
	delete obj.property		删除属性
	'property' in obj		检测 obj 是否有属性 property
	obj.hasOwnProperty('p')	检测 obj 是否有非继承得到的属性 p

	-----------------------------------------------------------------

Map (ES6)

	与 Object 的区别在于, Map 可以用 String 以外的类型作为键.

		var emptyMap = new Map();
		var m = new Map([['Mike', 95], ['Bob', 75], ['Tracy', 85]]);

	-----------------------------------------------------------------

	m.get(key)				取得 key 所对应的 value
	m.set(key, value)		添加 (或改写已有的) 键值对
	m.has(key)				检测 m 是否存在 key
	m.delete(key)			删除键

	------------------------------------------------------------------

Set (ES6)

	与 Map 的区别在于, Set 只存储 key.

		var emptySet = new Set();
		var s = new Set([1, 2, 3]);

	在 Set 中, 重复元素只保留一个.

	------------------------------------------------------------------

	s.add(key)				添加 key
	s.delete(key)			删除 key

	------------------------------------------------------------------

//! ---------------- 专栏: 变量 ----------------

	变量名是大小写英文字母, 数字, $ 和 _ 的组合, 且不能以数字开头, 亦
	不能是 if, while 等关键字. 未初始化的变量的值是 undefined:

		var a;		// undefined

	可以给同一个变量先后赋以不同的类型:

		var a = 123;
		var a = 'abc';

	在代码首行写上 'use strict'; 来要求变量先申明后使用.

	函数中, 可以引用下文申明的变量, 但那不是你想要的效果:

		function foo() {
			var x = 'hello, ' + y;
			alert(x);		// 'hello, undefined'
			var y = 'Bob';
		}

//! ---------------- 专栏: 比较运算符 ----------------

	js 允许对任意数据类型做比较, '==' 会自动转换数据类型再比较, 而
	'===' 在数据类型不一致时返回 false.

        false === false
        0 === 0
        '' === ''

        NaN != NaN
        [] != []
        {} != {}

        // 换成 === 都不成立
        undefined == null
        false == 0
        0 == ''
        '' == false

	唯一能判断 NaN 的方法是通过 isNaN() 函数.


// ---------------- 分支与循环 ----------------

条件判断:

		if (stmt1) {
			stmt2;
		} else {
			stmt3;
		}

	stmt1 是 null, undefined, 0, NaN 和 '' 时视为 false, 其他值视为
	true. 当 stmt2 或 stmt3 只有一条语句时, {} 可省, 但不推荐.

for 循环:

		var arr = [...];
		for (var i = 0; i < arr.length; i++) {
			...
		}

for-in 循环:

		var obj = {name:'Jack', age:20, city:'Beijing'};
		for (var key in obj) {	// 'name', 'age', 'city'
			...
		}

		var arr = ['a', 'b', 'c'];
		for (var i in a) {	// '0', '1', '2'
			...
		}

while 与 do-while:

	(与 C 语言一样)

for-of 循环 (ES6):

		var a = ['a', 'b', 'c'];
		for (var x of a) {	// 'a', 'b', 'c'
			...
		}

	用 for-of 遍历 Map 时, 得到的是 [key, value]:

		var m = new Map([[1, 'x'], [2, 'y'], [3, 'z']]);
		for (var x of m) {
			alert(x[0] + '=' + x[1]);
		}

forEach() 方法 (ES5.1)

		var s = new Set(['a', 'b', 'c']);
		s.forEach( function (element, sameElement, set) {
			...
		});

		var m = new Map([[1, 'x'], [2, 'y'], [3, 'z']]);
		m.forEach( function (value, key, map) {
			...
		});

// ---------------- 函数 ----------------

函数的定义

	两种等价的定义方式:

		function foo(...) {
			...
		}

		var foo = function(...) {
			...
		};

	允许传入的参数个数多于或少于函数所要求的参数.

	函数可以嵌套.

arguments

	在函数内部, arguments 是一个 tuple, 表示调用者传入的所有参数.
	用下标取得各个参数:

		function abs() {
			if (arguments.length === 0) {
				return 0;
			}
			var x = arguments[0];
			return x >= 0 ? x : -x;
		}

rest (ES6)

	传入的参数少于 3 个时, 下面这个函数的 rest === []

		function foo(a, b, ...rest) {
			console.log('a = ' + a);
			console.log('b = ' + b);
			console.log(rest);
		}

//! ---------------- 专栏: 作用域 ----------------

	全局变量与函数都绑定到 window 对象:

		'use strict';
		var course = 'learn js';
		function foo() {
			alert('foo');
		}

		alert(window.course);	// 'learn js'
		window.foo();			// 'foo'
		window.alert = function(){}; // 无法使用 alert() 了!

	为了减少命名冲突, 把定义的全局变量与函数绑定到一个全局变量:

		var MYAPP = {};

		MYAPP.name = 'myapp';
		MYAPP.version = 1.0;

		MYAPP.foo = function () {
			return 'foo';
		};

	js 中的局部作用域是函数级的:

		function foo() {
			for (var i = 0; i < 100; i++)
				...
			}
			i += 100; // i 仍然可用
		}

	用 let 代替 var 申明块级作用域的变量 (ES6).
	用 const 定义常量 (ES6). 常量也是块级作用域的.

// ---------------- 方法 ...! ----------------

	为小明定义一个 age() 方法:

		var xiaoming = {
			name: '小明',
			birth: 1990,
			age: function () {
				var y = new Date().getFullYear();
				return y - this.birth;
			}
		};

		xiaoming.age;	// function xiaoming.age()
		xiaoming.age();	// 返回小明的年龄

	也可以这么写:

		function getAge() {
			var y = new Date().getFullYear();
			return y - this.birth;
		}

		var xiaoming = {
			name: '小明',
			birth: 1990,
			age: getAge
		};

		xiaoming.age(); // 25, 正常结果
		getAge(); // NaN

document

	write("...");			// 输出 html,
							// 在文档加载后 (如通过按钮触发), 会发生覆盖.
	getElementById("...");  // 通过 id 获取元素

	elem.<attribute>		// 元素的属性
	elem.InnerHTML			// 元素内部的 html, 可以通过赋值改写.

window

	Date();					// 返回, 同终端 date

examples

// 编译 HTML 模板
function compile(template){
  var evalExpr = /<%=(.+?)%>/g; // 一行以内
  var expr = /<%([\s\S]+?)%>/g; // 允许跨行

  template = template.trim()
    .replace(evalExpr, '`);\n  echo($1);\n  echo(`')
    .replace(expr, '`);\n $1\n  echo(`');

  return eval(
  `(function(data) {
    var output = [];

    function echo(html) {
      output.push(html);
    }

    echo(\`${template}\`);

    return output.join('');
  })`
  );
}

var parse = compile(`
<ul>
  <% for (var i = 0; i < data.length; ++i) { %>
    <li><%= data[i] %></li>
  <% } %>
</ul>
`);
console.log(parse(['broom', 'mop', 'cleaner']));

// 正则转义
str.replace(/[\-\[\]\/\{\}\(\)\*\+\?\.\\\^\$\|]/g, '\\$&');

html 嵌入 pdf
<embed src="file.pdf" width="100%" height="600" alt="pdf" pluginspage="https://get.adobe.com/cn/reader/"></embed>

JavaScript能够准确表示的整数范围: (-2^53, 2^53)
Number.MAX_SAFE_INTEGER === Math.pow(2, 53) - 1

// 对象转数组
let arrayLike = {0: 'a', 1: 'b', 2: 'c', length: 3};
var arr1 = [].slice.call(arrayLike); // ES5, ['a', 'b', 'c']
let arr2 = Array.from(arrayLike); // ES6

// 参数转数组，ES5
function of() {
    return [].slice.call(arguments);
}
of(1, 2, 3) // [1, 2, 3]
Array.of(1, 2, 3) // ES6

[NaN].indexOf(NaN) // -1
[NaN].findIndex(isNaN) // 0
[NaN].includes(NaN) // true

// 类数组对象转数组
[...document.querySelectorAll('div')]
[...arguments]

// 合并数组, 注意 concat 返回新数组, 原数组不变
// 但 push 改变了原数组
var a1 = [0, 1, 2];
var a2 = [3, 4, 5];
[].push.apply(a1, a2); // ES5
a1.push(...a2); // ES6

[...a, ...b] // 数组并集
a.filter(x => b.includes(x)) // 数组交集

// 取头尾
const [head, ...tail] = [1, 2, 3, 4, 5];
head // 1
tail // [2, 3, 4, 5]

// 获得字符串的正确长度
'\ud83d\ude80'.length // 2
[...'\ud83d\ude80'].length // 1

// 箭头函数直接返回一个对象，必须在对象外面加上括号。
var getTempItem = id => ({ id: id, name: "Temp" });

// 管道机制, 前一个函数的输出是后一个函数的输入
const pipeline = (...funcs) =>
  val => funcs.reduce((a, b) => b(a), val);

const plus1 = a => a + 1;
const mult2 = a => a * 2;
const addThenMult = pipeline(plus1, mult2);
addThenMult(5) // 12

// 单独指定表格列宽
<table>
    <colgroup>
        <col style="width: 120px; min-width: 120px">
        <col>
        <col>
    </colgroup>
    <tr>
        <td></td>
        <td></td>
        <td></td>
    </tr>
</table>

// Object.assign()
const target = { a: 1, b: 2 };
const source1 = { b: 4, c: 5 };
const source2 = { d: 6, e: undefined };
const ret = Object.assign(target, source1, source2);
target // { a: 1, b: 4, c: 5, d: 6, e: undefined }
ret // { a: 1, b: 4, c: 5, d: 6, e: undefined }

// 函数式演算, 箭头运算符是从右往左算的
let foo = a => b => c => [a,b,c];
//相当于 let foo = a => (b => (c => [a,b,c]));
foo(1)(2)(3) // [1,2,3]

// this 绑定
foo::bar; // 等同于 bar.bind(foo);
foo::bar(...arguments); // 等同于 bar.apply(foo, arguments);

// 尾调用优化: 最后一步是单纯的调用, 可以用新函数的调用栈代替旧函数, 不会栈溢出
// ES6的尾调用优化只在严格模式下开启: 'use strict';
function factorial(n, total = 1) {
  if (n === 1) return total;
  return factorial(n - 1, n * total);
}

function fibonacci(n , a = 1 , b = 1) {
  if (n <= 1) return b;
  return fibonacci(n - 1, b, a + b);
}

function gcd(a, b) {
  if (b == 0) return a;
  return gcd(b, a % b);
}

// 柯里化 (currying), 把原本需要 n 个参数的函数 f 化为只需 n-1 个参数的函数
var currying = (f, n) => (...args) => f.call(this, ...args, n);
var curried = currying((a, b, c) => [a, b, c], 10);
curried(1, 2); // [1, 2, 10]

// ES5, 尾递归优化 (tail calling optimize)
function tco(f) {
  var value;
  var active = false;
  var accumulated = [];

  return function accumulator() {
    accumulated.push(arguments);
    if (!active) {
      active = true;
      while (accumulated.length) {
        value = f.apply(this, accumulated.shift());
      }
      active = false;
      return value;
    }
  };
}

var sum = tco(function(x, y) {
  if (y > 0)
    return sum(x + 1, y - 1);
  return x;
});

sum(1, 1000000) // 1000001, 不会栈溢出

// ES5, 化为 bool 值
!!undefined // false
!!null // false
!!false // false
!!0 // false
!!'' // false
!![] // true
!!{} // true

// for...in 循环：遍历对象自身的和继承的可枚举的属性
// 由于 for...in 会遍历继承的属性，所以尽量不要用 for...in，而用 Object.keys:
var obj = {a:1, b:2, c:3};
for (key of Object.keys(obj)) {
  console.log(key, obj[key]);
}

// 原型
Object.getPrototypeOf(obj);
var obj = Object.setPrototypeOf(o, prototype);
var obj = Object.create(prototype);

// promise: 将嵌套的回调函数，改为链式调用的形式
// 经典写法为: Promise.then().catch()

// 用 promise 异步加载图片
var preloadImage = function(path) {
  return new Promise(function(resolve, reject) {
    var img = new Image();
    img.onload  = resolve;
    img.onerror = reject;
    img.src = path;
  });
};

// 用 promise 发起 ajax 请求
var getJSON = function(url) {
  return new Promise(function(resolve, reject) {
    var xhr = new XMLHttpRequest();
    xhr.open("GET", url);
    xhr.responseType = "json";
    xhr.setRequestHeader("Accept", "application/json");
    xhr.onreadystatechange = function() {
      if (this.readyState === 4) {
        if (this.status === 200) {
          resolve(this.response);
        } else {
          reject(new Error(this.statusText));
        }
      }
    };
    xhr.send();
  });
};
getJSON("/posts.json").then(
  json => console.log(json)
).catch(
  e => console.error(e)
);

// Promise.resolve()
Promise.resolve('foo')
// 等价于
new Promise(resolve => resolve('foo'))

// 事件循环
// 下一轮事件循环开始时
setTimeout(function () {
  console.log('three');
}, 0);
// 本轮事件循环结束时
Promise.resolve().then(function () {
  console.log('two');
});
// 立即执行
console.log('one');
// one
// two
// three

// 部署 Promise.then().catch().done()
Promise.prototype.done = function (onFulfilled, onRejected) {
  this.then(onFulfilled, onRejected)
    .catch(function (reason) {
      // 抛出一个全局错误
      setTimeout(() => { throw reason }, 0);
    });
};
// 部署 Promise.then().catch().finally()
Promise.prototype.finally = function (callback) {
  let P = this.constructor;
  return this.then(
    value  => P.resolve(callback()).then(() => value),
    reason => P.resolve(callback()).then(() => { throw reason })
  );
};

// 数组去重, 两种方法
[...new Set(arr)]
Array.from(new Set(arr));

// set 上的 map
new Set(Array.from(set, x => x*2));
new Set([...set].map(x => x*2));

var union = new Set([...a, ...b]); // 并集
var intersect = new Set([...a].filter(x => b.has(x))); // 交集

// 通过代理支持数组负下标
function createArray(...elements) {
  let handler = {
    get(obj, key, receiver) {
      let index = Number(key);
      if (index < 0) {
        key = String(obj.length + index);
      }
      return Reflect.get(obj, key, receiver);
    }
  };

  return new Proxy([...elements], handler);
}
var arr = createArray('a', 'b', 'c');
arr[-1]

// 通过代理做赋值检查
function Person() {
  let handler = {
    set(obj, key, value, receiver) {
      if (key === 'age') {
        if (!Number.isInteger(value)) {
          throw new TypeError('the age should be an integer');
        } else if (value < 0) {
          throw new RangeError('the age should >= 0');
        }
      }
      obj[key] = value;
    }
  };
  return new Proxy({}, handler);
}
var person = Person();
person.age = 100;
person.age = 'hi';
person.age = -1;

// form 遍历 (兼容IE)
for (var i = 0; i < form.length; ++i) {
  var ele = form[i];
  console.log(ele, ele.name, ele.value);
}

// call, apply
Math.max(1, 2);
Math.max.call(null, 1, 2);
Math.max.apply(null, [1, 2]);

// 迭代器对象
let arr = ['a', 'b', 'c'];
let iter = arr[Symbol.iterator]();
iter.next(); // { value: 'a', done: false }
iter.next(); // { value: 'b', done: false }
iter.next(); // { value: 'c', done: false }
iter.next(); // { value: undefined, done: true }

// 实现一个迭代器
function doArgs(args) {
  var start = 0, stop, step = 1;
  if (args.length == 1) {
    stop = args[0];
  } else if (args.length == 2) {
    start = args[0];
    stop = args[1];
  } else if (args.length == 3) {
    start = args[0];
    stop = args[1];
    step = args[2];
  }
  return {start, stop, step};
}
function range() {
  var {start, stop, step} = doArgs(arguments);
  return {
    [Symbol.iterator]: function*() {
      if (step > 0) {
        for (var value = start; value < stop; value += step)
          yield value;
      } else if (step < 0) {
        for (var value = start; value > stop; value += step)
          yield value;
      }
    }
  };
}
// 测试
for (var x of range(0, 3)) {
  console.log(x);
}
[...range(5,0,-1)]

// 等价实现
function range() {
  var {start, stop, step} = doArgs(arguments);
  var value = start;
  return {
    [Symbol.iterator]() { return this; },
    next() {
      if ( (step > 0 && value < stop) || (step < 0 && value > stop)) {
        value += step;
        return {value: value - step};
      } else {
        return {done: true}
      }
    }
  };
}

// 使用模板操作 dom
// <div id="app"></div>
//
// <template id="template">
//   <div>string template!</div>
// </template>
var clone = document.importNode(template.content, true);
app.appendChild(clone);

// [js框架/工具]
//
// lodash.js: js实用工具集
// jquery: 用 css 选择器操作 dom
// ext: 古老的窗口风格框架
// vue, react: 大型前端框架
// highlight.js: 语法高亮
// animate.css, velocity, jquery.animate: 动画
// katex, mathjax: 数学公式渲染
// physicsJS, matter-js, phaser.io: 物理引擎
// xaudiojs: 播放声音
// read the docs, sphinx: 文档框架

// fibonacci
function* fibonacci() {
    let [a, b] = [0, 1];
    while (true) {
        yield a;
        a += b;
        yield b;
        b += a;
    }
}
for (let n of fibonacci()) {
    if (n > 10) break;
    console.log(n); // 0, 1, 1, 2, 3, 5, 8
}

// 嵌套 generator
function *inner() {
    yield 2;
}
function *outer() {
    yield 1;
    yield* inner(); // 相当于 for (let x of inner()) yield x;
    yield 3;
}
[...outer()] // [1, 2, 3]

// 遍历树
function* iterTree(tree) {
  if (!Array.isArray(tree)) {
    for (let subtree of tree) {
      yield* iterTree(subtree);
    }
  } else {
    yield tree;
  }
}
const tree = [ 'a', ['b', 'c'], ['d', 'e'] ];
[...iterTree(tree)]

// 将 generator 包装成构造函数
function* gen() {
  this.a = 1;
  yield this.b = 2;
  yield this.c = 3;
}
function F() {
  return gen.call(gen.prototype);
}
var f = new F();
f.next();  // Object {value: 2, done: false}
f.next();  // Object {value: 3, done: false}
f.next();  // Object {value: undefined, done: true}
f.a // 1
f.b // 2
f.c // 3

// 用 generator 表达异步操作
function* main() {
  console.log('loading...');
  var result = yield ajax("http://some.url");
  var resp = JSON.parse(result);
  console.log(resp.value);
}
function ajax(url) {
  setTimeout(function() {
    it.next('{"value": "ok"}');
  }, 500);
}
var it = main();
it.next();

// Thunk 函数
// ES5版本
var Thunk = function(fn){
  return function (){
    var args = Array.prototype.slice.call(arguments);
    return function (callback){
      args.push(callback);
      return fn.apply(this, args);
    }
  };
};
// ES6版本
var Thunk = (fn) => (...args) => (callback) => fn(...args, callback);

var fs = require('fs');
Thunk(fs.readFile)(filename)(callback); // 使用
