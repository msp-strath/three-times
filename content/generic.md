---
title: "Generic Programming"
---


So far in our story all of our types, and programs, we have worked with require specifications that work with specific datatypes.
Generic types are ones that can work with others.
We have seen such types before:
`list` in Python,
and
`seq` in Dafny
These two types,
however,
are *primitives*.
Idris' `List` is not!
Yet the operations for these sequence types work with sequences that contain different types.

In this topic,
we will look at how we can write generic programs that use generic datatypes.

:::note
You may have heard the term *polymorphism* used to describe generic types.
With *monomophism*, describing types that are not generic.
Polymorphism refers to more mathematically structured approaches to making data types generic.
:::

Specifically,
we will look at:

+ [generic datatypes](/generic/datatypes.html),
  how we can generalise datatypes to work with different types of value;
+ [generic methods/functions](/generic/blocks.html),
  how we can make programs that work with many types;
+ [higher-order programs](/generic/higher-order.html),
  how we can make programs that work work with other programs;

## Learning Outcomes

By the end of this topic,
for each language,
you will:

1. understand how one can write generic datatypes;
2. know how to write generic programs;
3. know how to write higher-order programs;
