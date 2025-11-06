---
title: "Variables"
toc: true
---

Let us begin our deeper dive into
(imperative & functional)
programming with *variables*.
Regions of memory addressable by name.

## Python

The following Python code,
binds the identifier `i` to the integer value `0`.

```
i = 0
```

This *statement* places `i` on the *heap*,
which means that `i` is *mutable*.

As is standard in Python the type of `i` is worked out and checked at runtime.
Python is dynamically typed,
which means type checking occurs at runtime.
The interpreter *infers* the type of variables and values by examination.
Which means we do not need to give explicit typing hints!

Python's static analysis tools
(i.e. `mypy`)
can use type inference to statically determine types and check our code's correctness at compile time.
Not all types are,
however,
given.
As such the static type checking for python is *gradual*,
allowing the programmer to freely type key parts of their code.

Personally,
I think it is good to provide types when you know them and adding type hints is good practice.
We can do so using a 'colon' followed by a type:

```
i: int = 0
```

Remember the RHS of the assignment can be an expression.

```
i = i + 2
```

::: warning
As a constant reminder,
Python does not use hints are runtime.
Even if you have checked your program using tools such as `mypy`,
your program can still fail for weird and wonderful reasons!
:::

## Dafny

Let us now look at Dafny's approach to variables.

```
  var i : int := 0;
```

Here we bind the identifier `i` to the integer value `0`.
The assignment is indicated using `:=`,
other languages use a single equals sign `=`.

The keyword `var` states that we are binding a variable to the *heap*.
Dafny,
however,
supports immutable data structures.
Which means that some variables cannot be mutated.

The compiler will not complain when you do.

The type annotation `: int` is optional,
as long as the compiler can work the type of the value.
For example:

```
var j := 0;
```

Type inference is not always possible in Dafny.
Fortunately the compiler will complain when it is not.
What happens when you enter the following code:

```
method Test()
{
  var empty := [];
}
```

Remember the RHS of the assignment can be an expression.

```
i := 1 + 1;
```

## Idris

Let-Bindings in Idris allocate memory to the stack,
(By default *all* data structures are immutable.)

Let us look at them:

```
let i = 0 in ...
```

Let-bindings are expressions and state that a bound variable
(`i`)
will exist in the remainder of the expression
(the stuff after the `in` part).

Idris can infer the type of let-bound variables in specific circumstances,
especially when the type is simple.
Otherwise,
you can provide an annotation:

```
let i : int in ...
```


::: information
Idris does in fact support heaps through `Ref` types.
Knowledge of Idris' heap is beyond the scope of these notes.
Regardless they should only be used in limited and specific circumstances.
:::

## Coda

We have looked at binding,
but we still need to place things in the binders.
The next section looks at
[expressions](/basics/expressions.html)
the simplest thing we can bind.
