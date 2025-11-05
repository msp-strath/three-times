---
title: "Conditionals"
toc: true
---

We continue our journey into programming basics by looking at simple control flow using *conditionals* statements and expressions.
Common to all realisations of conditions is that we can control the execution flow of our program based on a boolean value.
That is,
*if* the value is `true` *then* flow one way *else* go the other.

## Python

Python supports conditional statements in three forms:
*single branch*---where only the `true` branch is considered for a single conditional test;
*two branch*---where there is a `true` and `false` branch for a single conditional test;
and
*multi-branch*---where there are multiple tests to consider.

An example of a single branch is as follows:

```
if i >= 0:
  return True
```

If the integer `i` is greater than `0` then the method will return `true`.
Note,
however,
that in this example the `return`-statement halts further execution after the conditional.
If there was no `return`-statement then control flow will then execute the code after.

An example of a simple two branch conditional is:

```
if i >= 0:
  return True
else:
  return False
```

Again,
if there was not `return`-statement then the code after the conditional will be executed.


Let us now look at multi branch conditionals,
which differ by incorporating different conditional tests at each branching opportunity.

```
if i < j:
   print("less than")
elif i > j:
   print("greater than")
else:
   print("equal")
```

The keyword `elif` signifies that we wish to perform another test.

Finally,
Python also supports *ternary*-expressions,
conditionals that one can embed in your program where an expression is expected.
Ternary expressions,
in python,
take the form `<true branch> if <test> else <false branch>`.
For example:

```
result = i + i if i >= 0 else i
```

## Dafny

Like Python,
Dafny supports conditional statements in three forms:
*single branch*---where only the `true` branch is considered for a single conditional test;
*two branch*---where there is a `true` and `false` branch for a single conditional test;
and
*multi-branch*---where there are multiple tests to consider.

An example of a single branch is as follows:

```
if i >= 0 {
  return true;
}

```

If the integer `i` is greater than `0` then the method will return `true`.
Note,
however,
that in this example the `return`-statement halts further execution after the conditional.
If there was no `return`-statement then control flow will then execute the code after.

An example of a simple two branch conditional is:

```
if i >= 0 {
  return true;
} else {
  return false;
}
```

Let us now look at multi branch conditionals,
which differ by incorporating different conditional tests at each branching opportunity.

```
if i < j {

   print "less than";

} else if i > j {

   print "greater than";

} else {

   print "equal";

}
```


Finally,
the functional fragment of Dafny supports conditional *expressions*.
As with any expression,
we can embed them in your program where any expression is expected.
Conditional expressions take the form:

```
if i >= 0
  then true
  else false
```

With conditional expressions,
we *need* to provide both cases  explicitly.
Further,
notice the lack of braces to indicate scope.
Conditional expressions can also support multiple branches:

```
if i < j
  then "less than"
  else if i > j
       then "greater than"
       else "equal"
```

## Idris

Remember that Idris is a functional language,
therefore there are only expressions.
Idris' conditional syntax is the same as for Dafny.

```
if i >= 0
  then True
  else False
```

Even for multiple branches:

```
if i < j
  then "less than"
  else if i > j
       then "greater than"
       else "equal"
```

## Coda

Booleans support simple branching within programs based on a boolean value.
Later on in this course we will see how
[enumerations and matching](/datatypes/enums.html)
generalise booleans and conditional control flow,
enabling more subtle and advanced control flows to be realised.
Before that,
however,
the next few sections will demonstrate other common control flow patterns.
Namely,
[functions/methods](/basics/blocks.html);
[loops](/basics/loops.html);
[iterators](/basics/iteration.html);
and
[recursion](/basics/recursion.html).
