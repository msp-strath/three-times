---
title: "Higher-Order Programming"
toc: true
---

Expressions...
When we reviewed expressions
[earlier](/basics/expressions.html) in these notes/course,
we took a light look are what expressions are in Python, Dafny, and Idris.
We highlighted common expressions such as arithmetic operations and logical comparisons.
You may think that expressions are *just* units of computation for primitives,
and you would be correct in that thinking.
That being said,
we have seen that when using Dafny and Idris both
[conditionals](/basics/conditionals.html)
and
[matching](/datatypes/enums.html)
are expressions.

One of the main foundational concepts in functional programming is that
[functions are expressions too](https://en.wikipedia.org/wiki/Lambda_calculus).
Specifically,
we can capture and reason about computations based on *anonymous functions* and binders.
Modern (functional) programming languages support the idea that functions are expressions,
and functional languages such as
[Haskell](https://www.haskell.org),
[OCaml](https://www.ocaml.org),
(and Idris)
take these ideas much further.

In this section,
we show the power of functions as expressions and,
when paired with generic programming,
write some interesting programs.

## Python

Let us start with a simple problem:
Iterating over a list and transforming the elements in the list.

If we were to double the elements of a list we would write it as:

```
def doubleList(xs : list[int]) -> list[int]:
    xs_new = []
    for x in xs:
        xs_new.append(x + x)
    return xs_new
```

If we were to triple the elements of a list we would write it as:

```
def tripleList(xs : list[int]) -> list[int]:
    xs_new = []
    for x in xs:
        xs_new.append(x + x + x)
    return xs_new
```

Notice that the code we are writing follows the same structure,
a traversal of the original list paired with a transformation on each element.
We can abstract this traversal as:

```
def traverse[A,B](m : Callable[[A],B], xs : list[A]) -> list[B]:
    xs_new = [];
    for x in xs:
        xs_new.append(m(x))
    return xs_new
```

Here `Callable` is a type hint that provides the *type signature* for a method prototype,
which in this case is the method `m`.
We have also signified that the list's type *may* change,
as the transformation performed by `m` can change the type.

::: note
To use `Callable` you need to import

```
from collections.abc import Callable
```

Why this is not provided as part of typing *I* do not know...
:::

With `traverse` we now have a *generic* method that traverses a list and applies a transformation.
So let us do that with `double` and `triple`,
which we define as:

```
def double(x : int) -> int:
    return x + x

def triple(x : int) -> int:
    return x + x + x
```

and some example calls,
with `xs = [1,2,3,4]`:

```
traverse(double,xs)
traverse(triple,xs)
```

It is a bit annoying to define the methods separately.
We can resolve this using *anonymous* functions,
which are expressions that are not named.


```
traverse(lambda x : x + x,xs)
traverse(lambda x : x + x + x,xs)
```

Here the keyword `lambda` signifies that we are writing an anonymous function with the name of the parameters before the colon
(`:`)
and the function body after.
The name lambda comes from the
[lambda calculus](https://en.wikipedia.org/wiki/Lambda_calculus) which is one of the foundational formal models we use to model computations.

In the
[previous section](/generic/blocks.html)
we were looking at a simple model for a course and that by providing custom implementations for `__eq__` and `__lt__` we could then perform operations using `(==)` and `(<)`.
Let us now look at a different way to do so.
Say,
for example,
we wanted to compare find the position of a course in a list.
We could write a custom method as below:

```
def findIndex(c : Course, xs : list[Course]) -> Option[int]:
    idx = 0
    for x in xs:
       if c == x:
         return idx
       idx += 1
    return None
```

The operation is common so we should make it generic by replacing the explicit use of `Course` with a type variable.

```
def findIndex[T](c : T, xs : list[T]) -> Option[int]:
    idx = 0
    for x in xs:
       if c == x:
         return idx
       idx += 1
    return None
```

The method `findIndex` will work,
provided `T` supports equality
i.e. has an implementation for `__eq__`.
This is risky,
as we won't detect this error until runtime...

We can enforce the requirement for an `__eq__` method by making `findIndex` higher-order and providing a means to compare two instances of `T`.

```
def findIndex[T](m : Callable[[T,T],bool], c : T, xs : list[T]) -> Option[int]:
    idx = 0
    for x in xs:
       if m(c,x):
         return idx
       idx += 1
    return None
```

Now,
when we use `findIndex` we need to provide the implementation explicitly.
For example,

```
findIndex(lambda x,y : x.code == y.code,
          Course("A",[]),
          [Course("B",[]),Course("A",[])]
         )
```

::: important
Remember that Python has typing hints!
And that there is still `None`.
Trying running:
```
findIndex(lambda x,y : x.code,
          Course("A",[]),
          [Course("B",[]),Course("A",[])]
         )
```
What is the output now!
:::

## Dafny

Let us start with a simple problem:
Iterating over a list and transforming the elements in the list.

If we were to double the elements of a list we would write it as:

```
method DoubleList(xs : seq<int>) returns (ys : seq<int>)
{
    var xs_new := [];
    for i := 0 to |xs|
    {
        var xs_new := xs_new + [xs[i] * 2];
    }
    return xs_new;
}
```

If we were to triple the elements of a list we would write it as:

```
method TripleList(xs : seq<int>) returns (ys : seq<int>)
{
    var xs_new := [];
    for i := 0 to |xs|
    {
        var xs_new := xs_new + [xs[i] * 3];
    }
    return xs_new;
}
```

Notice that the code we are writing follows the same structure,
a traversal of the original list paired with a transformation on each element.
We can abstract this traversal as:

```
method Traverse<A,B>(f : (A) -> B, xs : seq<A>) returns (ys : seq<B>)
{
    var xs_new := [];
    for i := 0 to |xs|
    {
        var xs_new := xs_new + [f(xs[i])];
    }
    return xs_new;
}
```

Unlike Python,
we do not need any extra functionality to do higher-order programming.
We can provide the *type signature* for a *function* prototype (`f`) explicitly.
We have also signified that the list's type *may* change,
as the transformation performed by `f` can change the type.

::: note
Higher-Order programming in Dafny makes use of functions.
You cannot pass a method along,
just functions.
:::

With `Traverse` we now have a *generic* method that traverses a list and applies a transformation.
So let us do that with `double` and `triple`,
which we define as:

```
function double(x : int) : int { x + x }
function triple(x : int) : int { x + x + x}
```

and some example calls,
with `xs = [1,2,3,4]`:

```
Traverse(double,xs)
Traverse(triple,xs)
```

It is a bit annoying to define the methods separately.
We can resolve this using *anonymous* functions,
which are expressions that are not named.


```
traverse(x => x + x,xs)
traverse(x => x + x + x,xs)
```

There is no keyword and the lambda is signified by the double arrow
(`=>`)
with the name of the parameters before the arrow and the function body after.
For n-ary functions we group the parameters
(in both the expression and type signature)
using parentheses.

The use of
(double)
arrow comes from the
[lambda calculus](https://en.wikipedia.org/wiki/Lambda_calculus),
which is one of the foundational formal models we use to model computations.

In the
[previous section](/generic/blocks.html)
we could not provide a generic model for a course.
Let us use our knowledge of higher-order programming to do so.
Say,
for example,
we wanted to compare find the position of a course in a list.

First we provide the datatype definition:

```
datatype Course = C(code : string,lobjs : seq<string>)
```

We could write a custom method as below:

```
method FindIndex(x : Course, xs : seq<Course>) returns (res : Optional<nat>)
{
  for i := 0 to |xs|
    {
      if x == xs[i] {
        return Some(i);
      }

    }
    return None;
}
```

The operation is common so we should make it generic by replacing the explicit use of `Course` with a type variable.

```
method FindIndex<T>(x : T, xs : seq<T>) returns (res : Optional<nat>)
{
  for i := 0 to |xs|
    {
      if x == xs[i] {
        return Some(i);
      }

    }
    return None;
}
```

The method `FindIndex` will not work as provided.
Dafny will complain:

```
can only be applied to expressions of types that support equality (got T) (perhaps try declaring type parameter 'T' on line ... as 'T(==)', which says it can only be instantiated with a type that supports equality) (dafny)
```

We can ensure that `T` supports equality by rewriting the method prototype as:

```
method FindIndex<T(==)>(x : T, xs : seq<T>) returns (res : Optional<nat>)
```


This is good practise,
yet we are not able to customise how equality is decided.
Let us see how we can use higher-order functions to change that.

We can specify a function to calculate equality,
and make `FindIndex` higher-order.

```
method FindIndex<T>(f : (T,T) -> bool, x : T, xs : seq<T>) returns (res : Optional<nat>)
{
  for i := 0 to |xs|
    {
      if f(x,xs[i]) {
        return Some(i);
      }

    }
    return None;
}
```

Now,
when we use `findIndex` we need to provide the implementation explicitly.
For example,

```
FindIndex((x,y) => x.code == y.code,
          C("A",[]),
          [C("B",[]),C("A",[])]
         )
```

Dafny,
however,
is not smart enough to work out the types for the anonymous function.

```
FindIndex((x : Course, y: Course) => x.code == y.code,
          C("A",[]),
          [C("B",[]),C("A",[])]
         )
```

## Idris

Let us start with a simple problem:
Iterating over a list and transforming the elements in the list.

If we were to double the elements of a list we would write it as:

```
doubleList : (xs : List Int) -> List Int
doubleList Nil = Nil
doubleList (x::xs) = x + x :: doubleList xs
```

If we were to triple the elements of a list we would write it as:

```
tripleList : (xs : List Int) -> List Int
tripleList Nil = Nil
tripleList (x::xs) = x + x + x :: tripleList xs
```

Notice that the code we are writing follows the same structure,
a traversal of the original list paired with a transformation on each element.
We can abstract this traversal as:

```
traverse : (f : a -> b) -> (xs : List a) -> List b
traverse Nil = Nil
traverse (x::xs) = f x :: traverse f xs
```

Unlike Python,
we do not need any extra functionality to do higher-order programming.
We can provide the function as an argument.
We have also signified that the list's type *may* change,
as the transformation performed by `f` can change the type.

::: note
The action of traversing a data structure is a fundamental operation.
Within functional programming,
we call the function `map` and it represents data structures that are `Functor`s
i.e. things we can map over.
:::

With `traverse` we now have a *generic* method that traverses a list and applies a transformation.
So let us do that with `double` and `triple`,
which we define as:

```
double : (x : int) -> int
double = x + x

triple : (x : int) -> int
triple = x + x + x
```

and some example calls,
with `xs = [1,2,3,4]`:

```
traverse double xs
traverse triple xs
```

It is a bit annoying to define the methods separately.
We can resolve this using *anonymous* functions,
which are expressions that are not named.


```
traverse (\x => x + x) xs
traverse (\x => x + x + x) xs
```

Anonymous functions are indicated with a pair of parentheses with a leading backslash
(`\`).
Function arguments and bodies are delineated by the double arrow
(`=>`)
with the name of the parameters before the arrow and the function body after.
For n-ary functions we need not group the parameters explicitly

The backslash and (double) arrow are common in functional programming,
as they resemble notation from the
[lambda calculus](https://en.wikipedia.org/wiki/Lambda_calculus).
One of the foundational formal models we use to model computations.
Backslash,
as it most closely resembles a lower case lambda.
Arrow as it looks like an arrow.

<aside>
Within Idris a double arrow was chosen,
IIRC,
to disambiguate between arrows for function types and arrows for values
</aside>

In the
[previous section](/generic/blocks.html)
we saw hwo we could use interfaces to provide a generic model for a course.
Let us use our knowledge of higher-order programming to model it differently.

Say,
for example,
we wanted to compare find the position of a course in a list.
We could write a custom method as below:


```
findIndex : (c : Course) -> (xs : List Course) -> Maybe Int
findIndex _ Nil = Nothing
findIndex (C x xobjs) (C y yobjs::xs)
  = if x == y
    then Just 0
    else case findIndex (C x xobjs) xs of
           Nothing => Nothing
           Just i  => Just (i + 1)
```

The operation is common so we should make it generic by replacing the explicit use of `Course` with a type variable and an interface constraint.

```
findIndex : Eq a => (x : a) -> (xs : List a) -> Maybe Int
findIndex _ Nil = Nothing
findIndex x (y::xs)
  = if x == y
    then Just 0
    else case findIndex y xs of
           Nothing => Nothing
           Just i  => Just (i + 1)
```

The function `findIndex` will work as provided.
We are,
however,
bound by the definition of equality for `a`.
Unfortunately,
it is [somewhat convoluted to](https://docs.idris-lang.org/en/latest/tutorial/interfaces.html#named-implementations)
to override any default implementation.
Instead, we can specify a function to calculate equality,
and make `findIndex` higher-order.

```
findIndex : (f : a -> a -> Bool) -> (x : a) -> (xs : List a) -> Maybe Int
findIndex _ _ Nil = Nothing
findIndex f x (y::xs)
  = if f x y
    then Just 0
    else case findIndex f y xs of
           Nothing => Nothing
           Just i  => Just (i + 1)

```

Note we have to pass the function around!

Now,
when we use `findIndex` we need to provide the implementation explicitly.
For example,

```
findIndex (\x,y => x.code == y.code)
          (C "A" [])
          [C "B" [], C "A" [] ]
```


## Coda

In this section,
we have show how to write more generic programs by making methods and function higher-order.

Higher-Order functions *are* important,
and datatypes that contain functions as values even more so.
Roughly speaking,
within Idris Interfaces are records where the interface definition supplies the type signatures used to type each field.
(Interface)
Implementations are record instances that provide values for each field.
We can only do such neat tricks
in part,
through generic programming.
