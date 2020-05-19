$ ghci

-- load function
Prelude> :l myfunc

-- type inference
Prelude> :t variable

True, False, &&, ||, not
==, /=

10^2 -- 100
10**2 -- 100.0
odd 9
even 8
succ 8
succ(succ 8)
pred 0
min 9 10
div 92 10
92 `div` 10
mod 22 10

-- functions can't begin with uppercase letters
addus x y = x + y
double x = if x > 100 then x else x*2

-- lists
nums = [0, 1, 2, 3, 4]

[1, 2, 3, 4] ++ [5, 6, 7, 8]
"hello " ++ "world"
0 : [1, 2, 3, 4, 5]

length nums
null nums -- checks if the list is empty
4 `elem` nums
reverse nums
take 3 nums -- returns the list if 3 > length nums
drop 3 nums -- drops all if 3 > length nums
cycle nums -- cycle a list
repeat 5 -- repeat an element
replicate 3 10 -- [10,10,10]

-- be careful and not to use these on empty lists
nums !! 1
head nums
last nums
tail nums
init nums
maximum nums
minimum nums
sum nums
product nums

-- ranges
[1..20]
[2,4..20] -- arithmetic sequence
[20,19..1]
['K'..'Z']
[0.1, 0.3 .. 1] -- [0.1,0.3,0.5,0.7,0.8999999999999999,1.0999999999999999]
[1, 2..] -- infinite

-- list comprehension
[x*2 | x <- [1..10]]
[x | x <- [1..105], x `mod` 3 == 1, x `mod`5 == 2, x `mod`7 == 4]
[[x,y] | x <- [1..5], y <- [1..5]]
[(a,b,c) | c <- [1..10], b <- [1..c], a <- [1..b], a^2 + b^2 == c^2, a+b+c == 24]  

-- tuples
fst (8,11)
snd ("wow", False)
zip ['A'..'E'] [1..5]

-- pattern matching
initials (f:_) (l:_) = (f:". ") ++ (l:".")
initials "Clarence" "Zhuo"

-- recursion
fac :: (Integral a) => a -> a
fac 0 = 1
fac n = n * fac (n-1)

-- guard
bmi :: (RealFloat a) => a -> a -> String
bmi height weight
	| x <= 18.5 = "underweight"
	| x <= 25.0 = "normal"
	| otherwise = "overweight"
	where x = weight / height^2
