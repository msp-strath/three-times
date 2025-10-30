---
title: "Product Types"
toc: true
---

This section looks at
[Product Types](https://en.wikipedia.org/wiki/Product_type),
not to be confused with
[record types](/datatypes/records.html).
As we saw with [Pairs/Tuples](/datatypes/tuples.html),
there are times we want to collect data together into a single structure.
Product types encode this idea.

The name 'product' ostensibly comes from the underlying theory we use to reason about these structures.
If you know the `C` family of programming languages,
then you will have encountered structs.
Products are structs, Structs are Products.

What differentiates products from tuples is that we associate the construction of the data structure with a name.
It is with this name,
the data constructor,
that we know which collection of values we are working with.

## Python

Python does not support product types in the same way as Dafny and Idris.
Traditionally,
python supports
[*named tuples*](https://docs.python.org/3/library/collections.html#collections.namedtuple)
where the tuple itself and the fields are associated with a name.

For example:

```
from collections import namedtuple

Person = namedtuple('Person', ['name', 'dob', 'height'])
```

We can index named tuples positionally:

```
def creating_and_accessing_data() -> None:
    obj = Person("Hello", "123", 12)
    n = obj[0]
    return None
```

and using fields:

```
def creating_and_accessing_data() -> None:
    obj = Person("Hello", "123", 12)
    n = obj.name
    return None
```


To me, named tuples seem more like [records](https://en.wikipedia.org/wiki/Product_type),
and `dataclasses` have since taken over the space that named tuples used to take.

We will talk about `dataclasses` when we
[talk about record](/datatype/records.html).


## Dafny

Although Dafny too supports classes,
we can create product types using `datatypes`.
These datatypes are not classes.

```
datatype Person = Person(string, string, int)
```

Datatype instantiation works much like Python.
To access the elements we will have to use pattern matching.


```
method CreatingAndAccessingData()
{
  var p := Person("Hello", "123", 12);
  var n := match p { case Person(n,d,i) => n};
}
```

Notice that,
unlike named tuples,
we do not know which values are which.

[Records](/datatypes/records.html) shows us how to label these values.

## Idris

Idris also supports products.
We can present `Person` as follows:

```
data Person = MkPerson String String Int
```


Record instantiation and deconstruction work much the same as dafny.

```
creatingAndAccessingData : Person -> String
creatingAndaccessingData
  =  let p = MkPerson "Hello" "123" 12
  in let MkPerson n d i = p
  in n
```

Notice that,
unlike named tuples,
we do not know which values are which.

[Records](/datatypes/records.html) shows us how to label these values.

## Coda

We have not looked at record updates.
Please see Dafny and Idris' respective documentation for that.
