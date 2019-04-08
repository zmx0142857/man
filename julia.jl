# ---- hello world ------------------------------------------------------

# hello.jl, run by:
$ julia hello.jl foo bar

println(PROGRAM_FILE, ": hello world!")
for arg in ARGS
	println(arg)
end

# or run this in command line:
$ julia -e 'println(PROGRAM_FILE); for arg in ARGS; println(arg); end' foo bar

# ---- repl -------------------------------------------------------------

julia> x = 1
1
julia> x + 1
2
julia> x + 1;
julia> ans
2

# ---- naming -----------------------------------------------------------

# Unicode names (in UTF-8 encoding) are allowed:

julia> δ = 0.00001
1.0e-5

julia> 안녕하세요 = "Hello"
"Hello"

# α̂₂ can be entered by \alpha<tab>\hat<tab>\_2<tab>

# ---- redefine built-in objects ----------------------------------------

julia> pi = 3
3

julia> pi
3

julia> sqrt = 4
4

# if the built-in object is already in use, julia will give an error

julia> pi
π = 3.1415926535897...

julia> pi = 3
ERROR: cannot assign variable MathConstants.pi from module Main

julia> sqrt(100)
10.0

julia> sqrt = 4
ERROR: cannot assign variable Base.sqrt from module Main

# ---- integers and float numbers ---------------------------------------

julia> x = typemax(Int64)
9223372036854775807

julia> x + 1
-9223372036854775808

Integer division (the div function) has two exceptional cases: dividing by zero, and dividing the lowest negative number (typemin) by -1. Both of these cases throw a DivideError. The remainder and modulus functions (rem and mod) throw a DivideError when their second argument is zero.

julia> 0.0 == -0.0
true

julia> bitstring(0.0)
"0000000000000000000000000000000000000000000000000000000000000000"

julia> bitstring(-0.0)
"1000000000000000000000000000000000000000000000000000000000000000"

julia> 1/Inf
0.0

julia> 1/0
Inf

julia> -5/0
-Inf

julia> 0.000001/0
Inf

julia> 0/0
NaN

julia> 500 + Inf
Inf

julia> 500 - Inf
-Inf

julia> Inf + Inf
Inf

julia> Inf - Inf
NaN

julia> Inf * Inf
Inf

julia> Inf / Inf
NaN

julia> 0 * Inf
NaN

NaN is not equal to, not less than, and not greater than anything, including itself.

julia> NaN == NaN
false

julia> NaN != NaN
true

julia> NaN < NaN
false

julia> NaN > NaN
false

and can cause especial headaches with arrays:

julia> [1 NaN] == [1 NaN]
false

Julia provides eps, which gives the distance between 1.0 and the next larger representable floating-point value:

julia> eps(Float32) # 2.0^-23
1.1920929f-7

julia> eps(Float64) # 2.0^-52
2.220446049250313e-16

julia> eps() # same as eps(Float64)
2.220446049250313e-16

julia> eps(1.0)
2.220446049250313e-16

julia> eps(1000.)
1.1368683772161603e-13

julia> eps(1e-27)
1.793662034335766e-43

julia> eps(0.0)
5.0e-324

Julia also provides the nextfloat and prevfloat functions which return the next largest or smallest representable floating-point number to the argument respectively:

julia> x = 1.25f0
1.25f0

julia> nextfloat(x)
1.2500001f0

julia> prevfloat(x)
1.2499999f0

julia> bitstring(prevfloat(x))
"00111111100111111111111111111111"

julia> bitstring(x)
"00111111101000000000000000000000"

julia> bitstring(nextfloat(x))
"00111111101000000000000000000001"

If a number doesn't have an exact floating-point representation, it must be rounded to an appropriate representable value. However, the manner in which this rounding is done can be changed if required according to the rounding modes presented in the IEEE 754 standard.

The default mode used is always RoundNearest

To allow computations with arbitrary-precision integers and floating point numbers, Julia wraps the GNU Multiple Precision Arithmetic Library (GMP) and the GNU MPFR Library, respectively. The BigInt and BigFloat types are available in Julia for arbitrary precision integer and floating point numbers respectively.

julia> BigInt(typemax(Int64)) + 1
9223372036854775808

julia> parse(BigInt, "123456789012345678901234567890") + 1
123456789012345678901234567891

julia> parse(BigFloat, "1.23456789012345678901")
1.234567890123456789010000000000000000000000000000000000000000000000000000000004

julia> BigFloat(2.0^66) / 3
2.459565876494606882133333333333333333333333333333333333333333333333333333333344e+19

julia> factorial(BigInt(40))
815915283247897734345611269596115894272000000000

To make common numeric formulae and expressions clearer, Julia allows variables to be immediately preceded by a numeric literal, implying multiplication. This makes writing polynomial expressions much cleaner:

julia> x = 3
3

julia> 2x^2 - 3x + 1
10

julia> 1.5x^2 - .5x + 1
13.0

The precedence of numeric literal coefficients is slightly lower than that of unary operators such as negation. So -2x is parsed as (-2) * x and √2x is parsed as (√2) * x. However, numeric literal coefficients parse similarly to unary operators when combined with exponentiation. For example 2^3x is parsed as 2^(3x), and 2x^3 is parsed as 2*(x^3).

Numeric literals also work as coefficients to parenthesized expressions:

julia> 2(x-1)^2 - 3(x-1) + 1
3

Additionally, parenthesized expressions can be used as coefficients to variables, implying multiplication of the expression by the variable:

julia> (x-1)x
6

Neither juxtaposition of two parenthesized expressions, nor placing a variable before a parenthesized expression, however, can be used to imply multiplication:

julia> (x-1)(x+1)
ERROR: MethodError: objects of type Int64 are not callable

julia> x(x+1)
ERROR: MethodError: objects of type Int64 are not callable

Function | Description
-------- | ---------------
zero(x)	 | Literal zero of type x or type of variable x
one(x)	 | Literal one of type x or type of variable x

These functions are useful in Numeric Comparisons to avoid overhead from unnecessary type conversion.

Examples:

julia> zero(Float32)
0.0f0

julia> zero(1.0)
0.0

julia> one(Int32)
1

julia> one(BigFloat)
1.0

#---- operators ---------------------------------------------------------

x / y	divide	performs division
x ÷ y	integer divide, truncated to integer. equivalent to div(x, y)
x \ y	inverse divide	equivalent to y / x
x ^ y	power	raises x to the yth power
x % y	remainder	equivalent to rem(x,y)

x ⊻ y	bitwise xor, equivalent to xor(x, y)
x >>> y	logical shift right, padding 0s to left
x >> y	arithmetic shift right, padding 0s for + and 1s for -
x << y	shift left

! An updating operator rebinds the variable on the left-hand side. As a result, the type of the variable may change.

julia> x = 0x01; typeof(x)
UInt8

julia> x *= 2 # Same as x = x * 2
2

julia> typeof(x)
Int64

Vectorized "dot" operators

julia> [1,2,3] .^ 3
3-element Array{Int64,1}:
  1
  8
 27
a .^ b is parsed as the "dot" call (^).(a,b), which performs a broadcast operation: it can combine arrays and scalars, arrays of the same size (performing the operation elementwise), and even arrays of different shapes (e.g. combining row and column vectors to produce a matrix). Moreover, like all vectorized "dot calls," these "dot operators" are fusing. For example,
if you compute 2 .* A.^2 .+ sin.(A) (or equivalently @. 2A^2 + sin(A), using the @. macro) for an array A, it performs a single loop over A, computing 2a^2 + sin(a) for each element of A. 

Moreover, nested f.(args...) calls are fused into a single broadcast loop. For example, sin.(cos.(X)) is equivalent to broadcast(x -> sin(cos(x)), X), similar to [sin(cos(x)) for x in X]: there is only a single loop over X, and a single array is allocated for the result. [In contrast, sin(cos(X)) in a typical "vectorized" language would first allocate one temporary array for tmp=cos(X), and then compute sin(tmp) in a separate loop, allocating a second array.] This loop fusion is not a compiler optimization that may or may not occur, it is a syntactic guarantee whenever nested f.(args...) calls are encountered. Technically, the fusion stops as soon as a "non-dot" function call is encountered; for example, in sin.(sort(cos.(X))) the sin and cos loops cannot be merged because of the intervening sort function.

Finally, the maximum efficiency is typically achieved when the output array of a vectorized operation is pre-allocated, so that repeated calls do not allocate new arrays over and over again for the results (see Pre-allocating outputs). A convenient syntax for this is X .= ..., which is equivalent to broadcast!(identity, X, ...) except that, as above, the broadcast! loop is fused with any nested "dot" calls. For example, X .= sin.(Y) is equivalent to broadcast!(sin, X, Y), overwriting X with sin.(Y) in-place. If the left-hand side is an array-indexing expression, e.g. X[2:end] .= sin.(Y), then it translates to broadcast! on a view, e.g. broadcast!(sin, view(X, 2:lastindex(X)), Y), so that the left-hand side is updated in-place.

the macro @. is provided to convert every function call, operation, and assignment in an expression into the "dotted" version.

julia> Y = [1.0, 2.0, 3.0, 4.0];

julia> X = similar(Y); # pre-allocate output array

julia> @. X = sin(cos(Y)) # equivalent to X .= sin.(cos.(Y))
4-element Array{Float64,1}:
  0.5143952585235492
 -0.4042391538522658
 -0.8360218615377305
 -0.6080830096407656

You can also combine dot operations with function chaining using |>, as in this example:

julia> [1:5;] .|> [x->x^2, inv, x->2*x, -, isodd]
5-element Array{Real,1}:
    1
    0.5
    6
   -4
 true

Julia provides additional functions to test numbers for special values, which can be useful in situations like hash key comparisons:

Function	Tests if
isequal(x, y)	x and y are identical
isfinite(x)	x is a finite number
isinf(x)	x is infinite
isnan(x)	x is not a number

isequal considers NaNs equal to each other:

julia> isequal(NaN, NaN)
true

julia> isequal([1 NaN], [1 NaN])
true

julia> isequal(NaN, NaN32)
true

isequal can also be used to distinguish signed zeros:

julia> -0.0 == 0.0
true

julia> isequal(-0.0, 0.0)
false

For other types, isequal defaults to calling ==, so if you want to define equality for your own types then you only need to add a == method. If you define your own equality function, you should probably define a corresponding hash method to ensure that isequal(x,y) implies hash(x) == hash(y).

Note the evaluation behavior of chained comparisons:

julia> v(x) = (println(x); x)
v (generic function with 1 method)

julia> v(1) < v(2) <= v(3)
2
1
3
true

julia> v(1) > v(2) <= v(3)
2
1
false

The middle expression is only evaluated once, rather than twice as it would be if the expression were written as v(1) < v(2) && v(2) <= v(3). 

However, the order of evaluations in a chained comparison is undefined. It is strongly recommended not to use expressions with side effects (such as printing) in chained comparisons. If side effects are required, the short-circuit && operator should be used explicitly.

You can also find the numerical precedence for any given operator via the built-in function Base.operator_precedence, where higher numbers take precedence:

julia> Base.operator_precedence(:+), Base.operator_precedence(:*), Base.operator_precedence(:.)
(11, 13, 17)

julia> Base.operator_precedence(:sin), Base.operator_precedence(:+=), Base.operator_precedence(:(=))  # (Note the necessary parens on `:(=)`)
(0, 1, 1)

A symbol representing the operator associativity can also be found by calling the built-in function Base.operator_associativity:

julia> Base.operator_associativity(:-), Base.operator_associativity(:+), Base.operator_associativity(:^)
(:left, :none, :right)

julia> Base.operator_associativity(:⊗), Base.operator_associativity(:sin), Base.operator_associativity(:→)
(:left, :none, :right)

Note that symbols such as :sin return precedence 0. This value represents invalid operators and not operators of lowest precedence. Similarly, such operators are assigned associativity :none.

Division functions
Function	Description
div(x,y), x÷y	truncated division; quotient rounded towards zero
fld(x,y)	floored division; quotient rounded towards -Inf
cld(x,y)	ceiling division; quotient rounded towards +Inf
rem(x,y)	remainder; satisfies x == div(x,y)*y + rem(x,y); sign matches x
mod(x,y)	modulus; satisfies x == fld(x,y)*y + mod(x,y); sign matches y
mod1(x,y)	mod with offset 1; returns r∈(0,y] for y>0 or r∈[y,0) for y<0, where mod(r, y) == mod(x, y)
mod2pi(x)	modulus with respect to 2pi; 0 <= mod2pi(x)   < 2pi
divrem(x,y)	returns (div(x,y),rem(x,y))
fldmod(x,y)	returns (fld(x,y),mod(x,y))
gcd(x,y...)	greatest positive common divisor of x, y,...
lcm(x,y...)	least positive common multiple of x, y,...

Constructing infinite rational values is acceptable:

julia> 5//0
1//0

julia> -3//0
-1//0

julia> typeof(ans)
Rational{Int64}

Trying to construct a NaN rational value, however, is invalid:

julia> 0//0
ERROR: ArgumentError: invalid rational: zero(Int64)//zero(Int64)
Stacktrace:
[...]

# ---- strings ----------------------------------------------------------

All string types are subtypes of the abstract type AbstractString, and external packages define additional AbstractString subtypes (e.g. for other encodings). If you define a function expecting a string argument, you should declare the type as AbstractString in order to accept any string type.

# ---- indexing ---------------------------------------------------------

julia> str = "Hello, world.\n"
"Hello, world.\n"

julia> """Contains "quote" characters"""
"Contains \"quote\" characters"

If you want to extract a character from a string, you index into it:

julia> str[1]
'H': ASCII/Unicode U+0048 (category Lu: Letter, uppercase)

julia> str[6]
',': ASCII/Unicode U+002c (category Po: Punctuation, other)

julia> str[end]
'\n': ASCII/Unicode U+000a (category Cc: Other, control)

julia> str[4:9]
"lo, wo"

julia> str[6]
',': ASCII/Unicode U+002c (category Po: Punctuation, other)

julia> str[6:6]
","
Many Julia objects, including strings, can be indexed with integers. The index of the first element is returned by firstindex(str), and the index of the last element with lastindex(str). The keyword end can be used inside an indexing operation as shorthand for the last index along the given dimension. 

Most indexing in Julia is 1-based: the first element of many integer-indexed objects is found at index 1. (As we will see below, this does not necessarily mean that the last element is found at index n, where n is the length of the string.)

Range indexing makes a copy of the selected part of the original string. Alternatively, it is possible to create a view into a string using the type SubString, for example:

julia> str = "long string"
"long string"

julia> substr = SubString(str, 1, 4)
"long"

julia> typeof(substr)
SubString{String}

julia> s = "\u2200 x \u2203 y"
"∀ x ∃ y"

julia> s[1]
'∀': Unicode U+2200 (category Sm: Symbol, math)

julia> s[2]
ERROR: StringIndexError("∀ x ∃ y", 2)
[...]

julia> s[3]
ERROR: StringIndexError("∀ x ∃ y", 3)
Stacktrace:
[...]

julia> s[4]
' ': ASCII/Unicode U+0020 (category Zs: Separator, space)

next valid index can be computed by nextind(s,1), and the next index after that by nextind(s,4) and so on.

length(s) : number of characters in a string

firstindex(str) gives the minimal (byte) index that can be used to index into str (always 1 for strings, not necessarily true for other containers).
lastindex(str) gives the maximal (byte) index that can be used to index into str.
length(str) the number of characters in str.
length(str, i, j) the number of valid character indices in str from i to j.
ncodeunits(str) number of code units in a string.
codeunit(str, i) gives the code unit value in the string str at index i.
thisind(str, i) given an arbitrary index into a string find the first index of the character into which the index points.
nextind(str, i, n=1) find the start of the nth character starting after index i.
prevind(str, i, n=1) find the start of the nth character starting before index i

Strings in Julia can contain invalid UTF-8 code unit sequences. This convention allows to treat any byte sequence as a String. In such situations a rule is that when parsing a sequence of code units from left to right characters are formed by the longest sequence of 8-bit code units that matches the start of one of the following bit patterns (each x can be 0 or 1):

    0xxxxxxx;
    110xxxxx 10xxxxxx;
    1110xxxx 10xxxxxx 10xxxxxx;
    11110xxx 10xxxxxx 10xxxxxx 10xxxxxx;
    10xxxxxx;
    11111xxx.

concatenation:

julia> greet = "Hello"
"Hello"

julia> whom = "world"
"world"

julia> string(greet, ", ", whom, ".\n")
"Hello, world.\n"

julia> greet * ", " * whom * ".\n"
"Hello, world.\n"

julia> a, b = "\xe2\x88", "\x80"
("\xe2\x88", "\x80")

julia> c = a*b
"∀"

In mathematics, + usually denotes a commutative operation, where the order of the operands does not matter.  In contrast, * typically denotes a noncommutative operation, where the order of the operands does matter. 

Interpolation, repeat and join

julia> "$greet, $whom.\n"
"Hello, world.\n"

julia> print("I have \$100 in my account.\n")
I have $100 in my account.

julia> repeat(".:Z:.", 10)
".:Z:..:Z:..:Z:..:Z:..:Z:..:Z:..:Z:..:Z:..:Z:..:Z:."

julia> join(["apples", "bananas", "pineapples"], ", ", " and ")
"apples, bananas and pineapples"

Search in string

julia> findfirst(isequal('o'), "xylophone")
4

julia> findlast(isequal('o'), "xylophone")
7

julia> findfirst(isequal('z'), "xylophone")

julia> findnext(isequal('o'), "xylophone", 1)
4

julia> findnext(isequal('o'), "xylophone", 5)
7

julia> findprev(isequal('o'), "xylophone", 5)
4

julia> findnext(isequal('o'), "xylophone", 8)

julia> occursin("world", "Hello, world.")
true

julia> occursin("o", "Xylophon")
true

julia> occursin("a", "Xylophon")
false

julia> occursin('o', "Xylophon")
true

Regular Expression

To check if a regex matches a string, use occursin:

julia> occursin(r"^\s*(?:#|$)", "not a comment")
false

julia> occursin(r"^\s*(?:#|$)", "# a comment")
true

To capture this information about a match, use the match function instead:

julia> match(r"^\s*(?:#|$)", "not a comment")

julia> match(r"^\s*(?:#|$)", "# a comment")
RegexMatch("#")

julia> m = match(r"^\s*(?:#\s*(.*?)\s*$|$)", "# a comment ")
RegexMatch("# a comment ", 1="a comment")

When calling match, you have the option to specify an index at which to start the search. For example:

julia> m = match(r"[0-9]","aaaa1aaaa2aaaa3",1)
RegexMatch("1")

julia> m = match(r"[0-9]","aaaa1aaaa2aaaa3",6)
RegexMatch("2")

julia> m = match(r"[0-9]","aaaa1aaaa2aaaa3",11)
RegexMatch("3")

You can extract the following info from a RegexMatch object:

    the entire substring matched: m.match
    the captured substrings as an array of strings: m.captures
    the offset at which the whole match begins: m.offset
    the offsets of the captured substrings as a vector: m.offsets

It is convenient to have captures returned as an array so that one can use destructuring syntax to bind them to local variables:

julia> first, second, third = m.captures; first
"a"

Captures can also be accessed by indexing the RegexMatch object with the number or name of the capture group:

julia> m=match(r"(?<hour>\d+):(?<minute>\d+)","12:45")
RegexMatch("12:45", hour="12", minute="45")

julia> m[:minute]
"45"

julia> m[2]
"45"

Captures can be referenced in a substitution string when using replace by using \n to refer to the nth capture group and prefixing the substitution string with s. Capture group 0 refers to the entire match object. Named capture groups can be referenced in the substitution with \g<groupname>. For example:

julia> replace("first second", r"(\w+) (?<agroup>\w+)" => s"\g<agroup> \1")
"second first"

Numbered capture groups can also be referenced as \g<n> for disambiguation, as in:

julia> replace("a", r"." => s"\g<0>1")
"a1"

# ---- Functions --------------------------------------------------------

julia> function f(x,y)
           x + y
       end
f (generic function with 1 method)

julia> f(x,y) = x + y
f (generic function with 1 method)

A return type can also be specified in the function declaration using the :: operator. This converts the return value to the specified type.

julia> function g(x, y)::Int8
           return x * y
       end;

Operators are functions (except those short-circuit operators like && ||)

julia> 1 + 2 + 3
6

julia> +(1,2,3)
6

julia> f = +;

julia> f(1,2,3)
6

Expression	Calls
[A B C ...]	hcat
[A; B; C; ...]	vcat
[A B; C D; ...]	hvcat
A'	adjoint
A[i]	getindex
A[i] = x	setindex!
A.n	getproperty
A.n = x	setproperty!

Anonymous Functions

julia> x -> x^2 + 2x - 1
#1 (generic function with 1 method)

julia> function (x)
           x^2 + 2x - 1
       end
#3 (generic function with 1 method)

Do-Block Syntax for Function Arguments

Passing functions as arguments to other functions is a powerful technique, but the syntax for it is not always convenient. Such calls are especially awkward to write when the function argument requires multiple lines. As an example, consider calling map on a function with several cases:

map(x->begin
           if x < 0 && iseven(x)
               return 0
           elseif x == 0
               return 1
           else
               return x
           end
       end,
    [A, B, C])

Julia provides a reserved word do for rewriting this code more clearly:

map([A, B, C]) do x
    if x < 0 && iseven(x)
        return 0
    elseif x == 0
        return 1
    else
        return x
    end
end

open("outfile", "w") do io
    write(io, data)
end

This is accomplished by the following definition:

function open(f::Function, args...)
    io = open(args...)
    try
        f(io)
    finally
        close(io)
    end
end

if blocks are "leaky", i.e. they do not introduce a local scope. This means that new variables defined inside the if clauses can be used after the if block, even if they weren't defined before. 

julia> function test(x,y)
           if x < y
               relation = "less than"
           elseif x == y
               relation = "equal to"
           else
               relation = "greater than"
           end
           println("x is ", relation, " y.")
       end
test (generic function with 1 method)

julia> test(2, 1)
x is greater than y.

if blocks also return a value,

julia> x = 3
3

julia> if x > 0
           "positive!"
       else
           "negative..."
       end
"positive!"

# ---- Loops ------------------------------------------------------------

for i = 1:5
	println(i)
end

i = 1
while i < 6
	println(i)
end

for i in [1, 3, 7]
	println(i)
end

for i = 1:3, j = 1:3
	println(i, j)
end

# ---- Exceptions -------------------------------------------------------

ArgumentError
BoundsError
CompositeException
DivideError
DomainError
EOFError
ErrorException
InexactError
InitError
InterruptException
InvalidStateException
KeyError
LoadError
OutOfMemoryError
ReadOnlyMemoryError
RemoteException
MethodError
OverflowError
Meta.ParseError
SystemError
TypeError
UndefRefError
UndefVarError
StringIndexError

julia> f(x) = x>=0 ? exp(-x) : throw(DomainError(x, "argument must be nonnegative"))
f (generic function with 1 method)

julia> f(1)
0.36787944117144233

julia> f(-1)
ERROR: DomainError with -1:
argument must be nonnegative
Stacktrace:
 [1] f(::Int64) at ./none:1

julia> sqrt_second(x) = try
           sqrt(x[2])
       catch y
           if isa(y, DomainError)
               sqrt(complex(x[2], 0))
           elseif isa(y, BoundsError)
               sqrt(x)
           end
       end
sqrt_second (generic function with 1 method)

julia> sqrt_second([1 4])
2.0

julia> sqrt_second([1 -4])
0.0 + 2.0im

julia> sqrt_second(9)
3.0

julia> sqrt_second(-9)
ERROR: DomainError with -9.0:
sqrt will only return a complex result if called with a complex argument. Try sqrt(Complex(x)).
Stacktrace:
[...]

# ---- Tasks ------------------------------------------------------------

A Channel is a waitable first-in first-out queue which can have multiple tasks reading from and writing to it.

Let's define a producer task, which produces values via the put! call. To consume values, we need to schedule the producer to run in a new task. A special Channel constructor which accepts a 1-arg function as an argument can be used to run a task bound to a channel. We can then take! values repeatedly from the channel object:

julia> function producer(c::Channel)
           put!(c, "start")
           for n=1:3
               put!(c, 2n)
           end
           put!(c, "stop")
       end;

julia> c = Channel(producer);

julia> take!(c)
"start"

julia> take!(c)
2

julia> take!(c)
4

julia> take!(c)
6

julia> take!(c)
"stop"

julia> take!(c)
ERROR: InvalidStateException("Channel is closed.", :closed)
Stacktrace:
 ...

julia> for x in Channel(producer)
           println(x)
       end
start
2
4
6
stop
