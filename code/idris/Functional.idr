||| =============================================================================
|||
||| Functional Programming
|||
||| =============================================================================
|||
||| Idris is a functional programming language.
|||
||| In this file we will cover:
|||
||| + Expressions
||| + Functions
||| + Recursion
module Functional

{-
   =============================================================================

   Make Expressions Not Statements

   =============================================================================

   Imperative code requires statements and statements contain expressions in a
   few, key places (RHS when creating variables, test position of conditionals,
   et cetera).

   Functional programs are *expression* based, and pure.

   Purity means that our code is 'side-effect' free, and we cannot interact with
   the outside world.

   Let us see the difference between imperative and functional programming with
   some simple functions.
-}

||| Here is our first function, named `i` that returns an integer.
|||
||| Note that types are capitalised in Idris.
|||
||| Functions consist of type signatures: `i : Int`, and type bodies `i = 1`.
i : Int
i = 1

-- [ NOTE ]
--
-- you might think that the body `i = 1` is an assignment. It is note,
-- it represents an equation. With the Left Hand Side being `i`, and
-- the Right Hand Side being `1`.

-- Now let us look at conditionals.

myFunctionalTest : (i : Int) -> Bool

-- [ NOTE ]
--
-- Dafny has function prototypes, Idris has type signatures and these
-- type signatures are naturally disconnected from bodies. Within
-- Dafny they are intrinsically linked.
--
-- Within Idris, the signature is everything after the type
-- annotation `:`.
--
-- That is, the type of
-- `myFunctionalTest` is `(i : Int) -> Bool`.
--
-- Unlike other functional languages, Idris enables us to name
-- arguments.
--
-- Idris convention is that functions used at the value level are
-- named with a leading lower case letter. It is a good idea to use
-- capitalised function names for functions at the type-level where
-- possible. We will get into the difference between type and value
-- level in Week 3.
--
-- Let us now write a body.

myFunctionalTest i
  = if i >= 0
         then True
         else False

-- or

myFunctionalTest2 : Int -> Bool
myFunctionalTest2 i = (i >= 0)

-- [ Note ]
--
-- We have to provide both cases in the conditional explicitly.
-- Expressions mean that we have to consider both cases.
--
-- As Idris is functional, there are no expressions!
--
-- This means, no semi colons as well nor printing, or while loops or
-- for loops!
--
-- For 'looping' we need to use recursion, and for printing we need
-- computation contexts!

{- =============================================================================

   Let bindings

   =============================================================================

   Let us take a brief interlude and look at Let-bindings.

   The function definitions we have seen are global, let bindings are
   local and can be chained.

-}

myFunctionalTest3 : Int -> Bool
myFunctionalTest3 i
  = let foo = 3 in
    let bar = 6 in
    let res = (i >= 0) in res


{- =============================================================================

   Recursion Basics

   =============================================================================

   Let us look at writing recursive functions.

   First we will do so using natural numbers (integers that are always positive).
   Second we will iterate over a sequence.
-}

||| Here is a function that multiplies two integers numbers together by adding the
||| parameter `y`, `x` times.
times : (x : Int)
     -> (y : Int)
          -> Int
times x y
  = if x == 0 -- if we have no more `x`s then stop, this is the base case.
    then 0
    else y + times (x - 1) y -- this is the recursive case, where we decrease
                             -- x by one for each call.

-- [ NOTE ]
--
-- Whilst imperative languages present method calls as `times(x,y)`,
-- Haskell-style functional languages use 'juxtaposition'.
--
-- So when you see
--
-- ```
-- times (x - 1) y
-- ```
--
-- this is the same 'idea' as:
--
-- ```
-- times(x - 1, y)
-- ```
--

-- [ NOTE ]
--
-- That for each argument in our function, the function body (the
-- equation) requires the same number of names. That is, unless we are
-- doing partial application, which is outside the basics.
--

{- =============================================================================

   Lists (aka Sequences)

   =============================================================================

   We would end this brief tour by looking at lists, which are 'almost' the
   same as sequences as we have seen from Dafny,

   Lists in Idris are, however, represented as an algebraic
   datatype. To understand how lists work, we need to know how algebraic datatypes work.
   We will do that in the next file.

-}

-- [ EOF ]


{- =============================================================================

   Header

   ========================================================================== -}

{- [ NOTE ]


-}

{- [ Marker ] ==================================================================
   [ Marker ] =============================================================== -}
