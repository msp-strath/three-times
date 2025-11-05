||| =============================================================================
|||
||| Effects
|||
||| =============================================================================
|||
||| We will end the tour by looking at interacting with the real world.
|||
||| We have named this section `Effects`, `Effects` actually means
||| something special in functional programming relating to real world
||| interactions.  We may touch upon later in the course. Here we mean
||| interacting with the world.
|||
||| You will not need to know how to interact with the real world for this course.
|||
||| We provide a small example as it does appear in the project subb
||| for the assignment, but we take care of its use for you.
|||
module Effectful

{- =============================================================================

   Main programs

   =============================================================================

  We begin by looking at the 'Main' program.
-}


||| This is the `Main` function, when we run programs this is the
||| first code executed.
main : IO ()

-- [ NOTE ]
--
-- That the type signature is `IO ()`. This means that we are in the IO (Input/Output) computation context and we are returning the Unit type.

main = printLn "Hello"

-- [ NOTE ]
--
-- The type signature for `printLn` is: `String -> IO ()`

{- =============================================================================

   IO Cpntexts

   =============================================================================

   The `IO` computation context enables reasoning about interacting
   with the outside world in a purer way.  Things can go wrong, but IO
   helps us sequence computations gracefully and purely.

   Let's see that in action.

-}

||| Double is a function in the `IO` computation context.
|||
||| To insert values/expressions into the context we use `pure`.
|||
||| Whilst you might think of it as being rhe same as `return` from
||| imperative program, `pure` is different.
double : Int -> IO Int
double i = pure (i + i)

||| Do notation enables us to sequence computation contexts.
|||
||| let binding has slightly different syntax.
|||
||| So does accessing the result of computations.
foo : IO ()
foo = do printLn "Hello"
         printLn "World"
         let x = "Foobar"
         printLn x
         i <- double 1
         pure ()

-- [ NOTE ]
--
-- `<-` is pronounced 'bind'.
--
-- You cannot store the result of a computation in a let.


-- [ EOF ]


{- =============================================================================

   Header

   ========================================================================== -}

{- [ NOTE ]


-}

{- [ Marker ] ==================================================================
   [ Marker ] =============================================================== -}
