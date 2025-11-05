---
title: "Generic Datatypes"
toc: true
---

So far in our look at data types,
all of our types have worked with the same set of types.
Generic types are ones that can work with others.
We have seen such types before:
`list` in Python,
and
`seq` in Dafny
These two types,
however,
are *primitives*
In this section we will have a brief look at creating our own generic datatypes.


:::note
You may have heard the term *polymorphism* used to describe generic types.
With *monomophism*, describing types that are not generic.
Polymorphism refers to more mathematically structured approaches to making data types generic.
:::

## Python

Within Python,
we can make types generic using type variables.
For example,
below we show how to encode a generic option (Maybe) type in Python and show a method prototype where it is used.

```{.python}
type Option[T] = T | None

def fromJust[T](base : T, m : Option[T]) -> T:
```

When making a method prototype generic,
we need to specify the parameter just before the method arguments.

::: caution
Here we have used typing hints available from Python 3.12+
The syntax pre-3.12 was different and cumbersome.
:::

With generic types,
however,
we no longer know what the type is nor what it can do!

To do so we can use
['Protocols'](https://typing.python.org/en/latest/spec/generics.html#user-defined-generic-types)
that enables specification of our generic types expected operations.

Within Python
(and Dafny where they are called 'Traits')
Protocols are associated with objects and we will not consider them further.


<!--
::: caution
It is important to not confuse the `Any`

-->
## Dafny

Let us now look at specifying generic datatypes in Dafny.
Below is an example of an optional datatype that we can use to capture error
states.


```{.dafny}
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

Similar to Python,
we need to provide the type variables before the arguments.
Let us look at their use when declaring function and method prototypes in Dafny.

```
function isJust<T>(s : Optional<T>) : bool
```

and

```
method IsJust<T>(s : Optional<T>) returns (b : bool)
```


::: exercise
When we first discussed datatypes we talked about tuples.
Try to construct a `Pair` datatype complete with explicit and native projection functions.
:::

## Idris

Finally,
let us look at generic types in Idris.
Here is the definition of `Maybe`.

```{.dafny}
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

Let us now provide a type signature that is generic.

```{.idris}
isJust : Maybe a -> Bool
```

See how there is no *explicit* definition of the type variable `a`.
Idris is smart enough to include these automatically during type checking.


::: exercise
You may have noticed that there are no bodies to the functions and methods in this page.
Try filling them in with the definitions from the previous section.
What do you notice?
:::
