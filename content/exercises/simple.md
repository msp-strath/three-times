---
title: "Simple Programming"
---

Here are some simple exercises for simple programming.

1.  Construct the following programs:
    1.  A check sum function that takes input three integers
        (`a`, `b` and `c`)
        and returns a boolean value if $a + b = c$
    2.  A check divisible function that takes as input two integers
        (`a` and `b`)
        and returns a boolean values if `a` is not divisible by `b`.
    3.  A max function that returns the maximum of two **numbers** `a` and `b`.
    4.  A min function that returns the minimum of two **numbers** `a` and `b`.

2.  Construct the following programs:
    1.  A program that computes the factorial for a given input `n`
        i.e. multiples all the numbers less than or equal to `n`.
    2.  A program that computes the **even** factorial
        (multiplies the even numbers only)
        for a given input `n`.
    3.  A program that computes the **odd** factorial
        (multiplies the odd numbers only)
        for a given input `n`.

3.  Construct a program that calculates the $n^{th}$ number of the fibonacci sequence.

4.  Construct a program that computes the combinatorial of two integers `n` and `m`,
    as given by:

    $$\frac{n!}{(m!\times(n-m)!)}$$

    This program should return an error if $n < m$.

    **Hint**
    : Think how you will encapsulate/report/handle the error

5.  Construct a program that returns a string message if the user supplied year **is** a leap year.

6.  Construct a program that returns true if a given number is prime.

7.  Construct a program that,
    given a list `xs` and an integer `n`,
    will keep only the first `n` elements in `xs` and throw away everything after that.
    If there are less than `n` elements then the entire list should be returned.

8.  Construct a program that will merge two lists,
    `xs` and `ys`,
    together by alternating elements from each list.
    If one of the lists runs out of elements first then the remaining elements comes from the other list.

9.  Construct a program that will drop every second element from a list.

10. Construct the following programs that will compute the dot product of two lists `xs` and `ys`,
    that contain real numbers.

    The dot product is the sum of multiplication of each element in `xs` by elements in `ys`.
    Should one list be longer than the other you must either:
    truncate the longer list,
    or right-pad the short list with 0s.
