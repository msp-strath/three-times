---
title: "Iterating over Data"
toc: true
---

Loops enable code to be repeated whilst a condition
(the test)
holds.
Another form of code repetition is through iteration,
when we examine the values in a data structure in turn.
(Also known as *For* loops and *Foreach* loops.)
Common datatypes that we can iterate over are numbers and
[sequences](/datatypes/sequences.html)
(lists).
We can,
however,
iterate over other
[datatypes](/datatypes.html).

## Python

Within Python,
we can iterate over numbers by establishing a range of numbers to iterate over.
In effect,
we are iterating over a list.

For example,
to sum the numbers between 0 and 100 we can iterate over the given interval.

```
result = 0
for i in range(1,100):
  result += i
```

The method `range` lazily computes the list,
and `i` is a variable local to the iterator's body.

We can even do the iteration in 'reverse' by stepping down.

```
result = 0
for i in range(1,100,-1):
  result += i
```

We can even use `for` as a `foreach` loop to explicit each element in a list.

```
xs = [1,2,3,4,5,6]
for x in xs:
   print(x)
```

## Dafny

Within Dafny,
like Python,
we can iterate over numbers by establishing a range of numbers to iterate over.
In effect we are,
again,
iterating over a list.
Dafny differs from Python as range creation is a builtin operation.

For example,
to sum the numbers between 0 and 100 we can iterate over the range.

```
var result := 0;
for i := 1 to 100
{
  result = result + i;
}
```

If we wish to reverse the iteration,
we can use the keyword `downto`.

```
var result := 0;
for i := 100 downto 1
{
  result = result + i;
}
```

Although we can use for loops in Python to iterate over lists,
we cannot do so in Dafny.
We need to construct an iterator over the size of the list.
The section on
[Sequences](/basics/sequences.html) shows how.


## Idris

Idris is a functional language using expressions.
As with Dafny's functional fragment,
we will can only repeat expressions using
[recursion](/basics/recursion.html).

## Coda

Iterating over data is another important control flow mechanism.
With iterators we are traversing data to perform some repeated action.
In this section we demonstrated this with builtin datatypes `list` (python) and `seq` (dafny),
and numbers such as integers.
Common to each is that we are traversing the data structure,
examining each value in turn.
We will see in
[datatypes](/datatypes.html)
how we can examine the contents of other data structures,
and use
[recursion](/basics/recursion.html) to realise control flow.
