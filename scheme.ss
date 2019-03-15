;---- Constant Objects -------------------------------------------------

; [string]

	"I am a string"

; [character]

	#\a

; [boolean]
; scheme conditional expressions treat #f as false and all other objects
; as true, like 3, 0, (), "false", "", nil.

	#t #f

; [number]

	-123 1/2 1.3 1e23

; [complex number]

	1.3-2.7i -1.2@73

; [vector]

	#(this is a vector of symbols)

; [byte vector]

	#vu8(3 250 45 73)

; [list]
; the following two lists are in fact the same

	'(a b c d)
	(quote (a b c d))

; [] may be used in place of () for readability. it is used commonly in
; let expressions

	'() '(a b c) '[* (- x 2) y]

; [symbol]

	'hello
	(quote hello)

; string and number consts can be quoted but that is unnecessary

;---- Identifier ------------------------------------------------------
 
	hi nice-to-see-you <good> morning! off50% x+2 x^y zmx@github
	/usr/share ?$&*!!! \x99

; available chars: A-Z a-z 0-9 ? ! . + - * / < = > : $ % ^ & _ ~ @
; and some unicode characters
 
; normally identifier cannot start with @ . + - 0-9
; except + - ... (valid) and any identifier starting with ->
 
; identifiers are delimited by whitespace, comments, (), [], "" and #
; identifiers are case-sesitive; the length of identifier is not limited

; [naming conventions]

; predicates, aka procedures return a true or false answer, end with ?

	eq? zero? pair?

; character, string, vector procedures start with char- string- vector-
; but list- is less common

	string-append

; type converting procedures

	vector->list

; procedures that changes its argument end with !
; except for input procedures

	set! vector-set!

;---- Comment -----------------------------------------------------------

;	line comment

#|
	block comment
	#|
		may be nested
	|#
|#

;	(three #;(datum comment) element list)
;	#;#;(a)(b) comments out both (a) and (b)

;---- Expression (Procedure Application) -------------------------------
;
; general form of a expression is (procedure arg1 arg2 ... argn)
; note that the Scheme evaluator is free to evaluate the expressions in
; any order --- not left to right only.

	; a constant is itself a expression
	"I'm peppa pig" => "I'm peppa pig"

	; arithmetics (note the conversion between different number types)
	(+ 13 45) => 58
	(* -1/2 3/5) => -3/10
	(/ 1 3) => 1/3
	(- 1.5 1/2) => 1.0

; [list operation]

	(list) => ()
	(list 'a) => (a)
	(list 'a 'b 'c) => (a b c)

	(car '(a b c)) => a
	(cdr '(a b c)) => (b c)
	(cdr '(a)) => ()
	(car (car '((a b ) (c d)))) => a
	(car (cdr (car '((a b) (c d))))) => b
	(car (car (cdr '((a b) (c d))))) => c
	(car (cdr (car (cdr '((a b) (c d)))))) => d

	; a improper list is a list who doesn't end with empty list
	; we may imagine a period . as a infix version of procedure cons
	(cons 'a '(b c)) => (a b c)
	(cons (car '(a b c))
		  (cdr '(d e f))) => (a e f)
	'(a . (b c)) => (a b c)
	(cons 'a 'b) => (a . b)
	(cdr '(a . b)) => b
	(cons 'a '(b . c)) => (a b . c)

;---- Quote ------------------------------------------------------------
;
; the subexpressions of a procedure application are evaluated, whereas the
; subexpression of a quote expression is not. The evaluation of a quote
; expression is more similar to the evaluation of constant objects. The
; value of a quote expression of the form (quote object) is simply object.

	(quote (+ 2 3)) => (+ 2 3)
	(quote cons) => cons
	(quote (quote cons)) => 'cons
	(car (quote (quote cons))) => quote

;---- variables --------------------------------------------------------

	; use let expression to bound variables
	(let ([x 2])
		(+ x 3)) => 5

	(let ([x 2] [y 3])
		(+ x y)) => 5

	(let ([add +] [x 2])
		(add x 3)) => 5

	; The variables bound by let are visible only within the let body
	(let ([+ *])
		(+ 2 3)) => 6
	(+ 2 3) => 5

	; nest and shadow: scheme uses lexical scoping
	(let ([x 1])
		(let ([x (+ x 1)])
			(+ x x))) => 4

;---- Procedure --------------------------------------------------------

	(define square
		(lambda (x)
			(* x x)))

	(square 5) => 25
	(square -200) => 40000
	(square 0.5) => 0.25
	(square -1/2) => 1/4
	(square 0+1i) => -1

	(define reciprocal
		(lambda (x)
			(if (= x 0)
				"oops!"
				(/ 1 x))))

