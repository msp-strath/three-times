---
title: "Datatypes"
---


1.  Consider the following Python3 code for representing natural numbers:

    ```{.python}
    from dataclasses import dataclass

    @dataclass
    class NonZero:
        succ : Nat

    Nat = NonZero | None

    def add(x : Nat, y : Nat) -> Nat:
        match x:
            case None:
                return y
            case NonZero(succ):
                return NonZero(add(succ,y))

    def mul(x : Nat, y : Nat) -> Nat:
        match x:
            case None:
                return None
            case NonZero(succ):
                return add(y,mul(succ,y))
    ```

    1.  Write a program that computes the exponent of two natural numbers.
    2.  Write a program that computes the factorial of a natural number.
    3.  Write a program that computes the absolute value of an integer and returns a natural number.

    For Idris and Dafny,
    you will need convert the provided python program.

2.  Write a datatype that that represents the days of the week.
    1.  Write a program called `nextDay` which computes the next day of the week.

    2.  Provide programs that compare days of the week for equality and comparison.

        You can use Python's, Dafny, and Idris own comparison techniques i.e. `__lt__`, or `Ordering`.

        1.  Write a program that takes as input a day of the week,
            and  returns a boolean if the day is a workday in Europe.

        2.  Write another program that takes as input a day of the week,
            and returns a boolean if the day is a workday in the Middle East.

        3.  Combine your answers so that your provide a single function,
            that takes as additional input a function that defines if a day is a work day or not.

3.  Consider the following Python code for representing arithmetic expressions:.

    ```{.python}
    from collections.abc import Callable
    from dataclasses import dataclass
    from typing import TypeVar, Generic

    @dataclass
    class Mul[T]:
        lop : Calc[T]
        rop : Calc[T]

    @dataclass
    class Add[T]:
        lop : Calc[T]
        rop : Calc[T]

    @dataclass
    class Sub[T]:
        lop : Calc[T]
        rop : Calc[T]

    @dataclass
    class Val[T]:
        op : T

    type Calc[T] = Val[T] | Add[T] | Mul[T] | Sub[T]

    def eval[T](toInt : Callable[[T],int], expr : Calc[T]) -> int:
        pass
    ```

    For Idris and Dafny,
    you will need convert the provided python program.

    1.  Complete the definition of `eval`.
    2.  Write a program that evaluates expressions based on integers:

    ```{.python}
    def applyInt(expr : Calc[int]) -> int:
      pass
    ```

    3.  Extend your implementation to work with division.

        What happens if you divide by zero?
        Ensure that your implementation fails safely when dealing with such errors.

    4.  Extend your implementation to work with Natural numbers as defined earlier in the exercises.

    5.  Write a program that uses `Calc` to compute the factorial of a value using `Calc` expressions.

    6.  Try and reduce the number of constructors/classes in your implementation.

4.  Write a generic datatype,
    paramterarised by an abstract type,
    which has the following constructors/classes:

    -   `Empty`, representing an empty list;
    -   `Node`, representing an element with a value;
    -   `Skip`, representing an empty element.

    Now do the following:

    1.  Define a program called `flatten` which removes all null elements from your structure.

    2.  Define a program called `toList` which convets an instance of your structure to a list as defined in Python/Dafny/Idris.
        You may discard empty values.
