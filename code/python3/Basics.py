from typing import TypeVar

# =============================================================================
#
# Imperative Programming
#
# =============================================================================
#
# At its core Python is an imperative programming language. Lets look at what
# that means.
#
# We will cover:
#
# + The Main method, the main entry point to running Dafny programs.
# + Assigning variables, and control flows
# + Writing a method that doubles a number, and displays the number to STDOUT.
# + Sequences.
#

def main(): # <- notice that there are no curly braces!
            #    python uses indentation to indicate scope.

    """This is the `Main` method, when we run programs this is the
    first code executed.

    We have also now seen how we can document python code.
    """
    # Methods are impure, they can execute code that can fail.
    # For example take the following code to print the string "Hello World".
    # Printing *can* fail if the computer runs out of memory.
    #
    print("Hello World!");
                       # ^ notice the semi colon

    # Print is a core method in Python3, and methods are written in
    # the imperative style. Methods need to be sequenced and the semi
    # colon enables how statements are sequenced.
    #
    # That being said, sequencing is so pervasive that we actually do
    # not need to include them.

    print("Hello World!")

    # Let's look at other statements.


    # Binding variables:
    #
    # Here we bind the identifier 'i' to the integer value '0'.

    i = 0

    # Notice that there is not type information. Python is both
    # gradually typed (which means type checking occurs at runtime)
    # and consequently supports type inference (which means we do not
    # need to give explicit typing annotations)

    # Personally, I think it is good to provide types when you know them.
    # We can do so using a 'colon' followed by a type:

    j : int = 0

    # Many python static analysis tools use these annotations to help
    # check python code's correctness at compile time.


    # Remember the RHS of the assignment can be an expression.

    i = i + 2

    # While loops:

    i = 0;
    while i < 10:
        i = i + 1 # Python does not support postfix operations such as `i++`
        print(i)

        # We can combine the print methods using a format string:

        print(f"{i}")

    # For Loops:
    #
    # Here is a for look that count downs from 10 to 1.
    for i in range(10,0,-1):
    #  ^ i is a local variable in this block
        print(f"{i}")

    for i in range(1,10):
        print(f"{i}")


    # Method calls, we can call methods as follows:

    printDouble(i)

# =============================================================================
#
# Methods
#
# =============================================================================

def printDouble(i : int):
    """Prints the method parameter 'i', doubled.
    """
    print(f"{i + i}")


# Let us now look at returning from methods.
#
# For example:

def double(i : int) -> int:
    return i + i
    # ^ return is the keyword indicating the expression to be
    # returned.

# =============================================================================
#
# Decisions using Conditional
#
# =============================================================================
def isPositive(i : int) -> bool:
    if i >= 0:
        return True

    return False

def isPositiveAgain(i : int) -> bool:
    if i >= 0:
        return True
    else:
        return False

# [ Note ]
#
# We can write this method more efficiently.
def isPositiveAgainAgain(i : int) -> bool:
    return i >= 0

# Interestingly, python has support for ternary operators

def doubleIfPositive(i : int) -> int:
    result = i + i if i >= 0 else i
    return result

# =============================================================================
#
# Sequences
#
# =============================================================================
#
# We end this brief tour by looking at sequences.
#
# Python also supports arrays and sets with similar builtin operations and
# syntax.
#
# Sequences has type: `list[T]`, where `T` is a type parameter denoting the type
# of elements within the sequence.
#
# You can think of sequences as linked lists.
def sequencesIntro() -> None:
    xs : list[str] = ["A", "BB", "CCC"]
    # Here we have defined a sequence of three strings.

    print(f"{xs[0]}")
    # we index sequences using `[` `]`.

    xs = xs + ["DDD"]
    # The unary operator `+` denotes sequence append.

    # We can also use append as a function call:
    xs.append("EEE")

    # Python also supports slicing of sequences.
    # For example, we can obtain the tail of a sequence as:

    tail = xs[1:]

    # For this course, the best way to iterate over sequences are through for loops,
    for i in xs: # lists are iterable
        print(f"{i}")

# =============================================================================
#
# Generics
#
# =============================================================================
#
# Python also supports generics using duck typing (i.e. interfaces) or
# through generic programming.

T = TypeVar("T")
def append(xs : list[T], ys : list[T]) -> list[T]:
    return xs + ys

# [ Note ]
#
# Although we have a main method we need to let python know which method is our main:
if __name__== "__main__":
    main()

# -- [ EOF ]
