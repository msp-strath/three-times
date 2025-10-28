---
title: "A Tale of Three Languages"
toc: true
quiz: true
---


All three languages are *very* featured,
to that end we limit our look to fundamental aspects of the language as required for the course.

In this initial topic we will provide an overview of the *programming* features of Python(3), Dafny, and Idris(2).


## Python

Here we summarise the *programming features* of Python(3).

Python is a multi-paradigm language that supports:

+ Imperative programming using statements and expressions, and is
  effectful (allowing printing and communication with the outside
  world);

+ Functional programming using lambdas;

+ Object Oriented programming using classes that support inheritance;

We can write our programs using any of these paradigms,
however,
by default imperative programming is the norm.

Moreover Python has

+ Indentation based syntax, with statements and expressions

And Python is:

+ gradually typed, mixing dynamic typing with static analysis using type hints.

As a language,
Python is very rich and supports much more functionality.

**Note**
:  Python supports typing *hints*,
   typing information that is not checked at runtime.
   Tooling such as `mypy` can use these hints for static analysis.
   These hints,
   however,
   are dropped at runtime!
   Typing annotations are checked at both compile and runtimes.

Also Python uses `#` for block and line comments.

## Dafny

Here we summarise the *programming features* of [Dafny](https://www.dafny.org).

Dafny is:

+ Multiparadigm, supporting imperative, functional, and Object-Orientation

We can write our programs using any of these paradigms, however, by
default Imperative programming is core.


+ statically typed, with support for type inference

+ Different syntax for imperative and functional programming
  + Imperative supports C/C#-style syntax complete with statements and expressions
  + Functional language is almost C-style but only expressions

As a language, Dafny is very rich and supports other functionality
such as traits (think interfaces).

This minicourse covers the core aspects of
Dafny that is required for *programming*.

Any other features required for the course that are not documented
here will be introduced as required during the module.
Specifically, Week 2 in CS886 will begin looking at using Dafny for verification.

The reference guide for Dafny is available here:

<https://dafny.org/latest/DafnyRef/DafnyRef>

Dafny's syntax takes from the C-family of languages,
with differences here and there.
Where possible we will explain the differences.

Also Dafny uses:

+ single line comments marked `//`;
+ block comments starting with `/*` `*/`;

### Guides

Some programming guides for Dafny:

+ [The Online Tutorial](https://dafny.org/dafny/OnlineTutorial/guide.html)

+ [Program Proofs](https://program-proofs.com/)

+ [Dafny Documentation](https://dafny.org/latest/toc)

## Idris

Here we summarise the *programming features* of [Idris](https://idris-lang.org).

Idris(2) is a general purpose functional programming language that
supports:

+ Dependent types

We write Idris programs in a functional style,
only expressions,
and use dependent types to reason about the code.
Like Dafny,
Idris is statically typed with limited type inference

Idris' syntax ostensibly takes from the Haskell-family of languages,
with differences here and there. Where possible we will explain the
differences.

These files will cover the core aspects of
Idris that is required for the course.

Any other features required for the course that are not documented
here will be introduced as required during the module.

Also Idris uses:

+ single line comments marked `--`;
+ block comments starting with `{-` `-}`;

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
