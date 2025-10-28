---
title: An Introduction
toc: true
---

Principally,
'Three Times' is a teaching
(maybe later a research)
project to transfer concepts from mainstream programming languages to verification-aware ones.

These pages provide a set of notes and MCQs,
provided as pre-reading material for
[CS886](https://classes.myplace.strath.ac.uk/course/view.php?id=28878),
which is provided as part of the curriculum for the Postgraduate MSc degree
[CyberSecurity](https://www.strath.ac.uk/courses/postgraduatetaught/msccybersecurity/)
at the
[University of Strathclyde](https://www.strath.ac.uk/science/computerinformationsciences/).

Please send comments and questions to
[Jan de Muijnck-Hughes](mailto:jan.de-muijnck-hughes@strath.ac.uk)
([`WWW`](https://tyde.systems)).

Note
: the raw materials for these pages will be made available at a later date.

## Why 'Three Times'?

With
[CS886](https://classes.myplace.strath.ac.uk/course/view.php?id=28878),
we aim to teach secure-by-design programming using two verification-aware languages:
[Dafny](https://dafny.org/)
(a multi-paradigm language)
and
[Idris](https://idris-lang.org)
(a functional language with dependent types).

We acknowledge that both Idris and Dafny are relatively *esoteric* languages:

+ Both are not widely known;
+ Both use concepts students will not have seen before;

Such that student 'strangeness budgets' will be blown for various reasons when teaching CS886.

Thus,
to enable teaching basic verification,
students should also be familiar with how to program in these languages.
Although there are textbooks to engage students,
a more dedicated resource will help reduce the learning curve and fear of going through an existing 'textbook'.
This resource will help students learn how to *programme* in Dafny and Idris.

Borrowing heavily from the idea of *Concept Transfer*
[@10.1145/3372782.3406270],
we will look at shifting students from a comfortable point of knowledge
(i.e. the language they use most)
through to the language that is most strange:
Idris.
To help with this,
we will use Dafny as a staging post that pushes students into that liminal space of comfortable but strange.

## Assumptions

We need,
however,
a point of reference.
As such,
we assume that many students will have Python(3) as their primary language of instruction/use,
and that students will be comfortable with imperative languages in the first instance.

Importantly we assume that you will be familiar with:

0. Writing simple methods, calling them too;
1. Binding variables to identifiers;
2. Control flow using conditional statements, while loops, for loops;
3. Logical operations on booleans;
4. Working with lists and other data structures;

in Python.

## Learning Outcomes

By the end of this material we hope that you will be familiar with:

0. Writing simple methods, calling them too;
1. Binding variables to identifiers;
2. Control flow using conditional statements, while loops, for loops;
3. Logical operations on booleans;
4. Working with lists and other data structures;

in Dafny and Idris.

## Topics

This minicourse is split into `X` topics,
and each topic *should* correspond to a bitesize chunk of language learning.
We will guide you through the basics,
and pepper the material with simple MCQs to help provide formative feedback and miniexercises to help stimulate your learning.

For each concept we want to discuss we will do it **three times**:

1. In Python
2. Then Dafny
3. Then Idris

> **Note**
> :  that not all concepts will be a direct transfer from one language to the other.

At the end of these notes are a series of larger exercises taken from,
gifted,
from Strathclyde's own:

> CS260 Functional Thinking

Although we list the topics below,
they are also listed in the sidebar to the left (`<-`).
