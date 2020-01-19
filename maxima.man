hello world

	print("hello world");

semicolon

	in maxima, each input is ended with a semicolon ';'
	to suppress output, use dollar sign '$' instead

assignment

	x: 3;
	kill(x);
	[a, b, c] : [1, 2, 3];

function

	f(x,y) := x^2 + y^2;
	f(1, 2);
	x[n] := 1/(n^2+1);
	x[10];

expression

	2*x + 3*y;
	%;
	%th(3); 倒数第三个输出
	
	expr: x^2 + y^2;
	at(expr, y=3);
	
	sort ([M, H, K, T, E, W, G, A, P, J, S]);

	1 + x + x^2;
	z * y * x;
	x + z + y;
	powerdisp: true;
	1 + x + x^2;
	z * y * x;
	x + z + y;

	expr: (x+1)/(y+1);
	part(expr, 1);
	part(expr, 2);
	part(expr, [1,2]);
	first(expr);
	last(expr);
	pickapart(expr, depth);

operator

	"+"(a,b,c);

	is(1 > 2);
	not 1 > 2;
	is(1 # 2); 不等于

	is((x+1)*(x-1) = x^2-1);
	is(equal((x+1)*(x-1), x^2-1));

	prefix(sqrt);
	sqrt 25;

substitution

	subst(new, old, expr);

	psubst([a^2=b, b=a], sin(a^2) + sin(b));
	subst([a^2=b, b=a], sin(a^2) + sin(b));

matrix
	
	m: matrix([1,2],[3,4]);
	n: copy(m);
	m[2][2]: 7;
	m;
	n;
	[1, 2, 3] . [1, 2, 3];
	m . n;

symbols

	float(%e);
	%pi;
	%i;
	%phi; 黄金比例 (1+sqrt(5))/2 = 1.618...
	%gamma; 欧拉常数 0.577...
	inf; 正无穷大
	minf; 负无穷大
	infinity; 复无穷大
	ind; 有界未定量, 如 limit(sin(1/x), x, 0);

	log(%e);
	alias(ln, log);
	ln(%e);

radix convertion

	ibase;
	obase;
	ibase: 16;
	0aa;
	ibase: 0a;

solve equation systems

	eq1: x^2 + 3*x + 1 = 0;
	lhs(eq1);
	rhs(eq1);

	eq1: 2*x - 5*y = 17;
	eq2: x + 3*y = 29;
	solve([eq1, eq2]);
	subst(%, [eq1, eq2]);

	linsolve([eq1, eq2], [var1, var2]);
	solve([eq1, eq2], [var1, var2]);

simplify

	simp
	ratsimp
	xthru

calculus

	limit(expr, var, to, [minus/]);
	diff(expr, var);
	integrate(expr, var);
	integrate(expr, var, from, to);

plot

	plot2d(expr, [x, a, b]);
	load(implicit_plot);
	implicit_plot(expr, [x,x1,x2], [y,y1,y2]);

	/* plot piecewise function

	x^2/2,              0 <= x < 1;
	(-2x^2 + 6x - 3)/2, 1 <= x < 2;
	(3-x)^2/2,          2 <= x < 3;
	*/

	xi(x,a,b) := ((max(x,a)-a)*(x-max(x,b)))/((x-a)*(x-b));
	plot2d(x^2/2*xi(x,0,1) + (-2*x^2+6*x-3)/2*xi(x,1,2) + (3-x)^2/2*xi(x,2,3), [x,-1,4], [y,-0.2,1], same_xy);

distribution function

	load("distrib");
	quantile_f(q, m, n);

	
