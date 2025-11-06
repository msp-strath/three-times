---
title: "Generic Programming"
toc: true
---

The previous section demonstrated generic datatypes.
In this section we will look at working with them to write programs.
Importantly,
with generic types we no longer know what the type is nor what it can do!


## Python

Python uses 'duck typing' to work our what datatypes
(classes and primitives)
can do at run time.
Another name for the this mechanism is a
['Protocol'](https://typing.python.org/en/latest/spec/generics.html#user-defined-generic-types).

Protocols are a specification,
in this case a collection of method prototypes,
Thus we can specify a set of expected operations
(i.e. the protocol)
that each type/class must satisfy.
When the interpreter encounters an operation that belongs to a protocol,
it will take this into account when type checking.

Within Python
(and Dafny where they are called 'Traits')
Protocols are associated with objects and we will not consider them further after a short example.

Let us conside the following example,
showing a partially specified [dataclass](/datatypes/records.html)
for a course:

```
@dataclass
class Course:
  code : String
  learning_objectives : list[str]
```

To enable `Course` to be sortable we need to extend the definition with two method implementations:
`__eq__` for equality and `__lt__` for comparison.
We can do so and make `Course` instances sortable by code:

```
@dataclass
class Course:
  code : String
  learning_objectives : list[str]

  def __eq__(self,that):
    return self.code == that.code

  def __lt__(self,that):
    return self.code < that.code
```

With this extension,
we can then use operators `==` and `<` to compare instances.

::: note
Dataclasses are [python decorators](https://docs.python.org/3/library/dataclasses.html#module-contents) and many of these protocols can be implemented automatically.

Let us now consider writing generic methods.
We will specify a method `isEmpty` that will return a boolean if a provided `List`,
as [we defined earlier](/generic/datatypes/html)
is empty.

```
def isEmpty[T](xs : List[T]) -> bool:
    pass
```

As when declaring dataclasses,
we use brackets to introduce a type variable.
For this method,
the type variable is introduced *before* the arguments.

Here are some more examples,
working with our `Option` alias and list.

```
def hasValue[T](o : Option[T]) -> bool:
    pass

def head[T](xs : List[T]) -> T:
    pass

def tail[T](xs : List[T]) -> List[T]:
    pass
```


## Dafny

Dafny supports datatypes *and* classes.
Similar-ish to Python,
we can create specifications of what operations we can expect classes to provide.
Where as Python calls them protocols,
Dafny calls them
['Traits'](https://dafny.org/dafny/DafnyRef/DafnyRef#sec-trait-types).
The technical details surrounding traits and protocols are outwith the scope of this course.
It is sufficient to note that traits are associated with objects and classes must *extend* a trait to realise it.
We will not consider traits further.

Let us move on to generic methods/functions.

Similar to Python,
we need to provide the type variables before the arguments.
Let us look at their use when declaring function and method prototypes in Dafny.
Specifically,
we will provide some operations that work on our `Optional` type.

```
function isJust<T>(s : Optional<T>) : bool
```

and

```
method IsJust<T>(s : Optional<T>) returns (b : bool)
```

Here are some more function prototypes:

```
function head<T>(xs : List<T>) : Optional<T>
function tail<T>(xs : List<T>) : List<T>
```

Dafny also supports
[type parameters](https://dafny.org/dafny/DafnyRef/DafnyRef#sec-type-parameters),
which constraints generic types to certain characteristics
i.e. equality and initialisation status.
These characteristics are compiler/language defined and Users cannot create new ones.

## Idris

Within Idris,
we use
['Interfaces'](https://docs.idris-lang.org/en/latest/tutorial/interfaces.html)
to specify expected sets of operations that our generic types support..

::: warning
For the Haskell-aware readers,
one would be tempted to equate Idris' Interfaces with Haskell's Typeclasses.

Yes they are similar, but they are also different.
Such differences are outside the scope of these notes.
:::


Take,
for instance,
the following example showing a
partially specified [datatype](/datatypes/unions.html)
for a course:

```
data Course = MkCourse String (List String)
```

To enable `Course` to be sortable we need to provide implementations for two interfaces:
`Eq` for equality;
and `Ord` for comparison.
Interfaces are specified as:

```
interface Eq type where
  (==) : type -> type -> Bool

interface Ord type where
  compare : type -> type -> Ordering
```

where `Ordering` is:

```
data Ordering = LT | EQ | GT
```

Interfaces also have default implementations,
which are derived from the interfaces existing functions.

::: note
We will not go into too much depth over interfaces, nor sorting.
More information is
[available online](https://docs.idris-lang.org/en/latest/tutorial/interfaces.html).
:::

We now need to make `Course` provide implementations for `Eq` and `Ord`.
We do so as follows:

```
Eq Course where
  (==) (MkCourse x xs) (MkCourse y ys) = x == y

Ord Course where
  compare (MkCourse x xs) (MkCourse y ys) = compare x y
```

As with our Python example,
we have taken advantage of the course code being a string to provide the implementations.
Strings already provides implementations for `Eq` and `Ord`.

Let us now look at providing a type signature that is generic.

```
isJust : Maybe a -> Bool
head : List a -> Maybe a
tail : List a -> List a
```

See how there is no *explicit* definition of the type variable `a`.
Idris is smart enough to include these automatically during type checking.


Python differs from Idris and Dafny with its 'duck typing',
protocols are checked at runtime.
Dafny's traits are tied to classes.
Idris' interfaces are separate from the datatypes that provide implementations.
Yet generic type signatures show no information of what interfaces are expected?
If the interface operation is provided with a resolved type,
then Idris will work out if this is a correct application of the operation.
What if,
however,
we do not know what the type being used is?

For example,
try checking this code:

```
goCompare : a -> a -> Ordering
goCompare x y = compare x y
```

in which we use the `compare` function from the `Ord` interface.
What is the result?

Within Idris,
we use *interface constraints* to tell each function what interfaces are expected to be used in the function body.

To resolve `goCompare`,
we rewrite it as follows:

```
goCompare : Ord a => a -> a -> Ordering
goCompare x y = compare x y
```

The double arrow
(`=>`)
specifies that we are constraining `a`,
such that when we use `goCompare` the type of the variables must provide a implementation for `Ord`.

Naturally,
we can specify multiple constraints.

## Coda

In this section we have not 'quite' looked at generic programming.
More we have looked at how to specify generic method/function prototypes,
and have ways to communicate which operations generic types can support.

Looking at Dafny,
it appears that the only practical way to constrain data is with classes and traits.
There is,
however,
another way:
[Higher-Order Programming](/generic/higher-order.html)!
Which we cover in the next section.
