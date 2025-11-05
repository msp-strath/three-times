/* =============================================================================

   Imperative Programming

   =============================================================================

   At its core Dafny is an imperative programming language. Lets look at what
   that means.

   We will cover:

   + The Main method, the main entry point to running Dafny programs.
   + Assigning variables, and control flows
   + Writing a method that doubles a number, and displays the number to STDOUT.
   + Sequences.
 */

/*
   This is the `Main` method, when we run programs this is the first code
   executed.

   Notice how the name is capitalised. This is an important convention in Dafny.
   All *method* names should be in this form.
 */
method Main()
{
  // Methods are impure, they can execute code that can fail.
  // For example take the following code to print the string "Hello World".
  // Printing *can* fail if the computer runs out of memory.

  print "Hello world!";

  /*                  ^ notice the semi colon

     Print is a core method in Dafny, and methods in Dafny are written in the
     imperative style. Methods need to be sequenced and the semi colon enables
     how statements are sequenced.

     Let's look at other statements.
   */

  // Binding variables:

  // Here we bind the identifier 'i' to the integer value '0'.

  var i : int := 0;

  // Remember the RHS of the assignment can be an expression.

  i := 1 + 1;

  /*
     The type annotation `: int` is optional, as long as the compiler can work
     the type of the value. For example:
   */

  var j := 0;

  // [ Note ] This is not always true. Fortunately the compiler will complain.
  /* [ Note ] That assignment is indicated using `:=`, other languages use a
     single colon `:`.
   */

  // While loops:

  i := 0;
  while i < 10
  {
    i := i + 1; // Dafny does not support operations such as `i++`;
    print i, "\n";
  }

  /* For Loops:

     Here is a for look that count downs from 10 to 1.
  */
  for k := 10 downto 1
  {// ^ k is a local integer in this block.
    print k, "\n";
  }

  for k := 1 to 10
  {
    print k, "\n";
  }

  for x := [1,2,3,4,5] {

  }

  // Method calls;

  // We can call methods as follows:
  PrintDouble(1);
}

/* =============================================================================

   Methods

   =============================================================================

 */

/* PrintDouble prints the method parameter 'i', doubled.
 */
method PrintDouble(i : int)
{
  print i + i, "\n";
}

/* Let us now look at returning from methods.

   Here is where Dafny differs from regular languages, Dafny requires us
   to *name* the return variables. We do so, as when we write specifications
   we need to refer to the returned variable.

   For example:
*/

method Double(i : int)
  returns (j : int)
// ^ returns is the keyword and `j` is the name of the return argument.

/* [ NOTE ]

   We haven't provided a method body.
   Methods without a body are called 'prototype' methods.

 */

/* Let us now look at writing `DoubleAgain`.
 */
method DoubleAgain(i : int)
  returns (j : int)
{
  return i + 1;
  /* ^ The `return` keyword indicates the point in the control flow when we return
     values.
   */
}

/* Interestingly Dafny does not need us to be that explicit.

   The named return variable is a valid identifier in your method body!
 */
method DoubleAgainAgain(i : int)
  returns (j : int)
{
  j := i + 1;
}

/* =============================================================================

   Decisions using Conditional

   =============================================================================

 */

method IsPositive(i : int)
  returns (b : bool)
{
  if i >= 0
  {
    return true;
  }

  return false;
}

method IsPositiveAgain(i : int)
  returns (b : bool)
{
  if i >= 0
  {
    return true;
  } else {
    return false;
  }
}

// Note we can simple write this method as:
method IsPositiveAgainAgain(i : int)
  returns (b : bool)
{
  return i >= 0;
}

/* =============================================================================

   Sequences

   =============================================================================

   We end this brief tour by looking at sequences.

   Dafny also supports arrays and sets with similar builtin operations and
   syntax.

   Sequences has type: `seq<T>`, where `T` is a type parameter denoting the type
   of elements within the sequence.

   You can think of sequences as linked lists.
 */

method SequencesIntro()
{
  var xs : seq<string> := ["A", "BB", "CCC"];
  // Here we have defined a sequence of three strings.

  print xs[0], "\n"; // we index sequences using `[` `]`.

  xs := xs + ["DDD"];
  // The unary operator `+` denotes sequence append.

  // Dafny also supports slicing of sequences.
  // For example, we can obtain the tail of a sequence as:

  var tail := xs[1..];

  // For this course, the best way to iterate over sequences are through loops,
  // for and while;

  for i := 0 to |xs| // <- here |xs| is used to get the size of a sequence.
  {
    print xs[i], "\n";
  }

  // or
  var j := 0;
  while j < |xs|
  {
    print xs[j], "\n";
    j := j + 1;
  }
}

/* =============================================================================

   Generics

   =============================================================================

   Dafny also supports generics.

 */
method Append<T>(xs : seq<T>, ys : seq<T>) returns (zs : seq<T>)
{
  zs := xs + ys;
}


// -- [ EOF ]


/* =============================================================================

   Header

   ========================================================================== */

/* [ NOTE ]


 */

/* [ Marker ] ==================================================================
   [ Marker ] =============================================================== */
