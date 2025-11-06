---
title: "Addendum: Modelling Interfaces"
toc: true
---

In this addendum,
we will look at how we can simulate Idris' interfaces in both Python and Dafny.

We highlighted the *secret* to Idris' interfaces towards the end of our section on
[higher-order programming](/generic/higher-order.html).

The key components to modelling interfaces are:

1. [Higher-Order programs](/generic/higher-order.html);
2. [Generic Datatypes](/generic/datatypes.html);
3. A means to implement
   [Products](/datatypes/products.html)
   and
   [Unions](/datatypes/unions.html),
   ideally
   [records](/datatypes/records.html)
   and
   [Unions](/datatypes/unions.html);

Let us begin...

We will look at modelling a simple variant of the `Ord` interface from Idris.
This interface has the following specification:

```
interface Ord type where
  lessThan : (x : type)
          -> (y : type)
               -> Bool
```

From `Ord` we will be able to define other ordering operators using `lessThan`:

| Operator | Implementation                    |
|----------|-----------------------------------|
| gt x y   | lt y x                            |
| eq x y   | !(lt x y) and !(gt x y)           |
| lte x y  | if lt x y or eq x y then x else y |
| gte x y  | if gt x y or eq x y then x else y |
| max x y  | if lte x y then y else x          |
| min x y  | if lte x y then x else y          |

::: note
Most implementations require an instance of `Eq`,
we will not do that here.
:::

## Python

We can represent the `Ord` interface using python's
[`dataclass`](/datatypes/records.html) construct and a callable type hint.
Dataclasses effectively emulate records and type hints means we can remind ourselves that we have functions:

(Reminder, python has typing hints that are not checked at runtime.)

```
@dataclass
class Ord[T]:
    lt : Callable[[T,T],bool]
```

and here it is!

From this definition we can define generic methods that *require* we provide an instance of `Ord` when the functions are called.

```
def lt[T](prf : Ord[T], x : T, y : T) -> bool:
    return prf.lt(y,x)

def gt[T](prf : Ord[T], x : T, y : T) -> bool:
    return prf.lt(y,x)

def eq[T](prf : Order[T], x : T, y : T) -> bool:
    return not prf.lt(x,y) and not gt(prf,y,x)

def lte[T](prf : Order[T], x : T, y : T) -> bool:
    return prf.lt(x,y) or eq (prf,x,y)

def gte[T](prf : Order[T], x : T, y : T) -> bool:
    return gt(prf,x,y) or eq (prf,x,y)

def max[T](prf : Order[T], x : T, y : T) -> bool:
    return y if prf.lte(x,y) else x

def min[T](prf : Order[T], x : T, y : T) -> bool:
    return x if prf.lte(x,y) else y

```

Passing `prf` around simulates Idris' implementation resolution.
Whereas Idris does this automatically,
we need to do it by hand.

Some sample usage:

```
if __name__=="__main__":
  inst_str = Ord(lambda x,y : x < y)
  print(gt(inst_str,"A","B"))
  print(gt(inst_str,"B","A"))
  print(eq(inst_str,"A","B"))
  print(eq(inst_str,"A","A"))
```

We also need to simulate `Ordering`,
we do so with an enum:

```
class Ordering(Enum):
  LT = 1
  EQ = 2
  GT = 3
```

and our compare methods will be:

```
def compare[T](prf : Order[T], x : T, y : T) -> Ordering:
    if lt(prf,x,y):
        return LT
    if gt(prf,x,y):
        return GT
    return EQ
```

## Dafny

We can represent the `Ord` interface using Dafny's
[record](/datatypes/records.html) construct and a higher order function.


```
datatype Ord<!T> = Ord(lt : (T,T) -> bool)

```

Here it is!
Notice that we have a `!` associated with the [type parameter](https://dafny.org/dafny/DafnyRef/DafnyRef#sec-type-parameters).
We need the 'bang' as we need to assert that there is no subtyping relationship.

From `Ord` we can then construct functions in much the same way we can do for Python:

```
function lt<T>(inst : Ord<T>, x : T, y : T) : bool
{
  inst.lt(y,x)
}

function gt<T>(inst : Ord<T>, x : T, y : T) : bool
{
  inst.lt(y,x)
}

function eq<T>(inst : Ord<T>, x : T, y : T) : bool
{
  !inst.lt(x,y) && !gt(inst,x,y)
}

function lte<T>(inst : Ord<T>, x : T, y : T) : bool
{
  inst.lt(x,y) || eq(inst,x,y)
}

function gte<T>(inst : Ord<T>, x : T, y : T) : bool
{
  gt(inst,x,y) || eq(inst,x,y)
}

function max<T>(inst : Ord<T>, x : T, y : T) : bool
{
  if lte(inst,x,y) then y else x
}

function min<T>(inst : Ord<T>, x : T, y : T) : bool
{
  if lte(inst,x,y) then else y
}
```

Some sample innvocations.

```
method Example()
{
  var inst_str := Ord((x,y) => x < y);
  print gt(inst_str,"A","B");
  print gt(inst_str,"B","A");
  print eq(inst_str,"B","B");
  print eq(inst_str,"A","B");
}
```

We also need to simulate `Ordering`,
we do so with a datatype:

```
datatype Ordering = LT | EQ | GT
```

and our compare methods will be:

```
function compare<T>(inst : Ord<T>, x : T, y : T) : Ordering
{
  if lt(inst,x,y)
    then LT
    else if gt(inst,x,y)
         then GT
         else EQ
}
```
