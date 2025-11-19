---
title: "Objects & Classes"
toc: true
---

In this standalone topic,
we will take a brief look at /Object-Oriented/ programming, where we pair data with method/functions that operate over data.

Ostensibly,
we have kept our treatment of objects separate from
[datatypes](datatypes.html)
as they are fundamentally different.

+ Datatypes carry data and first-class pure functions,
  and are immutable;
  typically living on stacks,
  (although in some languages they can live on the heap);

+ Objects carry data, and methods that are impure;
  importantly they are mutable structures that live on Heaps;

Objects also go beyond datatypes with /inheritance/,
enabling objects to inherent data and methods/functions from other objects.

::: note
We will not go into inheritance in these notes
:::

## Python

Python is an inherently object-oriented language.
We saw this when looking at
[enumerations](datatypes/enums.html)
and
[dataclasses](datatypes/products.html).
These 'fancy' structures are specialised classes.

Let us look at defining a simple class to represent [pairs](datatypes/tuples.html).
The code *does* become rather long,
so we will
treat the [code and explanation literally](https://en.wikipedia.org/wiki/Literate_programming)
interspersing text around the code.

```
class Pair[A,B]:
    fst : A
    snd : B

```

Diving straight in:
the keyword `class` denotes that we are creating a class, and we use
[generics](generic/datatypes.html)
to parameterise `Pairs` over two types.


```
    def __init__(self, fst : A, snd : B):
        self.fst = fst
        self.snd = snd
```

The `__init__` **method** is where we define the class *constructor*,
describing how we can create `Pair` *instances*.
We can then call the constructor to create new pairs: `foo = Pair(1,"String")`.

For `Pair` this will assign the parameters to the class's *fields*.
The keyword `self` informs us that we are referencing an instance of `Pair`.
(We can use `const` fields to allocate a field shared across all instances, but that is for another day.)
Importantly,
the first argument for each method must reference `self` as it is a reference to the instance of `Pair` being called.


We have defined four other methods for pair:

```
    def getFirst(self) -> A:
        return self.fst

    def getSecond(self) -> B:
        return self.snd

    def mapFirst(self, f : Callable[[A],A]):
        self.fst = f(self.fst)

    def mapSecond(self, f : Callable[[B],B]):
        self.snd = f(self.snd)
```


Two accessor methods,
each beginning with `get` that extract each element.
And two transformation methods,
each beginning with `map`  to transform each element using a given function.

## Dafny

Let us now look at how Dafny realises classes,
and again we will intersperse comments with the code.

```
class Pair<A,B>
{
  var fst : A
  var snd : B
```

Like most object-oriented languages Dafny uses the keyword `class`,
and we can can have generic classes.

Fields in Dafny are distinguished using `var`.


```
  constructor(fst : A, snd : B)
  {
    this.fst := fst;
    this.snd := snd;
  }
```

Class *constructors* are indicated by the `constructor` keyword,
and this special method describes how we can create `Pair` *instances*.
For `Pair` this will assign the parameters to the class's *fields*.
The keyword `this` informs us that we are referencing an instance of `Pair`.
(We can use `const` fields to allocate a field shared across all instances, but that is for another day.)
Importantly,
and unlike Python,
we do not need to provide `this` as a reference to the class instances.

We can then call the constructor to create new pairs: `var foo := new Pair(1,"String")`.

::: note
Dafny also supports *named constructors*,
supporting different ways of constructing instances.
We do so by naming the constructor `constructor Foo()` and then using that name during creation
i.e. `foo := new Foo()`
:::

We have defined four methods for pair, and two functions:

```
  method GetFirst() returns (fst : A)
  {
    return this.fst;
  }

  method GetSecond() returns (fst : B)
  {
    return this.snd;
  }
```

Our two accessor methods follow the design of python,
in that we extract each field using `this` to obtain the instances value.

```
  method MapFirst(f : A -> A)
    modifies this
  {
    this.fst := f(this.fst);
  }

  method MapSecond(f : B -> B)
    modifies this
  {
    this.snd := f(this.snd);
  }
```

Our two transformation methods differ from python.
Although the code can be mapped accross,
we need to use the `modifies` keyword to inform Dafny that we are operating on a pair instance,
specifically `this` instance.
We will see in CS886 why we need to explicitly state that we are modifying instances.

We can also associate *read only* functions with classes.

```
  function getFirst() : (fst : A)
    reads this
  {
    this.fst
  }

  function getSecond() : (fst : B)
    reads this
  {
    this.snd
  }

}
```

These functions are special in that they can only read values from an object,
and are not allowed to modify it.

## Coda

Here we have had a quick look at simple classes in python and dafny.
Both languages offer more advanced usage of classes that are beyond the scope of what we need you to know for CS886.
