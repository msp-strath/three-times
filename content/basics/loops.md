---
title: "Loops"
toc: true
---

[Conditionals](/basics/conditionals.html)
support branching in control flow.
What if,
however,
we want to repeat the same task again and again.
Loops are a key control flow structure that supports this.
Generally speaking,
loops enable one to repeat one's code based on a boolean termination condition.
Loops come in two forms:
*Do-until* loops which perform an action and then look to repeat it by performing a test
i.e. *do this then repeat if test is true*;
and
*While* loops which perform a test and then looks to perhaps perform an action
i.e. *while test is true then repeat*.

## Python

Python *only* supports while loops, which take the form:

```
while <condition>:
    <body>
```

For example,
here is a while loop to sum the integers from 0 to 100:

```
result = 0
counter = 0

while counter <= 100:
  result += counter
  counter += 1
```

With while loops we have to provide an explicit test.

Beware that the condition expects a boolean value that holds true.
Thus,
we can create an infinite loop rather easily.


```
while True:
  print("Forever")
```

Python supports the keywords:

`continue`
: to advance to the next iteration of the loop;

`break`
: to exit from the iteration completely;

We can use `break` to rewrite our while loop from earlier as:

```
result = 0
counter = 0

while True:
  result += counter
  counter += 1
  if counter > 100:
    break
```

Notice that placement of the conditional,
and its semantics,
will affect the number of loops performed.
In the example above,
the test is performed after the actions we wish to repeat.
Effectively, making this a do-until loop.

## Dafny

Like Python,
Dafny *only* supports while loops as statements.
Which means that the functional fragment of Dafny does not support looping.
(To 'loop' in Dafny's functional fragment, we will need
[recursion](/basics/recursion.html).)

While loops take the form:

```
while <condition> {
    <body>
}
```

For example,
here is a while loop to sum the integers from 0 to 100:

```
var result := 0;
var counter := 0;

while counter <= 100
{
  result := result + counter;
  counter := counter + 1;
}
```

With while loops we have to provide an explicit test.

Beware that the condition expects a boolean value that holds true.
Thus,
we can create an infinite loop rather easily.


```
while True
{
  print "Forever";
}
```

Dafny will infact complain about this loop and refuse to compiler,
producing the following error:

```
cannot prove temination; try supplying a decreasing clause for the loop
```

While Dafny is not a total language,
it supports reasoning about program termination.
Within CS886,
we will see how we can do this in CS886.
To show a snippet let us first look at how to exit and advance loops.

Like Python,
Dafny also supports the keywords:

`continue`
: to advance to the next iteration of the loop;

`break`
: to exit from the iteration completely;

We can use `break` to rewrite our while loop from earlier as:

```
result = 0
counter = 0

while true
{
  result := result + counter;
  counter := counter + 1;
  if counter > 100 {
    break;
  }
}
```

Notice that placement of the conditional,
and its semantics,
will affect the number of loops performed.
In the example above,
the test is performed after the actions we wish to repeat.
Effectively, making this a do-until loop.

Like our previous infinite loop,
Dafny will complain that this loop is not total.
We can make this loop total by rewriting the counter semantics to count *down*

```
result := 0;
counter := 100;

while true
{
  result := result + counter;
  counter := counter - 1;
  if counter > 0 {
    break;
  }
}
```

Counting down demonstrates,
to the compiler,
that we will eventually terminate.

## Idris

Idris is a functional language using expressions.
As with Dafny's functional fragment,
we will can only repeat expressions using
[recursion](/basics/recursion.html).

## Coda

Loops are an important imperative control flow operation.
[Iterators](/basics/iteration.html)
are bespoke statements that enable repetition when iterating over specific data structures.
The repetition provided by Loops is based on tests.
We will look at iterators next,
before looking at [Recursion](/basics/recursion.html) which provides *a* generalised way to repeat one's actions.
