f = (2 +) -- function from int to int

-- \ pat1 pat2 -> exp Lambda expression
-- \ is supposed to be the lambda symbol
-- is a function that maps the arg pats to the result exp

g = \x -> 2 * x -- is the double function
-- Type of function:
-- type_1 -> type_2 ... -> type_n -> type

plus x y = x + y

-- same as
-- plus = \x y -> x + y
-- plus x = \y -> x + y

-- Patterns are special expressions to describe the forms of expected arguments
-- Pattern matching is the process to find out whether patterns correspond to the actual argument of a fn
len :: [Int] -> Int
len [] = 0
len (x : xs) = 1 + len xs

append :: [Int] -> [Int] -> [Int]
append [] ys = ys
append (x : xs) ys = x : append xs ys

-- predefined as ++ in Haskell. [0,1] ++ [2,3] = [0,1,2,3]

-- len (append [1] [2])
-- to find out whether len's first equation matches, one has to evaluate the argument
-- but only a few steps, until we know whether its result starts with [] or : (patterns of the len fn)
-- lazy evaluation. left most outer most
-- [1] is shorthand for 1 : [], evaluate append one step
-- len (1 : append [] [2]) -> for sure the result will start with 1, not the empty list
-- = 1 + len(append [] [2])

zeros :: [Int]
zeros = 0 : zeros -- infinite list of zeros

f :: [Int] -> [Int] -> [Int]
f [] ys = [] -- checks if one argument is empty
f xs [] = []

-- f [] zeros = [] is terminating. outermost evaluation
-- f zeros [] = f (0 : zeros) [] = [] is also terminating
-- matches the second declaration after one step of evaluation

-- Patterns are roughly expressions from data constructors and variables
-- but no variable may occur twice on the lhs of the fn declaration
-- called Linear patterns
-- e.g.
-- equal :: [Int] -> [Int] -> Bool checks if two lists are equal
-- equal xs xs = True
-- equal xs (x : xs) = False
-- what about equal zeros zeros
-- equal zeros zeros = True
-- equal zeros zeros =  equal zeros (0 : zeros) = False, although first evaluation strategy is not in Haskell
-- The result will depend on the evaluation strategy, so not allowed

-- 1.1.3 Patterns
-- var
square x = x * x

-- matches any value, instantiates var by the valye
-- square 5 = 5 * 5

-- joker pattern _ also matches any value, but not variable instantiation
und True y = y
und _ _ = False -- two occurences of _ may match different values
-- by the time reach second line, doesn't matter what the arguments are
-- und False True = False

-- integer, float, char, string pattern
-- match just themselves, no variable instantiation
is_7 7 = True -- matches 7 and nothing else
is_7 _ = False

-- (constr pat1 ... patn) constr is a data constructor
-- matches (constr t1 .. t2) if pat1 matches t1 ... patn matches tn
f (x : 1 : xs) = True -- built from data constructor :
f _ = False

-- [pat1 ... patn] matches all lists [t1 ... tn] if pat1 matches t1, ..., patn matches tn
has_length_three [_, _, _] = True
has_length_three _ = False

-- (pat1, ... ,patn) matches tuple (t1, ..., tn) if pat1 matches t1, ..., patn matches tn
maxi (0, y) = y
maxi (x, 0) = x
maxi (x, y) = 1 + maxi (x - 1, y - 1)

-- no defined functions in patterns
-- only constructors
-- else need to check for semantic equality, which can be inefficient
-- pattern matching should be decidable

-- 1.1.4 Types
-- set of similar values
-- e.g. Bool, Int, [Int], Int -> Bool

-- tyconstr type constructor of arity n (works on n given, predefined types)
-- tyconstr type1 ... typen
-- Pre-defined type constructors: Bool, Int, Float, Char (arity 0, apply to 0 arguments, and is already a type)
-- strings starting with capital letter, like data constructors
-- but data constructors create data objects
-- type constructors create types
und :: Bool -> Bool -> Bool
-- not, und :: True -> True -> True
-- not und Bool Int

-- [typek] is of type list with elements of typek
-- [] is a pre-defined type constructor of arity 1

-- (typea -> typeb) if of type function from typea to type2
-- -> is a type constructor of arity 2

-- (type1, ... ,typen) is of type tuple where first element has type1, ...
-- () is a type constructor of arbitrary arity

-- var is also type variable
-- string of lower case symbol, same syntax as for object variables
-- Concept of Parameteric Polymorphism
-- one function implementation can be used for arguments of different types
-- typical for functional programming

-- Adhoc polymorphism
-- different function implementations (with the same function name) used for arguments of different types
-- typical for OOP

-- Haskell has both, Haskell developers helped with Java5, since Java includes Parameteric polymorphism (generic type)

id :: a -> a -- a stand for arbitary type
id x = x

-- id 5 = 5
-- id True = True
-- id square = square

-- Type variable can be instantiated by arbitary type
len :: [a] -> Int
len [] = 0
len (x : xs) = 1 + len xs

-- usable for list of any type

-- append :: [a] -> [a] -> [a]
(++) :: [a] -> [a] -> [a]
[] ++ ys = ys
(x : xs) ++ ys = x : (xs ++ ys)

-- A function of type1 -> type2
-- can be applied to argument of type
-- if there exist an instantiation of \sigma of the type variables
-- such that \sigma(type1) = \sigma(type) --> called unification
-- Result the has type \sigma(type2)

main = do
  print (g 3)
  print ((\x y -> x + y) 2 3)
  print (len (append [1] [2]))
  print (zeros)
