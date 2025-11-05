||| =============================================================================
|||
||| Datatypes and Higher Order Functions
|||
||| =============================================================================
|||
||| In this next intro to Idris basics we will cover creating datatypes and lists.
|||
||| Specifically, we will cover:
|||
||| + Creating enumerated types, and datatypes, and records
|||
module Datatypes

import Data.String

{- =============================================================================

   Enumerated Types

   =============================================================================

   Idris, like all functional languages supports algebraic datatypes,
   'sums of products'.  An algebraic datatype where we are creating
   choices between different ways we can say what the datatype is.
-}

-- We begin with the example of a enumerated type to represent different sizes.
data Size
  = Small
  | Medium
  | Large

-- [ Note ]
--
-- Here the keyword `data` indicates that we are creating a new datatype
-- which we have named `Size`.
--
-- The equal sign indicates that we are then to define the datatypes' data
-- constructors, each separated by the pipe symbol `|`.
--
-- For `Size`, these constructors are: `Small`, `Medium`, and `Large`.
--
-- The same as in Dafny!

{- =============================================================================

   Pattern Matching

   =============================================================================

   To deconstruct datatypes we can use case expressions, or pattern
   matching in function equations.

-}

toString : (s : Size) -> String
toString Small  = "Small"
toString Medium = "Medium"
toString Large  = "Large"

-- [ NOTE ]
--
-- Our function now has *multiple equations*, each representing a
-- different pattern in the input.  The same as in Dafny!

||| Here we demonstrate the `case` expression, which is analogous to Dafny's 'match'.
toStringCase : (s : Size) -> String
toStringCase s
  = case s of
      Small => "Small"
      Medium => "Medium"
      Large => "Large"

-- [ NOTE ]
--
-- The keyword `case` indicates we are matching on what `s` could be.
-- Where as Dafny used 'case' to indicate each case, we use 'case'
-- where Dafny used 'match'.
--
-- Unlike Dafny, we do not need to delineate each possible 'case' with
-- the keyword `case`. We do, however, use the 'fat' arrow to show
-- what follows.
--
-- As with Dafny, if we do not want to examine any more cases we can
-- use the wildcard pattern: `_`. Wildcards also work in equations
--
-- For example:

toStringCaseWild : (s : Size) -> String
toStringCaseWild s
  = case s of
      Small => "Small"
      _     => "Do not care"

toStringCaseWild' : (s : Size) -> String
toStringCaseWild' _ = "Do not care"

{- =============================================================================

   Dependent Pattern Matching

   =============================================================================

   `with` constructs are a way of doing pattern matching in Idris when
   dealing with dependent data. We will explain more in Week 3 but
   show the syntax now.

   If fact `case` and `with` are the same, all things considered,

   The difference is that `with` is not an expression, and `with`
   shows us the LHS patterns in greater detail.
-}

toStringDep : (s : Size) -> String
toStringDep s with (s)
  toStringDep s | Small  = "Samall"
  toStringDep s | Medium = "Medium"
  toStringDep s | Large  = "Large"

--  = case s of
--      Small => "Small"
--      _     => "Do not care"


{- =============================================================================

   Datatypes are more than enums

   =============================================================================

   Datatypes in Idris can contain other data, and can be generic.

-}



||| Here is an example of a datatype to capture two shapes, circle and rectangle,
||| and their size.
|||
data Shape
  = Circle Size
  | Rectangle Size
  | Inner Int Shape


-- [ NOTE ]
--
-- As Idris used juxtaposition for function application, when writing
-- simple datatypes like Shape we use the same notation for the data
-- constructor and its contents.
--
-- Constructors can have different arity, and even be inductive.
--

shapeToString : (s : Shape) -> String
shapeToString (Circle x) = "Circle " ++ toString x

-- [ NOTE ]
--
-- We append to strings using `++`, its definition is in `Data.String`.

shapeToString (Rectangle x)
  = "Rectangle " ++ toString x

shapeToString (Inner i x)
  = "Inner " ++ shapeToString x


||| Here is an example of an optional datatype that we can use to capture error
||| states.
|||
||| Within Idris `Optional` is defined as `Maybe`.
data Optional t -- [ NOTE ] type parameters are lower case!
  = Nothing
  | Just t

isJust : (o : Optional t) -> Bool
isJust Nothing  = False
isJust (Just _) = True


-- [ NOTE ]
--
-- wildcards can be within the constructor pattern.


{- =============================================================================

   Lists (aka Sequences) and Simple Higher Order Functions

   =============================================================================

   We end this brief tour by looking at lists, which are 'almost' the
   same as sequences as we have seen from Dafny,

   Lists are represented as an algebraic datatype, you can think of
   sequences as linked lists.

-}

||| Idris already defines ` List` datatype, so let us call ours `Seq`.
data Seq a
   = Empty
   | Extend a (Seq a)

-- We can use pattern matching and recursion to iterate over `Seqs`.
--
-- First we define a way to double integers.

||| Double is a function  to double an integer.
double : (i : Int) -> Int
double i = i + i

||| Now we map over the seq.
mapD : (xs : Seq Int) -> Seq Int
mapD Empty
  = Empty
mapD (Extend x y) = Extend (double x) (mapD y)

||| Functions are first class in Idris, and Dafny, and we can pass
||| them as arguments to other functions.
map : (f  : a -> b)
   -> (xs : Seq a)
         -> Seq b
map f Empty
  = Empty
map f (Extend x y)
  = Extend (f x) (map f y)


||| As a reminder Functions are also generic
append : (xs : Seq a) -> (ys : Seq a) -> Seq a
append Empty ys
  = ys

append (Extend x y) ys
  = Extend x (append y ys)


-- [ EOF ]


{- =============================================================================

   Header

   ========================================================================== -}

{- [ NOTE ]


-}

{- [ Marker ] ==================================================================
   [ Marker ] =============================================================== -}
