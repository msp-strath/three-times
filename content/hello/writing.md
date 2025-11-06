---
title: "Writing Hello World"
toc: true
---

Our first program will be one that displays the words `Hello World` to the console.
Let us write that program.


## Python

If you are familiar with Python then there are two ways to say 'hello'.
Both require that we specify our program's *main entry point*,
the part of the program where it all kicks-off.

Within python this is not a 'main method', rather it is a name check.

See the following:

```
if __name__=="__main__":
    print("Hello World")
```

When interpreting this file,
the interpreter checks to see if *this* file is the main one being launched or if the file is being imported from another module.
If the check returns `true` then the code in the `true`-branch is executed:
Otherwise nothing happens.
It is this `true`-branch which represents the programs main point of entry.
Here,
the code sends the string `"Hello World"` to standard out.

We can use the `true`-branch to obtain system arguments that are then passed to a 'main' method.
The main method being the top-level code representing your programs entry point.
Take,
for example,
the following:


```
def main():
  print("Hello World")

if __name__=="__main__":
    # Do stuff, like fetch system arguments
    main()
```

We can also obtain system arguments in the main method itself.
Regardless,
it is common to have a distinct 'main' method that is called from the name check.

## Dafny

Let us now move to Dafny.

```
method Main()
{
    print "Hello World";
}
```

It is with no surprise that the main entry point for Dafny is a *method* called 'Main',
and that this method returns nothing.
You will see,
from the C-like syntax,
that there is a *method prototype*,
and *method body*.
The prototype tells us the method's *specification*,
and the body details the method's implementation.

::: important
Notice how the name is capitalised.
This is an important convention in Dafny.
All *method* names should be in this form.
:::

Much like our python code,
we have used `print` to display `"Hello World"`.
Notice that there are no parentheses,
and an explicit semicolon (`;`).
Within Dafny,
`print` is a builtin operation and not a method call.


## Idris

Finally,
let us move to Idris.

```
main : IO ()
main = putStrLn "Hello World"
```

As you may have guessed,
Idris' main *function* is called `main`!
You will notice that the syntax is different from Dafny and Python.
Idris' syntax is inspired by Haskell.
The first line is called the function (type) *signature*,
and the second line is the function *body*.

<aside>
Both Python and Dafny have signatures and implementations,
(prototypes and bodies)
but we will explore those more when we talk about [methods and functions](#).
</aside>

Much like a method prototype,
the signature tells us the function's *specification*.
i.e. what the function's inputs and outputs are.
This is everything after the colon (`:`).
Which for `main` is that there are no arguments.

The interesting thing is the return type `IO ()`,
which means that we are in the `IO`
(Input/Output)
computation context and we are returning the Unit type.
The `IO` computation context enables reasoning about interacting with the outside world in a purer way.
Things can go wrong,
but `IO` helps us sequence computations gracefully and purely.

The function body,
provides an *implementation* to the specification.
Like the previous two examples,
our body sends the string `"Hello World"` to standard out.
In this case we have used `putStrLn`,
this is also an effectful function.
Idris also offers functions `printLn` which 'prints' a string to standard out
(together with quotation marks),
and `putStr` which does not end the string with a newline character.

::: note
You will not need to know how to interact with the real world for CS886 or for the remainder of these notes.
We provide a small example as it does appear in the project stubb for the assignment,
but we take care of its use for you.
:::

## Coda

This topic has looked at *writing* how to say hello.
In the next topic will look at *saying* hello.
