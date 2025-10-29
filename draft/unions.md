---
title: "Union Types"
---

This section looks at Union Types.
As we saw with [Enumerations](#),
there are times we want to represent different choices using the same type.

## Python

Python also supports Union types,
also known as intersection types.
We show this by demonstrating an example of the Option type as a raw union.

```{.python}
def trial(v : str | None):
    match v:
        case str():
            print(f"Is String { v }")
        case _:
            print("Is none")
```

We can also define a type synonym to make our functions easier to read.

```{.python}
MaybeStr = str | None

def trial2(v : MaybeStr):
    match v:
        case str():
            print(f"Is String { v }")
        case _:
            print("Is none")
```


## Dafny

```{.dafny}
datatype MaybeStr = Nothing | Just(value : string)

```


```{.dafny}
function isJust(s : MaybeStr) : bool
{
  match s
  {
  case Nothing => false
  case Just(_) => true
  }
  //        ^ Wildcard
}
```

Wildcards can be within the constructor pattern.

We can also write this funcion using imperative syntax.

```{.dafny}
method IsJust(s : MaybeStr) returns (b : bool)
{
  match s
  {
  case Nothing => return false;
  case Just(_) => return true;
  }
  //        ^ Wildcard
}
```


## Idris

```{.idris}
data MaybeStr = Nothing | Just(value : String)

```


```{.idris}
isJust : MaybeStr -> Bool
isJust Nothing = false
isJust (Just _) = true
```
