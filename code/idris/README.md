# CS886 Idris Basics

In these files we will provide a gentle introduction to Idris,
supporting a literate style of programming. We will use code comments
to help describe the code and what bits and pieces mean.

## What is Idris.

Idris(2) is a general purpose functional programming language that
supports:

+ Dependent types


We write Idris programs in a functional style, and leverage dependent
types to reason about the code.

It is important to note that these files will cover the core aspects of
Idris that is required for the course.

The Week 3 files will cover the core aspects of Idris required for
verification.

Any other features required for the course that are not documented
here will be introduced as required during the module.

Please see the Week 3 materials for guides on using Idris2.

## Assumptions

Like the Dafny quick guide, we will assume that you will have some
experience programming, and will be comfortable with imperative
languages in the first instance.

Importantly you will be familiar with:

1. Binding variables to identifiers;
2. Control flow using conditional statements, while loops, for loops;
3. Logical operations on booleans;
4. Working with lists and other data structures;

## The Roadmap

`Functional.idr`
:   Basic Functional Programming;

`Datatypes.idr`
:   Datatypes;

`HoF.idr`
:   Higher Order Functions

`Effectful.idr`
:   dealing with the outside world;

## Notes

Idris' syntax ostensibly takes from the Haskell-family of languages,
with differences here and there. Where possible we will explain the
differences.

Idris comments are Haskell-style with:

```
{- [ NOTE ]

   + single line comments marked `--`;
   + block comments starting with `{-` `-}`;

   + doc comments are `|||`
-}
```

## Your copy

You can find these files *unmodified* on MyPlace in the Guides section.
