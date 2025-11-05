from __future__ import annotations

from enum import Enum
from dataclasses import dataclass

from collections.abc import Callable
from typing import Any,TypeVar, Generic, Tuple


# =============================================================================
#
# Datatypes and classes
#
# =============================================================================
#
# In this final intro to Python basics we will cover creating datatypes and
# classes.
#
# Specifically, we will cover:
#
# + Creating enumerated types, unions, and records;
# + Creating basic classes;
#

# =============================================================================
#
# Tuples
#
# =============================================================================
#
# Python supports creating tuples, pairs of arbitary size.
def pair(this : Any, that : Any) -> Tuple[Any,Any]:
    return (this,that)

def examplePairs():
    p = pair(1,"This")

def tupleExample(this : Any, that : Any, rest : Any) -> Tuple[Any,Any,Any]:
    return (this,that,rest)

def usingTuples():
    t = tupleExample(1,"this", 2.3)

    # You can explicitly destruct tuples as follows:
    (a,b,c) = t

# =============================================================================
#
# Enumerated Types
#
# =============================================================================
#
# Python supports creating enumerations, which are datatypes that
# enumerate some values.  Specifically, we are creating choices
# between different ways we can say what the datatype is.


# We begin with the example of a enumerated type to represent different sizes.
class Size(Enum):
    SMALL  = 1
    MEDIUM = 2
    LARGE  = 3

# [ Note ]
#
# Within Python, enumerations are specalised classes, with special
# fields: `Small`, `Medium`, and `Large`.

# =============================================================================
#
# Pattern Matching
#
# =============================================================================
#
# We can use the match statement in Methods to deconstruct enums, as
# well as other types.

def toString(s : Size) -> str:
    match s:
        case Size.SMALL:
            return "Small"
        case Size.MEDIUM:
            return "Medium"
        case Size.LARGE:
            return "Large"
        case _:
            return "Default"
# [ NOTE ]
#
# The keyword `match` indicates we are matching on what `s` could be.
#
# We delineate each possible 'case' with the keyword `case`, followed by the
# name of the constructor we want to examine.
#
# If we do not want to examine any more cases we can use the wildcard pattern:
# `_`.
#
# For example:

def ToString2(s : Size) -> str:
    match s:
        case Size.SMALL:
            return "Small"
        case _:
            return "Default"


# =============================================================================
#
# Simple Objects
#
# =============================================================================
#
# We now look at basic Objects.
#
# Python supports Object oriented programming.
#
# Let us define a simple class with two fields. We will not look at inheritance.

class Simple():

    # here are our class' fields.
    field1 : int
    field2 : str
    __private_field : int # Fields with a leading `_` are private

    # The default constructor is as follows and takes the 'shape' of a
    # method.
    #
    # We use the `self` keyword to talk about the specific instance of
    # a class.
    def __init__(self, i : int, s : str) -> None:
        self.field1 = i
        self.field2 = s
        self.__private_field = i + i


    def getField2(self) -> str:
        return self.field2

# An example of creating objects.
#
# We create objects by calling their constructor.
#
def creating_objects() -> None:
    obj = Simple(1,"Hello")
    return None

# Python also supports 'dataclasses', which are classes that have various default methods generated.
# `dataclasses` are useful when you wish to have classes that 'just' contain data.
# Other names for `dataclasses` can be records:

@dataclass
class Person:
    name : str
    dob  : str
    height : int

def creating_and_accessing_data() -> None:
    obj = Person("Hello", "123", 12)
    n = obj.name
    return None

# =============================================================================
#
# Union Types
#
# =============================================================================

# Python also supports Union types, also known as intersection types.
# We show this by demonstrating an example of the Option type as a raw union.

def trial(v : str | None):
    match v:
        case str():
            print(f"Is String { v }")
        case _:
            print("Is none")

# We can also define a type synonym to make our functions easier to read.

MaybeStr = str | None

def trial2(v : MaybeStr):
    match v:
        case str():
            print(f"Is String { v }")
        case _:
            print("Is none")

# We can even construct generic datatypes
#
# For example a generic option (or Maybe) type is defined as:

type Maybe[T] = T | None

def fromJust[T](base : T, m : Maybe[T]) -> T:
    match m:
        case None:
            return base
        case _:
            return m
# -- [ EOF ]
