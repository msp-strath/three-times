---
title: Tuples "(and Pairs)"
---

We begin our look at dataypes with [Pairs]()
and tuples.
(Tuples being pairs with arbitrary elements).
A datatype builtin to many languages as a primtive.

## Python

Python supports creating tuples, pairs of arbitary size.
First,
let us consider a method to construct a pair of `int`s.

```
def pair(fst : int, snd : str) -> Tuple[int, str]:
    return (fst,snd)
```

With python the type of tuples/pairs is `Tuple`,
and the constructor is using parentheses.

As you will know,
tuples can contain elements of different types.

```
def examplePairs():
    p = pair(1,"This")
```

and to show off a truple...

```
def tupleExample(fst : int, snd : str, trd : int) -> Tuple[int,str,int]:
    return (fst,snd,trd)
```

What is nice in python is that you can explicitly deconstruct tuples when returning them from a method.

```
def usingTuples():
    t = tupleExample(1,"this", 2)

    (a,b,c) = t
```

## Dafny

Let us now cover the same examples but using Dafny.

```
function pair(fst : int, snd : str) : (int,str)
{
  (fst,snd)
}
```

With Dafny the type and constructor for tuples/pairs both use parentheses.

As you can see,
tuples can contain elements of different types.

```
method ExamplePairs()
{
  var p := pair(1,"This");
}
```

and to show off a truple...

```
function tupleExample(fst : int, snd : str, trd : int) : (int,str,int)
{
    (this,that,rest)
}
```

Like Python you can explicitly deconstruct tuples when returning.

```
method UsingTuples()
{
    var (a,b,c) := tupleExample(1,"this", 2);
}
```

Another way to deconstruct pairs is through *projection*,
in which we use positional accessors to extract elements at the specified position.

::: important
Within Dafny positional accessors start from `0`!
:::

To illustrate positional accessors:

```
method UsingTuples()
{
    var x:= tupleExample(1,"this", 2);
    var a := x.0;
    var b := x.1;
    var c := x.2;
}
```

::: exercise
What happens if you replace `var c := x.2` with: `var c := x.5`?
:::

## Idris

Let us now cover the same examples but using Dafny.

```
pair : (fst : Int) -> (snd : String) -> (Int,String)
pair fst snd = (fst, snd)
```

As with Idris,
the type and constructor for tuples/pairs both use parentheses.

As you can see,
tuples can contain elements of different types.

```
examplePairs : (Int, String)
examplePairs = pair(1,"This")
```

and to show off a truple...

```
tupleExample : (fst : Int) -> (snd : String) -> (trd : Int) ->  (Int,String,Int)
tupleExample f s t = (f,s,t)
```

As with Dafny,
you can explicitly deconstruct tuples in let-bindings.

```
usingTuples : Int
usingTuples =
    let (a,b,c) = tupleExample(1,"this", 2)
    in a
```

## Coda

We have looked at tuples/pairs.
Next we will look at enumerations.
