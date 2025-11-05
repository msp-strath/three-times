---
title: "Seuqnces"
toc: true
---

In this final section on programming basics,
we will look at sequences:
sequences of data.
We have seen their use before when looking at
[loops](/basics/loops.html),
[iterators](/basics/iteration.html),
and
[recursion](/basics/recursion.html).


## Python

Within Python,
lists are a *builtin* datatype.

We can create them using list notation,
which creates an instance of a list from a set of values.

```
xs : list[str] = ["A", "BB", "CCC"]
```

The empty list is 'just' empty: `[]`.

With our lists we can operate over/with them.
Indexing is a builtin operation,
where we use the postfix operator `[<index>]` to extract the element at the specified index.
For example,
to get the *head*
(the first element)
in a list,
we call for the element at position `0`:


```
head : str = xs[0]
```

To obtain the tail,
we can *slice* the list.
Slicing uses the same notation as indexing,
but with a colon
(`:`)
that indicates the range to slice out.

For example,
to obtain a list's *tail*
(all but the head of the list)
we can slice the head away:

```
tail : list[str] = xs[1:]
```

Other operations include list append.
Within Python,
there are two ways to append.

The first uses a unary operator (`+`):

```
xs_new : list[str] = xs + ["DDD"]
```

Here append returns a new list,
thus treating `xs` and `["DDD"]` in an immutable fashion.

::: exercise
We can consider the append operator as a method.
Trying writing a method `append` using `+` in the method body.
:::

Another way to append lists is to use a mutable oepration.
Within Python,
lists are objects.
The append method call
(`append`)
will mutate the list *in situ*.

```
xs.append("EEE")
```

::: warning
`append` may return `None`,
and as such cannot be bound to a variable.
:::

Finally,
within
[iteration](/basic/iteration.html) we saw how to iterate over a list:

```
for x in xs:
  print(x)
```

We can even do so using a while-[loop](/basics/loops.html).

::: exercise
Write a method `double` that uses a while-loop to double the elements in a list of integers.
:::

## Dafny

Like Python,
lists in Dafny are a *builtin* datatype.
However,
they are called *sequences*.

We can create them using list notation,
which creates an instance of a list from a set of values.

```
var xs : seq<string> := ["A", "BB", "CCC"];
```

The empty list is 'just' empty: `[]`.
When binding an empty type to a variable we need to provide an *explicit* type annotation.
There is insufficient information from the value as to what the list could contain.

With our lists we can operate over/with them.
Indexing is a builtin operation,
where we use the postfix operator `[<index>]` to extract the element at the specified index.
For example,
to get the *head*
(the first element)
in a list,
we call for the element at position `0`:


```
var head : str := xs[0];
```

To obtain the tail,
we can *slice* the list.
Slicing uses the same notation as indexing,
but with a short ellipsis
(`..`)
that indicates the range to slice out.

For example,
to obtain a list's *tail*
(all but the head of the list)
we can slice the head away:

```
var tail : seq[string] = xs[1..]
```

Other operations include list append.
Within Python,
there are two ways to append.

The first uses a unary operator (`+`):

```
var xs_new : list[str] := xs + ["DDD"];
```

Here append returns a new list,
thus treating `xs` and `["DDD"]` in an immutable fashion.

::: exercise
We can consider the append operator as a method.
Trying writing a method `append` using `+` in the method body.
:::

Finally,
we can iterate over a list by iterating over its size:

```
for i := 0 to |xs| // <- here |xs| is used to get the size of a sequence.
{
  print xs[i], "\n";
}
```

Dafny does not support `foreach` loops.

We can even iterate over lists using a while-[loop](/basics/loops.html).

::: exercise
Write a method `double` that uses a while-loop to double the elements in a list of integers.
:::


## Idris

Unlike Python and Dafny,
lists in Idris are a not *builtin* datatype.
Lists are a [generic datatype](/datatype/generic.html).
Specifically,

```
data List a = Nil | (::) a (List a)
```

Idris uses syntax sugar to enable lists to be specified using list notation.
which creates an instance of a list from a set of values.

```
xs : List String
xs = ["A", "BB", "CCC"]
```

or:

```
xs : List String
xs = "A" :: "BB" :: "CCC" Nil
```


The empty list is 'just' empty: `[]` or `Nil`.
When binding an empty type to a variable we need to provide an *explicit* type annotation.
There is insufficient information from the value as to what the list could contain.

With our lists we can operate over/with them.
Indexing is a function
(`index`)
that,
given an index that is within bounds,
will recurse over the list to the provided index.

When operating over data,
it is common to use [matching](/datatypes/enums.html)
and [recursion](/basics/recursion.html) to operate over lists.

For example,
we can write an `index` function as:

```
index : (idx : Int) -> (xs : List String) -> Maybe String
index idx Nil = Nothing
index idx (x::xs)
  = if idx == 0
    then (Just x)
    else index (idx - 1) xs
```

::: information
Although `index` is 'safe', we will see in CS886 how to make `index` much safer.
:::

We can use matching to obtain the `head` and `tail` of a list:

```
head : List a -> Maybe a
head Nil     = Nothing
head (x::xs) =

tail : List a -> List a
tail Nil     = Nil
tail (x::xs) = xs
```

::: information
Although `head` and `tail` are 'safe', we will see in CS886 how to make them much safer.
:::


Other operations include list append.
Within Idris,
append is a function `(++)`

```
(++) : (xs : List a) -> (ys : List a) -> List a
```

which we use as:

```
xs_new : List a
xs_new = xs ++ ["DDD"]
```

Here append returns a new list.

::: exercise
We have purposefully not given the body to append.
Trying completing the definition.
:::

Finally,
we can iterate over a list using recursion.
For example to double each element in a list of integers:

```
doubleXS : (xs : List Int) -> (ys : List Int) -> List Int
doubleXS Nil = Nil
doubleXS (x::xs) = x + x :: doubleXS xs
```

## Coda

Within Python and Dafny,
sequences are *builtin* datatypes.
Whilst in Idris they are an explicit datatype.
Sequences are not the only datatype that all three languages support.
The next topic [Datatypes](/datatypes.html) explores this further.
