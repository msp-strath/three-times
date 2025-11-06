---
title: "Generic Datatypes"
toc: true
---

In this section we will have a brief look at creating our own generic datatypes,
and the issues that arise from doing so.

## Python

Within Python,
we can make types generic using type variables.
Consider the following code:

```
type Option[T] = T | None
```

Here we have declared a type hint alias
(aka a type synonym)
to represent a generic option
(`Maybe`).
Within Python `3.12+`,
we can specify generic typing hints using carefully placed brackets.

<aside>
[Recall](/datatypes/unions.html)
that `Maybe` is a variant type that either contains a value or no value.)
</aside>


::: caution
If your version of Python was pre `3.12+` then the syntax will be different and cumbersome.
Fortunately,
`mypy` can statically check Python code for various versions.
:::

Let us now move on to considering a generic
[dataclass](/datatypes/records.html),
which for our purposes will be used to encode a List:

```
@dataclass
class List[T]:
  head  : T
  tail  : Option[List[T]]
```

Our encoding of a list is functional with a 'head' and a 'tail',
following how they are
[encoded in Idris](/basics/sequences.html),
As with the type synonym,
typing variables are introduced using brackets.
We have also shown that we can use the type synonym from earlier and that the synonym is interchangeable with the full definition.

## Dafny

Let us now look at specifying generic datatypes in Dafny.
Below is an example of an optional datatype that we can use to capture error
states.


```
datatype Optional<T>
  = Nothing
  | Just(value : T)
```

We use the same syntax as simple datatypes,
but note the angles.
We use these to signify the type variable.

::: information
We can refer to type variables also as parameters.
Some people will argue that variables are different to parameters.
That conversation is,
however,
for another day.
:::

Let us now move on to considering a generic
[datatype](/datatypes/records.html),
which for our purposes will be used to encode a list:

```
datatype List<T> = Empty | Head(value : T, tail : List<T>)
```

Our encoding of a list is functional with a 'head' and a 'tail',
following how they are
[encoded in Idris](/basics/sequences.html),
As with the type synonym,
typing variables are introduced using brackets.
Note that in `List` we have used
[unions](/datatypes/unions.html)
to encode the 'empty' list separately.

## Idris

Finally,
let us look at generic types in Idris.
Here is the definition of `Maybe`.

```
data Maybe t
  = Nothing
  | Just t
```

:::important
Type variables **must** begin with a lower case letter in Idris.
:::


As Idris is dependently typed, there is more going underneath the hood than you may initially appreciate.
Type variables are *implicitly* bound, and are thus identifiers.
So we need to distinguish these (and other) variables from (type and data) constructors and other variables when it is not clear what these variables are.

We have seen the definition of lists [before](/basics/sequences.html),
and we will just repeat the definition.

```
data List t = Nil | (::) T (List T)
```

## Coda

This section has looked at *defining* generic datatypes.
We have yet to look at how we can *use* them.
We will do so in the next section.
