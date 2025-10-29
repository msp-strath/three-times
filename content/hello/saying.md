---
title: "How to Say Hello"
toc: true
---

Previously,
we saw how to write our first program.
Let us now *run* that program and say hello!

## Python

Python is an *interpreted* language.
We can *run* python programs by invoking the python interpreter with the files.

Assuming that our program from the previous topic is in a file named `Hello.py` we can say hello as follows:

```
$ python3 Hello.py
```

Which will return the following output:

```
Hello World
```

If you check the contents of your directory,
there will be no additional files.

### Checking

Remember that Python is dynamically typed,
and type hints enable static checking of python programs.

*If* you have `mypy` installed,
or another python type checker.
You can check that `Hello.py` is 'correct' as follows:

```
mypy Hello.py
```

which will return:

```
$ mypy code/hello/Hello.py
Success: no issues found in 1 source file
```

## Dafny

Dafny is a compiled language.
We generate an executable using the `dafny` compiler:

```
$ dafny build Hello.dfy
```

After a while,
the compiler will return with:

```

Dafny program verifier finished with 0 verified, 0 errors

```

If we examine the contents of our directory we will see the build artefacts:

```
$ ls
Hello  Hello.cs  Hello.csproj  Hello.deps.json  Hello.dfy  Hello.dll  Hello.pdb  Hello.runtimeconfig.json  obj
```

The first one is our executable with can be innvoked as:

```
$ ./Hello
Hello World%
```

:::exercise
The `%` sign is unexpected.
This is because Dafny is expecting the output string to have a newline `\n`.
Can you fix `Hello.dfy` to display a newline?
What is the output you now get?
:::

### Building & Running

Dafny can compile **and** execute your code with the `run` command:

```
$ dafny run Hello.dfy

Dafny program verifier finished with 0 verified, 0 errors
Hello World%
```

## Idris

Finally, Idris.
Like Dafny,
Idris is a compiled language.
We generate an executable using the `idris` compiler:

```
$ idris2 Hello.idr -o hello
```

which produces the following output:

```
```

For *this* program,
successful compilation produces no output.

If we examine the contents of our directory we will see the build artefacts:

```
$ ls
build Hello.idr
```

The directory `build` is where Idris stores *all* the build artefacts.
You will find the executable `hello` in `ls build/exe`:

```
$ ls build/exec
hello  hello_app
```

You can run the executable as normal.

```
$ ./build/exec/hello
Hello World
```

## Coda

We have now shown you how to write and say hello.
