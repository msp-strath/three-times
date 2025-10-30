---
title: "Enumrations"
---

Enumerations are datatypes that enumerate some values.


## Python

Within Python,
which is object-oriented,
enumerations are specialised classes representing choices between a set of values.

For example,
consider the following enumerated object to represent different sizes.

```
class Size(Enum):
    SMALL  = 1
    MEDIUM = 2
    LARGE  = 3
```

We can use the match statement in Methods to deconstruct enums,
as well as other types:

```
def toString(s : Size) -> str:
    match s:
        case Size.SMALL:
            return "Small"
        case Size.MEDIUM:
            return "Medium"
        case Size.LARGE:
            return "Large"
        case _:
            return "Default"
```

The keyword `match` indicates we are matching on what `s` could be.

We delineate each possible 'case' with the keyword `case`, followed by the
name of the constructor we want to examine.

If we do not want to examine any more cases we can use the wildcard pattern:
`_`.

For example:

```
def toString(s : Size) -> str:
    match s:
        case Size.SMALL:
            return "Small"
        case _:
            return "Default"
```


## Dafny

We begin with the example of an enumerated type to represent different sizes.

```
datatype Size
  = Small
  | Medium
  | Large
```

Here the keyword `datatype` indicates that we are creating a new datatype
which we have named `Size`.

The equal sign indicates that we are then to define the datatypes' data
constructors, each separated by the pipe symbol `|`.

For `Size`, these constructors are: `Small`, `Medium`, and `Large`.

Let us move onto Pattern Matching.

To deconstruct datatypes we can use the match statement in Methods, and
expression in functions.

```
method ToString(s : Size) returns (str : string)
{
  match s
  {
  case Small => return "Small";
  case Medium => return "Medium";
  case Large => return "Large";
  }
}
```

The keyword `match` indicates we are matching on what `s` could be.

We delineate each possible 'case' with the keyword `case`, followed by the
name of the constructor we want to examine.

If we do not want to examine any more cases we can use the wildcard pattern:
`_`.

For example:

```
method ToString(s : Size) returns (str : string)
{
  match s
  {
  case Small => return "Small";
  case _ => return "Do not care";
  }
}
```

We can also use match in the functional fragment of Dafny

```
function toString(s : Size) : string
{
  match s
  {
  case Small => "Small"
  case Medium => "Medium"
  case Large => "Large"
  }
}
```

There are is little difference in syntax between Dafny's two languages.
For example, consider the following rewrite of `ToString2`.

```
method ToString3(s : Size) returns (str : string)
{
  return match s
         {
         case Small => "Small"
         case _ => "Do not care"
         }
         ;
}
```

## Idris

Idris,
like all functional languages,
supports algebraic datatypes
aka  'sums of products'.
An algebraic datatype is where we are creating choices between different ways we can say what the datatype is.
We show this more in later sections on [Unions](/datatypes/unions.html)

::: note
Datatypes in Idris,
however,
are not *quite* algebraic datatypes.
In Idris,
datatypes are *indexed families*,
a *type constructor*
(how we construct types)
paired with several
*data constructors*.
:::

We begin with the example of an enumerated type to represent different sizes.

```
data Size
  = Small
  | Medium
  | Large
```

Here the keyword `data` indicates that we are creating a new datatype
which we have named `Size`.

The equal sign indicates that we are then to define the datatypes' data
constructors, each separated by the pipe symbol `|`.

For `Size`, these constructors are: `Small`, `Medium`, and `Large`.

The same as in Dafny!

We can rewrite `MaybeStr` as:

```
data MaybeStr : Type where
  Nothing : MaybeStr
  Just : (value : String) -> MaybeStr
```

::: information
The above,
*long*,
definition is what the original definition of `MaybeStr` is transformed too internally!
:::

Let us now consider pattern matching.

To deconstruct datatypes we can use case expressions, or pattern
matching in function equations.

toString : (s : Size) -> String
toString Small  = "Small"
toString Medium = "Medium"
toString Large  = "Large"

Our function now has *multiple equations*, each representing a
different pattern in the input.  The same as in Dafny!

Here we demonstrate the `case` expression, which is analogous to Dafny's 'match'.

```
toStringCase : (s : Size) -> String
toStringCase s
  = case s of
      Small => "Small"
      Medium => "Medium"
      Large => "Large"
```

The keyword `case` indicates we are matching on what `s` could be.
Where as Dafny used 'case' to indicate each case, we use 'case'
where Dafny used 'match'.

Unlike Dafny, we do not need to delineate each possible 'case' with
the keyword `case`. We do, however, use the 'fat' arrow to show
what follows.

As with Dafny, if we do not want to examine any more cases we can
use the wildcard pattern: `_`. Wildcards also work in equations

For example:

```
toStringCaseWild : (s : Size) -> String
toStringCaseWild s
  = case s of
      Small => "Small"
      _     => "Do not care"
```

and

```
toStringCaseWild' : (s : Size) -> String
toStringCaseWild' _ = "Do not care"
```

### (Dependent) Pattern Matching

Within Idris,
`with` constructs are a way of doing pattern matching in Idris when
dealing with dependent data. We will explain more in Week 3 but
show the syntax now.

If fact `case` and `with` are the same,
all things considered,

The difference is that `with` is not an expression,
and `with` shows us the LHS patterns in greater detail.

```
toStringDep : (s : Size) -> String
toStringDep s with (s)
  toStringDep s | Small  = "Samall"
  toStringDep s | Medium = "Medium"
  toStringDep s | Large  = "Large"
```

## Coda

We will see a more foundational way to represent Enumerations when we discuss
[unions](/datatypes/unions.html).
Within Dafny and Idris,
enumerations are tagged instances of the unit type!
