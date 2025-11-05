||| =============================================================================
|||
||| Higher Order Functions
|||
||| =============================================================================
|||
||| We will now take a brief look at Higher Order functions, many of which are
||| defined in Idris' standard library for common datatypes
|||
module HoF

{- =============================================================================

   Maps

   =============================================================================

   We begin by looking at maps
-}

||| Functions are first class in Idris, and Dafny, and we can pass
||| them as arguments to other functions.
map : (f  : a -> b)
   -> (xs : List a)
         -> List b
map f []
  = []

-- [ NOTE ]
--
-- `[]` is the empty list.

map f (x :: xs)
  = f x :: map f xs

-- [ NOTE ]
--
-- `::` is extending the list.


{- =============================================================================

   Filter

   =============================================================================

   Next are filters
-}


filter' : (f : a -> Bool) -> List a -> List a
filter' f []
  = []

-- [ NOTE ]
--
-- The above is the base case.

filter' f (x :: xs)
  = if f x
    then filter' f xs
    else x :: filter' f xs

-- [ NOTE ]
--
-- Drop the elements that do not return true.

{- =============================================================================

   Anonymous Functions

   =============================================================================

   Functions are first class, but also can be defined anonymously.

   For example:
-}

||| Filter all ints less than two.
filterLT2 : (xs : List Int) -> List Int
filterLT2 xs = filter' (\x => x < 2) xs


||| Find the value that matches the key.
find : (f : k -> Bool) -> (xs : List (k,v)) -> Maybe v
find f []
  = Nothing

find f ((k,v) :: xs) with (f k)
  find f ((k,v) :: xs) | False
    = find f xs
  find f ((k,v) :: xs) | True = Just v


-- [ EOF ]


{- =============================================================================

   Header

   ========================================================================== -}

{- [ NOTE ]


-}

{- [ Marker ] ==================================================================
   [ Marker ] =============================================================== -}
