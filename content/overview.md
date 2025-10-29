---
title: "A Tale of Three Languages"
toc: true
quiz: true
---

In these notes we are looking at three languages:
Python,
Dafny,
and
Idris.
All three languages of these languages are *very* featured.

In this initial topic,
we will provide an overview of the *programming* features of Python(3), Dafny, and Idris(2).
CS886 itself will delve into the verification side.
Within these notes we will explain more features as we go,
but still features required for programming.


## Python

[Python](https://www.python.org/)
is a well-known,
long-standing,
widely-used
programming language.
As a multi-paradigm language,
Python supports:

+ Imperative programming using statements, methods, and expressions.

+ Effectful programming at will,
  supporting printing and communication with the outside world at will within your programs;

+ Object Oriented programming using classes that support inheritance,
  and duck typing to define interfaces for describing methods that objects support;

+ Functional programming using lambdas;

We can write our programs using any of these paradigms,
however,
by default imperative programming is the norm.

Python is also an *interpreted* language,
meaning that programs are executed on the fly.

Python is dynamically typed.
The types of our values, expressions, and statements are checked at runtime.
In fact Python is *gradually typed*.
Supporting typing hints that static analysis tools,
such as `mypy`,
can use to check that type-hinted and non-type-hinted code are well-typed.

::: important
These hints,
however,
are dropped at runtime!
Typing annotations are checked at both compile and runtimes.
:::

On the surface,
Python has indentation based syntax, with-statements, pattern matching, decorators,
Python uses `#` for block and line comments.

As a language,
Python is very rich.
We will not go beyond the basics in these notes.

## Dafny

[Dafny](https://www.dafny.org)
is an industry backed verification-aware programming language.
Originally developed at Microsoft research,
Dafny is championed by Amazon and has been used in developing products at both companies.
Like Python,
Dafny is too a multi-paradigm language supporting:

+ Imperative programming using statements, methods, and expressions.

+ Effectful programming at will,
  supporting printing and communication with the outside world at will within your programs;

+ Object Oriented programming using classes that support inheritance;
  traits to define the methods that objects must support;

+ Functional programming using functions and expressions

+ Static typing,
  meaning that all values, expressions, and statements must be typed
  (types can be inferred)
  and those types are checked at compile time;


The syntax for functions and imperative programs are separate.
The imperative fragment of Dafny takes from `C`/`C#`-style languages complete with statements and expressions.
The functional fragment is almost C-style but supports only expressions.
Although we can write our programs using either syntax,
by default imperative programming is the **main** language.

Dafny uses:

+ single line comments marked `//`;
+ block comments starting with `/*` `*/`;

::: warning
Although the functional and imperative syntax are separate,
there is some overlap between them!
:::

Unlike Python,
Dafny is a *compiled* language meaning we compile our programs down to an executable from which we can run our programs.
In fact,
Dafny supports *Multi-language code generation*,
enabling Dafny programs to be 'compiled' down to different languages.
For example,
the Dafny compiler can create versions of your program in `C#`,
Python,
GO,
and Rust.

Interestingly,
Dafny is also a *termination*-aware language.
This means that Dafny will check to see if your programmes are likely to terminate.
Dafny,
however,
will let you wrote programs that are non-terminating.

As a language, Dafny is very rich and supports other functionality we will not mention here.
We will not explore all of what Dafny has to offer here nor in CS886.
Any other features required for CS886,
that are not documented here,
will be introduced as required during the module.

### Guides

Some programming guides for Dafny:

+ [**The** Reference Guide](https://dafny.org/latest/DafnyRef/DafnyRef)

+ [The Online Tutorial](https://dafny.org/dafny/OnlineTutorial/guide.html)

+ [Program Proofs](https://program-proofs.com/)

+ [Dafny Documentation](https://dafny.org/latest/toc)

## Idris

[Idris](https://idris-lang.org)
is a research-backed verification-aware programming language.
Originally developed at the University of St Andrews,
Idris is a general purpose functional programming language that
supports dependent types.
(We will talk about them more in CS886.)
Since its inception Idris has gone through at least one major change,
Idris(2) improved the Idris language by supporting quantities
(we will talk about them more in CS886)
and made Idris(2) self-hosting.
In these notes we will talk about features common to all Idris versions,
and thus refer to Idris(2) as just Idris.

Unlike Python and Dafny,
Idris is not a multi-paradigm language.
Idris is a:

+ *functional programming language*,
  supporting expressions and functions;

  Dependent types enables types to depend on values which we use to reason about code.
  Again,
  CS886 delves into this aspect of Idris.

+ *pure language*,
  which means we are **not** free to communication with the outside world at will;
  if we wish to communicate with the outside world
  (i.e. printing and reading)
  then we have to do so under controlled conditions;

+ *total language*,
  which means that the compiler is equipped with various checkers to reason about program execution,
  namely, coverage and totality.
  We will look at what coverage is when we look at [pattern matching](#).
  The totality checker,
  will check to see if your programmes are likely to terminate,
  and will prevent you from compiling partial programmes.
  (We can control what Idris checks.)

+ *statically typed*,
  like Dafny,
  Idris is statically typed,
  meaning types are checked at compile types;
  unlike dafny, Idris has more limited type inference (due to dependent types);

Idris' syntax ostensibly takes from the Haskell-family of languages,
with differences here and there.
Where possible we will explain the differences.

Idris uses:

+ single line comments marked `--`;
+ block comments starting with `{-` `-}`;

Like Dafny,
Idris is too a *compiled* language meaning we compile our programs down to an executable from which we can run our programs.
Also like Dafny,
Idris supports *multi-language code generation*,
enabling Idris programs to be 'compiled' down to different languages.
For example,
the Idris compiler can create versions of your program in
Chez Scheme,
Racket,
Javascript,
Java,
PHP,
and
Python

As a language,
Idris is relatively simple.
The compiler,
and other features of the language implementation,
however,
is rich with functionality.
We will not explore all of what Idris has to offer here nor in CS886.
Any other features required for CS886,
that are not documented here,
will be introduced as required during the module.

### Guides

Some programming Guides for Idris are:

+ [A Crash Course in Idris2](https://idris2.readthedocs.io/en/latest/tutorial/index.html), Sections 1-7,9,11+;

  The Idris2 'crash course' is a useful quick introduction to the core concepts of dependently typed programming.
  The introduction,
  however,
  was designed primarily for those with a background in functional programming a la Haskell.
  So some parts may not be overfully familiar.

+ [The Idris Communities' Idris Tutorial](https://idris-community.github.io/idris2-tutorial/)

  This tutorial provides a 'comprehensive' resource for learning Idris2.
  Please be aware that this tutorial is not necessarily geared towards the novice programmer
  nor those unaware of programming in a functional language.

+ [The Idris Book](https://www.manning.com/books/type-driven-development-with-idris)

  The Idris book provides a long and gentle introduction to functional programming in a dependently-typed language.
  I acknowledge that reading it appears to be a lot of work,
  but the long and gentle introduction will help with your understanding.
  Especially if you are new to functional programming.

  *Please note* that the Idris book was written for Idris1,
  we are using Idris2.

  For differences between the book and Idris2 please see:

  + <https://idris2.readthedocs.io/en/latest/typedd/typedd.html>

  Generally speaking,
  the Idris book covers all the material that we will need for your learning of Idris during the course.

## Quiz

We end this initial topic with a short quiz.

```{=html}
<iframe id="quiztarget"
        src="/quiz/overview.html"/>
```
