/* =============================================================================

   Functional Programming

   =============================================================================

   Dafny specifications are written as functional programmes, you can also write
   your code functionally as well. There are, however, fundamental differences
   between the functional and imperative style that are important for
   programming in Dafny.

   In this file we will cover:

   + Expressions
   + Functions
   + Recursion

 */

/* =============================================================================

   Make Expressions Not Statements

   =============================================================================

   Imperative code requires statements and statements contain expressions in a
   few, key places (RHS when creating variables, test position of conditionals,
   et cetera).

   Functional programs are *expression* based, and pure.

   Purity means that our code is 'side-effect' free, and we cannot interact with
   the outside world.

   [ Note ]

   We will see in Idris that you can interact with the outside world in a pure
   language, but the reasons why are outside the scope of this course.

   Let us see the difference between imperative and functional programming with
   a simple program that uses conditionals.
 */

/*
   Here is the imperative method for testing is an integer is positive.

   Notice that there is no else branch.
 */
method IsPositive(i : int)
  returns (b : bool)
{
  if i >= 0
  {
    print "False\n";
    return true;
  }
  print "False\n";
  return false;
}

// Here is the prototype for a functional equivalent.

function myFunctionalTest(i : int) : bool
/*
   Function prototypes are indicated by the keyword 'function' and take in
   parameters like methods.

   Functions differ from methods in that the return type is indicated with an
   annotation, and that the return type cannot be bound.

   Moreover, convention requires that functions be named with a leading lower
   case letter.

   Although you can use the same convention as names for methods, Dafny may
   infer the name to be a special function called a ghost function. You do not
   need to know about ghosts for now.

   Let us now write a body.
 */

function myFunctionalTestWithBody(i : int) : bool
{
  if i >= 0
    then true
    else false
}
/* [ Note ]

   We have to provide both cases in the conditional explicitly.
   Expressions mean that we have to consider both cases.

   We also cannot use any statements in expressions!

   There are also no semi colons;

   We cannot print, use while loops or for loops!

   For 'looping' we need to use recursion.
 */

/* =============================================================================

   Recursion Basics

   =============================================================================

   Let us look at writing recursive functions.

   First we will do so using natural numbers (integers that are always positive).
   Second we will iterate over a sequence.
 */

/*
   Here is a function that multiplies two natural numbers together by adding the
   parameter `y`, `x` times.

 */
function times(x : nat, y : nat) : nat
{
  if x == 0 // if we have no more `x`s then stop, this is the base case.
  then 0
  else y + times(x - 1, y) // here is the recursive call.
  //             ^ [ Note ] that we are decreasing `x` for each call.
}

// Let us now turn to sequences.

/*
   Double `xs`
 */
function double(xs : seq<nat>) : seq<nat>
{
  if xs == [] // if the input is empty then stop, this is the base case.
  then []
  else [(xs[0] * 2)] + double(xs[1..])
     // Double the head of the list, and append the doubling of the tail.
}

// Functions are also generic
function append<T>(xs : seq<T>, ys : seq<T>) : seq<T>
{
  xs + ys
}


/* =============================================================================

   Expressions belong in statements

   =============================================================================

   It is important to remember that expressions (and the functional fragement)
   of Dafny also belong in statements.

 */

method ExprInStmt() returns (zs : seq<int>)
{
  return append([1,2,3], [4,5,6]);
}
// -- [ EOF ]


/* =============================================================================

   Header

   ========================================================================== */

/* [ NOTE ]


 */

/* [ Marker ] ==================================================================
   [ Marker ] =============================================================== */
