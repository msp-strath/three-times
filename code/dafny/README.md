# CS886 Dafny Basics

In these files we will provide a gentle introduction to Dafny,
supporting a literate style of programming. We will use code comments
to help describe the code and what bits and pieces mean.

## What is Dafny.

Dafny is a multi-paradigm language that supports:

+ Imperative programming using statements and expressions, and is
  effectful (allowing printing and communication with the outside
  world);

+ Functional programming using expressions and side-effect free code;

+ Object Oriented programming using classes that support inheritance;

We can write our programs using any of these paradigms, however, by
default Imperative programming is core.

As a language, Dafny is very rich and supports other functionality
such as traits (think interfaces).

It is important to note that these files will cover the core aspects of
Dafny that is required for the course.

The Week 2 files will cover the core aspects of Dafny required for
verification.

Any other features required for the course that are not documented
here will be introduced as required during the module.

The reference guide for Dafny is available here:

https://dafny.org/latest/DafnyRef/DafnyRef

## Assumptions

For these files we will assume that you will have some experience
programming, and will be comfortable with imperative languages in the
first instance.

Importantly you will be familiar with:

1. Binding variables to identifiers;
2. Control flow using conditional statements, while loops, for loops;
3. Logical operations on booleans;
4. Working with lists and other data structures;

## The Roadmap

`Imperative.dfy`
:   Imperative Programming

`Functional.dfy`
:   Functional Programming

`Datatypes.dfy`
:   Datatypes and Object-Oriented Programming

## Notes

Dafny's syntax ostensibly takes from the C-family of languages, with
differences here and there. Where possible we will explain the
differences.

Dafny comments are C-style with:

```
/* [ NOTE ]



   + single line comments marked `//`;
   + block comments starting with `/*` `*/`;

 */
```

## Your copy

You can find this file *unmodified* on MyPlace in the Guides section.
