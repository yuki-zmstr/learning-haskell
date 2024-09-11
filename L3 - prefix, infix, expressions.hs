-- Haskell is sensitive to layout of program text
-- Offside-rules for layout of programs
-- 1) The first symbol in a sequence of decls determines the leftmost column of this decl block
-- 2) A new line starting in the same column is a new declaration belonging to the same decl block
-- 3) A new line starting further right continues the declaration in the line above
-- 4) A new line starting further left means the decl block has ended, and the new line does not belong this block

-- roots a b c = ((-b - d) / e, (-b + d) / e)
--   where
--     d = sqrt (b * b - 4 * a * c)
--     e = 2 * a

-- operators and infix Declarations
plus x y = x + y

-- prefix defined function: string starting with lower case letter
-- prefix data constructor: string starting with upper case letter
-- infix defined function: string of special symbols, not starting with colon
-- infix data constructor: string of special symbols, starting with colon, like 1 : [2,3]

-- Turn infix to prefix symbols, write brackets, like (+)
-- Turn prefix to infix symbols, write backticks, like `plus`

-- Defining infix-symbols, Association, Binding Prority
-- 1) Association
divide :: Float -> Float -> Float
divide x y = x / y

infixr 9 `divide` -- Associates to the right, others infixr and infix

-- 2) Binding Priority
-- %% infix operator
(%%) :: Int -> Int -> Int
x %% y = x + y

(@@) :: Int -> Int -> Int
x @@ y = x * y

-- 1 %% 2 @@ 3 is 9 or 7?
-- binding priority is between 0 and 9, 9 is default

infixl 9 %%

infixl 8 @@

-- If two operators have the same priority, then execution is from left to right

-- Expressions
-- every expression has a type and a value
-- to evaluate an expression,
-- 1) first the compiler checks whether the expression is well-typed
-- 2) then the expression is evaluated
-- Haskell expressions
-- var
-- constr True, :, [] <- exception, not a string starting with a capital letter, but still a data constructor
--    this remain unevaluated
-- integer 0, 1, -1, Type is Int (32 bits), Integer (arb bits)
-- float 0.990, -2.5, 3.4e+23, Type is Float, Double
-- char 'a', '0', '\n', Type is Char
-- [exp1, ..., expn] list of n expressions, all exp must have the same type a -> then has the type [a]
-- [0, 1, 2] is an abbreviation of 0 : 1 : 2 : [] (colon associates to the right)
-- string ['h', 'e', 'l', 'l', 'o'] can be written as "hello", Type is String = [Char]
-- len "hello" = 5 (<- len [] = 0; len (x: xs) = 1 + len(xs))
-- (exp1, ..., expn) <- Tuple of expressions, expressions can have different type
-- has the type (a1, a2, ..., an)
-- eg (10, True) has the type (Int, Bool)
-- (10) is the same as 10
-- () has type () <- the empty tuple type, singleton type with only one element
-- (()) = (), Type ()
-- ((),()) has Type ((),())

-- (exp1 exp2 ... expn) expression written beside each other
-- Function application exp1 is applied to exp2, result is applied to exp3, ...

-- if exp1 then exp2 else exp3
-- exp1 Type Bool, exp2 and exp3 have same (arbitary) type

maxi (x, y) = if x >= y then x else y

-- let decls in exp
-- means decls are local decls only visible in exp (like 'where')
-- local declarations override declarations outside

roots a b c =
  let d = sqrt (b * b - 4 * a * c)
      e = 2 * a
   in ((-b - d) / e, (-b + d) / e)

-- list concatenate [1,2] ++ [3,4,5] = [1,2,3,4,5]
-- tuple concatenate (1,2) (3,4,5) have different types, no predefined operator

-- case exp
--     of pat1 -> exp1
--        pat2 -> exp2
--     ...
--        patn -> expn
-- check if pat1 matches exp, if yes, then exp1
-- otherwise, move on
-- if no pattern matches, get error
-- can use _ -> exp as default expression
und x y = case x of
  True -> y
  False -> False

-- und x y = if x then y else False

main = do
  print (roots 1 3 2)
  print (plus 2 5)
  print ((+) 2 3)
  print ((:) 1 [2, 3])
  print (2 `plus` 6)
  print (36 `divide` 6 `divide` 2)
  print (1 %% 2 @@ 3)