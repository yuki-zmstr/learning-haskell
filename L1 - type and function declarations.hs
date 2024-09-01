{- this is a comment -}
-- this is another comment

-- type declaration
a :: Int = 2

square :: Int -> Int
{-
Int, Bool, Double, Char
Int -> Int
[Int]
[Int] -> Int
[[Int]]
[Int -> Int]
-}

-- type declarations do not have to be written by the programmer.

-- Function declaration
square x = x * x -- pattern (x) special expression describing expected arguments.
{- Basic operations pre-defined: +, -, *, ==, >=, <, not, &&, || -}
-- Evaluation by term rewriting
-- find sub expression in input st it matches the lsh of some predefined equation, instantiates variable in the defining equation
-- replace expression by the corresponding instantiated rhs.