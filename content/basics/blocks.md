---
title: "Functions and Methods"
toc: true
---

So far we have looked at
[binders](/basics/binders.html),
[expressions](/basics/expressions.html),
and [basic control flow](/basics/conditionals.html).
Before we go deeper into the basics,
let us look at how we can create methods and functions.
Blocks of code that we call.


## Python

We saw our first method when [Writing Hello](/hello/writing.html).
Methods are units of *impure* computation;
they can execute code that can fail.
And we use methods to structure our code.

For example,
take the following code to print the string "Hello World".
(Our example when [Writing Hello](/hello/writing.html).)

```
def main():
    print("Hello World!");
```

Printing *can* fail if the computer runs out of memory.
Or,
if we were performing file operations then files may not exist.

Methods contain statements,
and these statements need to be sequenced.
Within imperative languages,
the semi-colon enables statements to be sequenced.

That being said,
sequencing is so pervasive that within Python,
we do not need to include them.

For example,
consider the following main method that binds a variable,
doubles the variable, and prints the result.

```
def main():
    x = 1;
    y = x + x;
    print(y);
```

Here each statement,
the two binders and the print,
are sequenced using `;`.

Methods also take parameters
(also known as arguments).
For example,
`printDouble` will print the parameter 'i', doubled.

```
def printDouble(i : int):
    """Prints the method parameter 'i', doubled.
    """
    print(f"{i + i}")
```

Within Python,
parameters *must* be named, with type hints optional.
By default,
parameters in python are positional.
Python also enables parameters to be positioned using a ['keyword'](https://docs.python.org/3/glossary.html#term-argument).
Further,
python supports default arguments.

::: important
We do not expand more on keyword and default arguments.
:::


Let us now look at returning from methods,
as all methods must return something.
For `printDouble`,
it returns the unit value as

```
def printDouble(i : int):
```

is really short for:

```
def printDouble(i : int) -> None:
```

Here the arrow (`->`) indicates that type of the data we are returning.
For example,
here is the definition of the method `double`,
which doubles the provided integer.

```
def double(i : int) -> int:
    return i + i
```

The `return` keyword indicates that we are returning a value.

If we wish to use `double`,
a method call must be performed.
For example:

```
def main():
  i = double(1)
  print(i)
```

## Dafny

We saw our first method when [Writing Hello](/hello/writing.html).
Methods are units of *impure* computation;
they can execute code that can fail.
And we use methods to structure our code.

For example,
take the following code to print the string "Hello World".
(Our example when [Writing Hello](/hello/writing.html).)

```
method Main()
{
    print "Hello World!";
}
```

Printing *can* fail if the computer runs out of memory.
Or,
if we were performing file operations on files that do not exist.

Methods contain statements,
and these statements need to be sequenced.
Within imperative languages,
the semi-colon enables statements to be sequenced.
Unlike Python,
semi-colons are *explicitly required*.
For example,
consider the following main method that binds a variable,
doubles the variable, and prints the result.

```
method Main()
{
  var x := 1;
  var y := x + x;
  print y;
}
```

Here each statement,
the two binders and the print,
are sequenced using `;`.

Methods also take parameters
(also known as arguments).
For example,
`PrintDouble` will print the parameter 'i', doubled.

```
method PrintDouble(i : int)
{
  print i + i, "\n";
}
```

Within Dafny,
parameters *must* be named and type annotations are required.

Let us now look at returning from methods,
as all methods must return something.

Consider the method prototype `Double`:

```
method Double(i : int)
  returns (j : int)
```

Here is where Dafny differs from regular languages,
Dafny requires us to *name* the return variables.
We do so,
as when we write specifications we need to refer to the returned variable.

::: note
We haven't provided a method body.
Methods without a body are called 'prototypes'.
:::

Let us now provide the body:

```
method Double(i : int)
  returns (j : int)
{
  return i + i;
}
```

The `return` keyword indicates that we are returning a value.

If we wish to use `double`,
a method call must be performed.
For example:

```
method Main()
{
  var i = Double(1)
  print i;
}
```

Interestingly Dafny does not need us to be that explicit.
The named return variable is a valid identifier in your method body!

```
method Double(i : int)
  returns (j : int)
{
  j := i + 1;
}
```

Freaky!

## Functional Dafny.

Let us recap imperative Dafny but functionally.

Functions in Dafny differ from methods in that they are *pure*,
cannot interact with the outside world,
and can only contain expressions.

Function prototypes are indicated by the keyword 'function' and take in
parameters like methods.
Moreover,
convention requires that functions be named with a leading lower
case letter.


```
function double(i : int) : int
```

Although you can use the same convention as names for methods,
Dafny may infer the name to be a special function called a ghost function.
You do not need to know about ghosts for now.

Remember,
prototypes are specifications.
Let us now provide a body.
A function with a body is:

```
function double(i : int) : int
{
  i + i
}
```

As with methods we can also name our return type!
To support reasoning about the function's operation.

```
function double(i : int) : (result : int)
```

Importantly,
we cannot bind to this named return type.

::: exercise
What happens when you compile this:

```
function double(x : int) : (i : int)
{
  i := x
}
```
:::


If we wish to use `double` and `Double`,
we need to perform a function/method call.
For example:

```
method Main()
{
  var i := Double(1);
  var j := double(2);
}
```

::: important
Even though the right-hand side of a binding requires an expression,
and that method calls *are* expressions,
method calls in Dafny cannot be performed anywhere else!

Function calls can...
:::


## Idris

Let us now look at Idris,
that only supports functions.

Here is our first function,
named `i`,
that returns an integer.


```
i  Int
i = 1
```

Note that types are capitalised in Idris,
and that functions consist of type signatures:
`i : Int`,
and type bodies `i = 1`.


You might think that the body `i = 1` is an assignment.
It is not,
it represents an equation.
With the Left Hand Side being `i`,
and the Right Hand Side being `1`.

We will see,
when dealing with
[enums](/datatype/enums.html)
and
[datatypes](/basics/sequences.html)
that functions can support many equations.

Now let us look at type signatures.
Dafny has function prototypes,
Idris has type signatures and these type signatures are naturally disconnected from bodies.
Within Dafny and python they are intrinsically linked.

Within Idris, the signature is everything after the type
annotation `:`.

```
myFunctionalTest : (i : Int) -> Bool
```

That is,
the type of `myFunctionalTest` is `(i : Int) -> Bool`.

Unlike other functional languages,
however,
Idris enables us to name arguments.

Idris convention is that functions used at the value level are named with a leading lower case letter.
It is a good idea to use capitalised function names for functions at the type-level where
possible.
We will get into the difference between type and value levels in Week 3 of CS886.

Let us now write a body.

```
myFunctionalTest i
  = if i >= 0
         then True
         else False
```

We end with function calls.
Consider the following function:

```
times : (x : Int)
     -> (y : Int)
          -> Int
```

Whilst imperative languages present method calls as `times(x,y)`,
Haskell-style functional languages use 'juxtaposition'.

We can call `times` as follows:

```
times (x - 1) y
```

this is the same 'idea' as:

```
times(x - 1, y)
```

That for each argument in our function,
the function body
(the equation)
requires the same number of names.
That is,
unless we are doing partial application---which is outside the basics.

## Coda

In this section we have had a quick look at methods and functions.
The key difference between the two is that methods are impure,
functions are pure.

Both Python and Idris have more interesting aspects to methods and functions.
For python,
this is keyword and default arguments together with variadic arguments.
For Idris,
this includes implicit arguments and default arguments.
All of which is outside the scope of the course.

Now that we know how to divide our programs into blocks,
the next section begins our deeper look at what we can do inside those blocks.
