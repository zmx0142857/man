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

f a b c -- the same as ((f a) b) c)
f $ g $ h $ x -- function calling, the same as f(g(h x))
(f . g . h) x -- function composition, the same as f(g(h x))

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
repeat 10 -- repeat an element
take 3 (repeat 10) -- [10,10,10]
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
[1..] -- natural numbers

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

-- quick sort
quicksort :: (Ord a) => [a] -> [a]
quicksort [] = []
quicksort (x:xs) =
	let smaller = quicksort [a | a <- xs, a <= x];
		bigger  = quicksort [a | a <- xs, a > x]
	in	smaller ++ [x] ++ bigger

-- merge sort
merge xs [] = xs
merge [] xs = xs
merge (x:xs) (y:ys)
    | x <= y    = x : merge xs (y:ys)
    | otherwise = y : merge (x:xs) ys

mergesort [] = []
mergesort [x] = [x]
mergesort xs =
	let halves = splitAt (length xs `div` 2) xs
    in merge (mergesort $ fst halves) (mergesort $ snd halves)

-- prime
-- [5,7,11,13,17,19,23,25,29..]
iter = [6*n+s | n <- [1..], s <- [-1,1]]
notDivisible p x = x `mod` p /= 0
prime (p:ps) = p : prime (filter (notDivisible p) ps)
primes = 2:3:(prime iter)

-- 3n+1 conjecture
chain 1 = [1]
chain n
    | even n = n:chain (n `div` 2)
	| odd n = n:chain (3*n+1)

-- map, filter, foldl, foldr, scanl, scalr
sum' = foldl (+) 0
max' = foldl1 max
map' f = foldr (\x acc -> f x : acc) []
reverse' = foldl (flip (:)) []
polynomial x = foldl1 (\a b -> a*x + b)
scanl1 max [3,4,5,3,7,9,2,1]
scanl1 (+) [1..5]
-- 相当于
-- listSum v (x:xs) = let h = v + x in h : listSum h xs
-- listSum 0 [1..5]

-- sum_(k >= 1, k odd, k^2 < 10000) k^2
oddSquareSum =
    let oddSquares = filter odd $ map (^2) [1..]
        belowLimit = takeWhile (<10000) oddSquares
    in sum belowLimit


import Data.List
import Data.Function
