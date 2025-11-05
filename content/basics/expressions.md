---
title: "Builtins"
toc: true
---


Common to all programming languages are builtin in datatypes and expressions.
Builtins are the default set of types that programmers can use.
Expressions are pieces of computation we can use.
With all languages providing builtin expressions for builtin types.

Imperative code requires statements,
and statements contain expressions in a
few,
key places
(the RHS when creating variables,
test position of conditionals,
et cetera).

Functional programs are *expression* based, and pure.

Purity means that our code is 'side-effect' free, and we cannot interact with
the outside world.

Taking an early break from 'Three Times`,
we will not go over all builtins in the languages.
But note that they are common.

We will name a few,
but will point you to more extensive documentation:

Python
:  https://docs.python.org/3/library/stdtypes.html

Dafny
:  https://dafny.org/latest/DafnyRef/DafnyRef

Idris
:  https://idris2.readthedocs.io/en/latest/tutorial/typesfuns.html#primitive-types


## Booleans

| Python | Dafny | Idris |
|--------|-------|-------|
| bool   | bool  | Bool  |

Providing `true` and `false` values,
with for Idris the names are capitalised.
(Booleans are [datatypes](/datatypes/enums.html).)

### Logical operations

Some operations:

| Operation | Result                                 |
|-----------|----------------------------------------|
| `x or y`  | `if x is true, then x, else y`         |
| `x and y` | `if x is false, then x, else y`        |
| `not x`   | `if x is false, then True, else False` |

In Dafny and Idris, c-style operators are used:
`||`,
`&&`,
and
`!`.

### Comparison Operators

Enabling one to compare two values/objects.

| Operation | Meaning               |
|-----------|-----------------------|
| `<`       | strictly less than    |
| `<=`      | less than or equal    |
| `>`       | strictly greater than |
| `>=`      | greater than or equal |
| `==`      | equal                 |
| `!=`      | not equal             |

## Numeric Types

Some numeric types:

| Python | Dafny  | Idris  |
|--------|--------|--------|
| int    | int    | Int    |
| double | double | Double |

Some operations:

| Operation | Meaning               |
|-----------|-----------------------|
| `x + y`   | sum of x and y        |
| `x - y`   | difference of x and y |
| `x * y`   | product of x and y    |
| `x / y`   | quotient of x and y   |

## Strings

| Python | Dafny  | Idris  |
|--------|--------|--------|
| char   | char   | Char   |
| str    | string | String |

## Builtins

| Python         | Dafny     | Idris     |
|----------------|-----------|-----------|
| list[int]      | seq<int>  | List Int  |
| tuple[int,int] | (int,int) | (Int,Int) |
