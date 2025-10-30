---
title: "Union Types"
---

This section looks at [Union Types](https://en.wikipedia.org/wiki/Union_type).
As we saw with [Enumerations](/datatypes/enums.html),
there are times we want to represent different choices using the same type.
Union types encode the idea that a type's value can be one of many variants.

The name 'union' ostensibly comes from the `C` family of programming languages,
where unions were overlapping regions of memory where it was not clear which value you had.
Tagged unions
(also known as
[variants](https://en.wikipedia.org/wiki/Tagged_union)
and
[sum types](https://en.wikipedia.org/wiki/Tagged_union))
support discrimination of these values using tags
i.e. constructor names.
[Intersection types](https://en.wikipedia.org/wiki/Intersection_type)
on the otherhand are a special form of union.

::: important
These terms are often used interchangeably,
do not do so!
:::

## Python

Python supports intersection types.
We show this by demonstrating an example of the `Option type` as a raw union.

```{.python}
def isJust(v : str | None):
    match v:
        case str():
            print(f"Is String { v }")
        case _:
            print("Is none")
```

Here the bar (`|`) denotes the intersection.
When working with these values we have to match on their constructor to discriminate between the different cases.

We can also define a type synonym to make our functions easier to read.

```{.python}
type MaybeStr = str | None

def isJust(v : MaybeStr):
    match v:
        case str():
            print(f"Is String { v }")
        case _:
            print("Is none")
```

Here `type` is the python keyword to declare a type alias
(synonym).


## Dafny

Within Dafny,
we have tagged unions (aka variants).
And we use the same syntax as for records,
but use bar
(`|`)
to discriminate between the options.

```{.dafny}
datatype MaybeStr = Nothing | Just(value : string)

```

::: notice
The syntax in Dafny for datatypes is the same as for records!
:::

In functional programming datatypes are actually known as:
**algebraic datatypes**,
where we can construct structured data as a **sum of products**.
That is,
a tagged union is the choice between a bunch or records which themselves can contain a bunch of sums...

Much like python we can use `match` to discriminate between the different choices.

```{.dafny}
function isJust(s : MaybeStr) : bool
{
  match s
  {
  case Nothing => false
  case Just(_) => true
  //        ^ Wildcard
  }
}
```

Wildcards can be within the constructor pattern.

We can also write this function imperatively.

```{.dafny}
method IsJust(s : MaybeStr) returns (b : bool)
{
  match s
  {
  case Nothing => return false;
  case Just(_) => return true;
  }
}
```


## Idris

Idris like Dafny supports algebraic datatypes.
Simple datatypes take an almost similar form:

```{.idris}
data MaybeStr = Nothing | Just String

```

[Remember that datatypes](/datatypes/enums.html)
in Idris are indexed families.
We can rewrite `MaybeStr` as:

```
data MaybeStr : Type where
  Nothing : MaybeStr
  Just : (value : String) -> MaybeStr
```

Again remember,
the above definition is what the simple definition is transformed to internally!

We can then use pattern matching on function arguments to discriminate between the choices:

```{.idris}
isJust : MaybeStr -> Bool
isJust Nothing = false
isJust (Just _) = true
```

Like Dafny Idris enables wildcards in constructors.

As we saw with
[enumerations](/datatypes/enums.html)
we can also use an explicit `case` tree:

```
isJust : MaybeStr -> Bool
isJustr m
  = case m of
      Nothing => false
      (Just _) => true
```
