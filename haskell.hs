$ ghci

-- import
import Data.List
import Data.Map
import Data.Function

Prelude> :?  -- help
Prelude> :bro -- browse functions
Prelude> :l myfunc -- load function
Prelude> :t variable -- type inference
Prelude> :{ -- multilines
Prelude> :} -- end multilines

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
              -- 相当于不需要右括号的左括号
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
nums !! 1 -- take num[1]
head nums
last nums
tail nums -- everything but head
init nums -- everything but last
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
unzip [(1,4),(2,5),(3,6)]

-- linear algebra
zipWith (zipWith (+)) [[1,2],[3,4]] [[2,2],[3,4]] -- matrix addition
innerp a b = sum $ zipWith (*) a b -- vector inner product
trans mat = if any null mat then [] else (map head mat):(trans $ map tail mat) -- Data.List.transpose
matmul a b = [ [ innerp row col | col <- trans b ] | row <- a ]
matmul a b = map (\row -> map (innerp row) (trans b)) a -- another approach

-- string
Data.List.intercalate " " ["hey","there","guys"]

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
maximum' = foldl1 max
map' f = foldr (\x acc -> f x : acc) []
reverse' = foldl (flip (:)) []
polynomial x = foldl1 (\a b -> a*x + b)
scanl1 max [3,4,5,3,7,9,2,1] -- 单调增
scanl1 (+) [1..5]
-- 相当于
-- listSum v (x:xs) = let h = v + x in h : listSum h xs
-- listSum 0 [1..5]
map ($2) [(1+), (1-), (1*), (1/)]

-- 函数迭代
take 4 $ iterate (/2) 1 -- [1.0,0.5,0.25,0.125]
iter f n x = reverse $ scanr ($) x $ replicate n f
iter (/2) 3 1 -- [1.0,0.5,0.25,0.125]

-- stupid implementation of fibonacci
fib 0 = [0]
fib 1 = [0,1]
fib n = scanl1 (+) $ 0:1:fib(n-2)

-- sum_(k >= 1, k odd, k^2 < 10000) k^2
oddSquareSum =
    let oddSquares = filter odd $ map (^2) [1..]
        belowLimit = takeWhile (<10000) oddSquares
    in sum belowLimit

-- hello world
print "hello"
putStrLn "hello"

-- add numbers
add a b = a + b
main = do
    a <- readLn
    b <- readLn
    let sum = add a b
    print sum

-- hello world * 3
putStr $ foldl (++) "" $ replicate 3 "hello\n"

-- hello world * n
hello 0 = return ()
hello n = do
    putStrLn "Hello World"
    hello (n-1)

--- taylor expansion of exp function
coef = map (\x -> 1/x) $ scanl1 (*) [1..9]
poly x = foldr1 (\b a -> a*x + b)
myexp x = poly x (1:coef)
