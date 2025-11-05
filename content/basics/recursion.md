---
title: "Recursion"
toc: true
---

The control flows we have seen so far,
[loops](/basics/loops.html) and [iterators](/basics/iteration.html),
all rely on control flow statements to perform the repetition.
In this (almost)
last section we look at how we can perform many of the same repetitions using function/method calls.
This is also known as [recursion](/basics/recursion.html).

## Python

Let us look at writing recursive methods in Python.
First we will do so using integers,
and then we will iterate over a list.

We begin by performing multiplication by hand.

```
def times(x : int, y : int) -> int:
    if x == 0:
        return 0

    return y + times(x - 1,y)
```

Key to our implementation are the:

**base case**
:  where we stop performing recursive calls;

**inductive step**
:  where we perform a recursive call;

In our above example:
the base case is when we return `0`;
and
the recursive call is the expression in the second return statement.
The method `times` will continue to call itself,
until the left operand
(`x`)
is `0`.

We can even use this approach to recurse over lists,
by making the list smaller for each recursive call.
The base case being the empty list.
For example,
here we print the elements in a list:

```
def printList(xs : list[int]):
    if len(xs) != 0:
        print(xs[0])
        foo(xs[1:])
```

The method `len` returns the size of `xs`,
and `xs[1:]` is a *slice* that returns the *tail* of the list.
[Sequences](/basics/sequences.html) explains list more.

## Dafny

We can write recursive functions *and* methods in Dafny.

First we demonstrate the functional approach:

```
function times(x : nat, y : nat) : nat
{
  if x == 0
  then 0
  else y + times(x - 1, y)
}
```

Like Python,
we have used a conditional to determine the base case,
and thus the stopping condition.

Here is the 'imperative' approach using methods.

```
method Times(x : int, y : int) returns (result : int)
{
  if x == 0 {
    return 0;
  }

  var step := Times(x - 1, y);
  return y + step;

}
```

Unlike the functional approach,
and unlike Python,
we cannot perform *method* calls in an expression.
We need to side-step the expression and bind the recursive call into an intermediate variable (`step`).


We can even use this approach to recurse over lists,
by making the list smaller for each recursive call.
The base case being the empty list.
For example,
here we print the elements in a list:

```
method PrintList(xs : seq<int>)
{
  if |xs| != 0 {
    print xs[0];
    PrintList(xs[1..]);
  }
}
```

## Idris

Finally,
let us look at recursion in Idris.

```
times : (x : Int)
     -> (y : Int)
          -> Int
times x y
  = if x == 0
    then 0
    else y + times (x - 1) y

```

Like Python and Dafny,
we have used a conditional to determine the base case,
and thus the stopping condition.

We could follow our approach
(using the length)
to recurse over lists.
There is,
however,
in fact a much better way to do so in Idris.
We can use Idris' support for
[pattern-matching](/datatypes/enums.html)
and the idea that lists are
[datatypes](/datatypes.html),
especially a
[union](/datatype/unions.html).

## Coda

We have shown how we can use recursion to iteration over datatypes,
specifically numbers and sequences/lists.
In the next section,
we will look at sequences in a bit more detail.
