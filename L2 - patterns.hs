-- inner most evulation strategy (left-most inner-most, eager, strict) imperative langs
-- square (12-1) -> square 11

-- * will only work of both operands are numbers

-- left-most outer-most (non-strict) Haskell.
-- sqaure (12-1) -> (12-1)*(12-1)

-- if both strategy terminates, then they reach the same result.

-- evaluation strategy can influence efficiency and termination behavior
three :: Int -> Int
three x = 3

nonTerm :: Int -> Int
nonTerm x = nonTerm (x + 1)

-- three(nonTerm 0)
-- will not terminate for inner-most. will terminate for outer-most

-- => if any evaluation terminates, then outer-most evaluation terminates
-- outer-most termination is best possible. often faster. three(f 0), if f takes long to compute.

-- what about square(12 - 1)
-- inner-most 3 steps to get 121
-- outer-most 4 steps to get 121 argument is duplicated

-- Haskell's solution
-- lazy evaluation. left most outer most, if expressions are duplicated,
-- then Haskell keeps track of this, by using references

-- Conditional defining equations
maxi :: (Int, Int) -> Int -- Cartesian product, tuple
maxi (x, y)
  | x >= y = x
  | otherwise = y -- pre-defined function that always returns True
  -- condition is checked from top to bottom

-- Currying (named after Haskell B Curry)
-- plus :: (Int, Int) -> Int
-- plus (x, y) = x + y
plus :: Int -> (Int -> Int) -- takes a number, returns a function
plus x y = x + y

-- Currying, uncurrying
-- plus 2 has type Int -> Int
-- advantages of currying
-- function of arity 2 can already be applied to 1 argument (partial applications)
-- less brackets,
-- Int -> Int -> Int stands for Int -> (Int -> Int) associates to the right
-- plus 2 3 function evaluation associates to the left (plus 2) 3

-- Function definition by pattern matching
und :: Bool -> Bool -> Bool
und True y = y
und False y = False

-- und x y = False -- also can write, evaluated from top to bottom

-- True, False are data constructors of the type Bool
-- every object type Bool can be constructed by the data constructors
-- Data constructors start with capital letters, they are not evaluated further (no defining equations)
-- evaluating und exp1 exp2. check equations from top to bottom, take the first one where the patterns match
-- patterns are expressions built from variables and data constructors

unclear :: Int -> Bool
unclear x = not (unclear x)

-- und False (unclear 0) -- terminates and evaluates to False
-- und (unclear 0) False -- to find out which equation 55 or 56 is applicable, it needs to evaluate unclear 0
-- non terminating
-- if 55 and 56 are swapped, terminates to False
-- pattern x matches to any input, not

-- Pattern matching for List
-- [Bool] -> [] | Bool :[Bool]
-- [a] -> [] | a :[a]
-- data constuctors for list are [] and :
len :: [Int] -> Int
-- do case analysis
len [] = 0
len (x : xs) = 1 + len xs

second :: [Int] -> Int -- second element of the list
second [] = 0
second (x : []) = 0 -- [x]
second (x : y : xs) = y -- write brackets
-- patterns are built from data constructors and variables
-- f x : xs is it (f x) : xs or f (x : xs)?
-- : is infix, function is prefix

-- Pattern Declarations
pin :: Float
pin = 3.1415972

x0, y0 :: Int
(x0, y0) = (1, 2)

x1, y1 :: Int
[x1, y1] = [1, 2]

suc :: Int -> Int
suc = plus 1

-- suc 3
-- plus 1 3
-- 1 + 3
-- 4

-- Local Declarations local to the right hand side
-- roots of polynomial
roots :: Float -> Float -> Float -> (Float, Float)
roots a b c = ((-b - d) / e, (-b + d) / e) where d = sqrt (b * b - 4 * a * c); e = 2 * a

-- Advantage
-- d and e are computed only once

main = do
  print (plus 2 3)
  print (und False True)
  print (len [15, 70, 36])
  print (suc 3)
