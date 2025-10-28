---
title: "Generic & Higher-Order Programming"
toc: true
---

## About

**Note**
:  -   Python supports interfaces on Objects (Classes).
   -   Dafny supports traits on Objects (Classes) but not datatypes.
   -   Idris supports interfaces (aka typeclasses) on datatypes.

All of these languages supports:

> Higher-Order Functions.

That is,
functions are first class, and can be passed around as arguments.

These questions were design to explore Haskell's use of typeclasses.
We will not ask you to do that here.
Instead, we will ask that you write solutions using higher-order functions.

See the end of this documents for some hint for Python and Dafny.

## Questions

1.  Write a program called `map` which takes as input:

    -   A function `f` which takes a values of type `A` and returns a value of type `B`;
    -   A list,
        `xs`,
        of values of type `A`;

    and returns a list of type `B`.

2.  Write a program called `keep` which takes as input:

    -   A function `f` which takes a values of type `A` and returns a boolean;
    -   A list,
        `xs`,
        of values of type `A`;

    and returns a list of values,
    from `xs`,
    where applying `f` returns `true`.

3.  Write a program called `filter` which takes as input:

    -   A function `f` which takes a values of type `A` and returns a boolean;
    -   A list,
        `xs`,
        of values of type `A`;

    and returns a list of values,
    from `xs`,
    where applying `f` returns `false`.

    As an aside, try write `filter` by reusing your implementation from `keep`.

4.  Using your definition of `filter`,
    write a program that returns the same list as it was given.

5.  Write a program that combines `map` with `keep` such that only the elements which are kept are transformed.

    Your program must take the following inputs:

    -   A function `f` which takes a values of type `A` and returns a boolean;
    -   A function `f` which takes a values of type `A` and returns a value of type `B`;
    -   A list,
        `xs`,
        of values of type `A`;

    Returns a list of values of type `B`

    1.  try writing the program by hand;
    2.  try writing the program using your earlier definitions of `map` and `filter`.

6.  Write a program that applies a transformation,
    and returns the results,
    to all numbers within a given range.

    Your program should take as input:

    -   A function `f` which performs a transformation on a single integer;
    -   A tuple/pair representing a range with a lower and upper bound in the first and second position;

    Your program should return a list of integers;

    1.  try writing the program assuming the range is correct;
    2.  rewrite your program so that invalid ranges cause the program to fail safely;

7.  Write a program that:
    1.  Given the following two functions/methods descriptions:

        -   `f` that takes a value of type `A` and returns a value of type `B`;
        -   `g` that takes a value of type `B` and returns a value of type `C`;

        Write program `h` that given an element of type `A` and functions `f` and `g` as arguments,
        returns a value of type `C`.

    2.  Using `h`,
        write a program that takes as input:

        -   `f` a function that takes a value of type `A` and returns a value of type `B`;
        -   `g` a function that takes a value of type `B` and returns a value of type `C`;
        -   a List of `A`

        returns a list of values of type `C`

8.  Consider the following Python code that finds the largest value in a list.

    ```{.python}
    def memax(xs : list[int]) -> int:
        return helper(0,xs)

    def helper(start : int, xs : list[int]) -> int:
        if len(xs) == 0:
            return start;

        head = xs[0]
        tail = xs[1:]
        if start >= head:
            return helper(start,tail)

        return helper(head, tail)
    ```

    `memax` assumes that the largest value must be larger than zero,
    and uses `helper` to perform the calculation.

    Within Python,
    this forces `memax` to only work on values that can be compared to `0`.

    1.  Rewrite `memax` and `helper` so that the programs do not know *a priori* what the lowest value a datatype can be.
        -   **Hint:** you will need to extend the arguments for both programs with a function that returns the lowest value.

    2.  Rewrite `memax` and `helper` in Dafny
        (both imperative and functional)
        and using Idris.

9.  When using 'interfaces/typeclasses/traits' we can layer them so that we can define new functionality from existing generic definitions.
    This final question uses these to exercise your programming skills.

    Python and Idris both have builtin support for capturing the 'ordering' of two values.

    Within Python,
    this is the `__lt__` interface which enables on to compare values using the binary operator:
    `<`.
    From `__lt__` we can define other comparison operators such as, `<=`, `>`, `>=`, and `==`.
    We can also provide bespome definitions for them.

    Within Idris,
    we must define an instance of `Ordering` that informs us how two values compare.
    Specifically,
    `compare` returns either `LT`, `EQ`, or `GT`.
    We can also define comparison operation using the result of `compare`

    Dafny does not have support for ordering in its standard library.

    Regardless,
    from a single program we can define many more.

    Wthin Java the base comparison operator for objects
    (`compareTo`)
    returns an integer describing how to values compare.
    Given two values,
    `a` and `b`,
    `compareTo` returns:

    -   **A negative integer:** if `a` is less than `b`;
    -   **Zero:** if `a` is equal to `b`;
    -   **A positive integer:** if `a` is greater than `b`;

    Write programs that,
    given a `compareTo` function,
    compute the following comparisons between two values:

    1.  Less than
    2.  Greater than
    3.  Less than or equal to
    4.  Greater than or equal to
    5.  Equals to
    6.  maximum
    7.  minimum

## Hints

For writing python type hints you will need to import:

```{.python}
from collections.abc import Callable

def apply[A,B](f : Callable[[A],B], x : A) -> B:
  return f(a)

def applyBin[A,B](f : Callable[[A,A],B], x : A) -> B:
  return f(a,a)
```

Higher-Order functions are specified in Dafny as:

```{.dafny}
method applyImp<A,B>(f : (A) -> B, x : A) returns (res : B)
{
  res := f(x);
}

function applyFn<A,B>(f : A -> B, x : A) : B
{
  f(x)
}

method applyBinImp<A,B>(f : (A,A) -> B, x : A) returns (res : B)
{
  res := f(x,x);
}

function applyBinFn<A,B>(f : (A,A) -> B, x : A) : B
{
  f(x,x)
}
```
