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
[CS886](https://personal.cis.strath.ac.uk/jan.de-muijnck-hughes/cs886/),
which is provided as part of the curriculum for the Postgraduate MSc degree
[CyberSecurity](https://www.strath.ac.uk/courses/postgraduatetaught/msccybersecurity/)
at the
[University of Strathclyde](https://www.strath.ac.uk/science/computerinformationsciences/).

Strathclyde Students
(and Employees)
can visit the
[MyPlace Place page](https://classes.myplace.strath.ac.uk/course/view.php?id=28878)
for more information about CS886.

<aside>
At a later date,
I may point to publicly accessible resources for cs886.
</aside>

Please send comments and questions to
[Jan de Muijnck-Hughes](mailto:jan.de-muijnck-hughes@strath.ac.uk)
([`WWW`](https://tyde.systems)).
The source code for 'Three Times' is available on the
[MSP GitHub](https://github.com/msp-strath/three-times).

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
+ Both use concepts students may not have seen before;

Such that,
when teaching CS886,
'student strangeness budget' will be blown for various reasons.

To enable teaching of basic verification,
students should also be familiar with how to program in these languages.
Although there are textbooks to engage students on each language separately,
a more dedicated resource will help reduce the learning curve and fear of going through an existing 'textbook'.
Principally,
this resource will help students learn how to *program* in Dafny and Idris.

Borrowing heavily from the idea of *Concept Transfer*
[@10.1145/3372782.3406270],
we will look at shifting students from a comfortable point of knowledge
(i.e. the language they use most)
to a new one.

Python is our base of reference,
in which we assume students are comfortable in.
Other languages such as Java, Kotlin, PHP are okay, however, we need to pick one!
We assume that Dafny is the middle language that has the 'least' difference from Python
(both are imperative).
Through Dafny we can push students comfortably into that liminal space of learning to program in a slightly different language.
Dafny,
however,
also supports functional programming.
As such,
Dafny is a stepping stone
(bridging language)
to the functional world of functional programming.
As Idris is where the strangness budget will be blown completely.

Our end goal is for students to be comfortable,
with programming in all three languages.
Specifically we want students to be at the level of a first/second year university student.


With this in mind,
we will expose students to various programming concepts **three times**:
first in Python;
then in Dafny;
and
finally in Idris.

::: note
Where there is no one-to-one mapping between all three languages,
we will skip them as required.
:::

## Assumptions

To reiterate,
we assume that many students will have Python(3) as their primary language of instruction/use.
And we assume that students will be comfortable with imperative languages in the first instance.

Importantly we further assume that you will be familiar with:

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

This minicourse is split into several topics,
and each topic *should* correspond to a reasonable chunk of language learning.
With each topic there are sections that should represent some 'bitesized' learning.

We will guide you through the basics,
and
(will eventually)
pepper the material with simple MCQs to help provide formative feedback and miniexercises to help stimulate your learning.

At the end of these notes are a series of larger exercises gifted from Strathclyde's own:
**CS260 Functional Thinking**.

**[Hello world](/hello.html)**
:   Demonstrating how to
    [write](/hello/writing.html)
    and
    [run](/hello/running.html)
    a simple program in each language.

**[Basic Programming](/basics.html)**
:  Demonstrating basic programming concepts such as:
   [binding](/basics/binding.html);
   [conditions](/basics/conditionals);
   and
   control flow.

**[Datatypes](/datatypes.html)**
:  Demonstrating the various ways in which we can specify,
   and work with,
   structured data.

**[Generic Programming](/generic.html)**
:  Demonstrating the various ways in make our code more generic and reduce repetition.

We also provide a series of
[addendums](/addendum.html)
detailing some interesting topics.

## Thanks

Thanks to Bob Atkey for delivering a set of very impressive interactive notes for [CS208](https://personal.cis.strath.ac.uk/robert.atkey/cs208/).
I have stolen many a good idea from them!
