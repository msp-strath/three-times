---
title: "Records"
toc: true
---

This section looks at
[Record Types](https://en.wikipedia.org/wiki/Product_type),
not to be confused with Product types.
As we saw with [Pairs/Tuples](/datatypes/tuples.html),
there are times we want to collect data together into a single structure.
Product types encode this idea.

The name 'product' ostensibly comes from the underlying theory we use to reason about these structures.
If you know the `C` family of programming languages,
then you will have encountered structs.
Records are structs, Structs are records.

What differentiates records from tuples is that we associate each field with a name,
and that these names *project* the value from the record itself.

## Python

Within current versions of Python,
[`dataclasses`](https://docs.python.org/3/library/dataclasses.html)
make creating records easier and are classes that have various default methods generated using
[decorators](https://peps.python.org/pep-0318/).
`dataclasses` are useful when you wish to have classes that 'just' contain data.
Other names for `dataclasses` are,
unsurprisingly,
**records**!

Let us now create a record for a person.

```
@dataclass
class Person:
    name : str
    dob  : str
    height : int
```

Which we can instantiate,
using the `Person` constructor and access fields using dot-syntax.

```
def creating_and_accessing_data() -> None:
    obj = Person("Hello", "123", 12)
    n = obj.name
    return None
```

## Dafny

Although Dafny too supports classes,
we can create `datatypes` with fields.
Unlike python,
these datatypes are not classes.

```
datatype Person = Person(name : string, dob : string, height : int)
```

Record instantiation and projection work much the same as python.

```
method CreatingAndAccessingData()
{
  var p := Person("Hello", "123", 12);
  var n := p.name;
}
```

## Idris

Idris to supports records.
We can present `Person` as follows:

```
record Person where
  constructor MkPerson
  name : String
  dob  : String
  height : Int
```


Record instantiation and projection work much the same as python and dafny.

```
creatingAndAccessingData : Person -> String
creatingAndaccessingData
  = let p = Person "Hello" "123" 12
    in  (name p)
```

Now, Idris also supports dot-syntax like python and dafny!

```
creatingAndAccessingData : Person -> String
creatingAndaccessingData
  = let p = Person "Hello" "123" 12
    in  p.name
```

What is interesting with Idris is that,
like
[Enumerations](/datatype/enums.html),
the syntax for records is 'syntactic sugar' for a simpler and longer representation.

Idris' elaborator turns `Person` into the following:

```
data Person : Type where
  MkPerson : String -> String -> Int -> Person


name : Person -> String
dob : Person -> String
height : Person -> String
```

::: exercise
We have forgotten to complete the function bodies!
Complete them.
:::

## Coda

We have not looked at record updates.
Please see Dafny and Idris' respective documentation for that.
