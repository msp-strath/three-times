---
title: "Generic Datatypes"
---

This section looks at simple generic datatypes,
where we want to ensure that the datatype works with any other type.

## Python

For example a generic option (or Maybe) type in Python can be defined as:

```{.python}
type Option[T] = T | None

def fromJust[T](base : T, m : Option[T]) -> T:
    match m:
        case None:
            return base
        case _:
            return m
```

::: caution
Here we have used typing hints available from Python 3.12+
:::


## Dafny

Here is an example of an optional datatype that we can use to capture error
states.


```{.dafny}
datatype Optional<T>
  = Nothing
  | Just(value : T)
```

```
function isJust<T>(s : Optional<T>) : bool
{
  match s
  {
  case Nothing => false
  case Just(_) => true
  }
  //        ^ wildcards can be within the constructor pattern.
}
```

## Idris

```{.dafny}
data Maybe t
  = Nothing
  | Just t
```

```{.idris}
isJust : Maybe a -> Bool
isJust Nothing = false
isJust (Just _) = true
```
