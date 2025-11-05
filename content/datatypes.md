---
title: "Structuring Data"
---

Previous topics have shown how to
[run programs](/hello.html)
and write
[basic programs](/basics.html).
As part of these basic programs we encountered
[primitive/builtin](#)
datatypes such as Strings and Characters.
Python and Dafny,
even have builtin collections such as `list` and `seq`.
We saw in
[sequences](/basics/sequences.html)
how Idris' `List` was not a builtin,
rather it is a custom datatype.
Although,
Idris does have a few builtin collection primitives
(`IORef`, for example)
their use in functional programming is extraordinary.

In this section we will now take a look at the various ways in which we can *structure* data in all three languages.
Specifically,
we will look at:

+ [tuples](/datatypes/tuples.html),
  how we can collate data together;
+ [enumerations](/datatypes/enums.html),
  how we can create data that is a choice between labels;
+ [products](/datatypes/products.html),
  how we can generalise tuples into named fields
+ [records](/datatypes/records),
  how we can make working with `products` easier;
+ [(tagged) unions](/datatypes/unions.html),
  how we can generalise `enums` to discriminate between values based on a label;
+ [generic datatypes](/datatypes/generic.html),
  how we can generalise datatypes to work with different types of value;

## Learning Outcomes

By the end of this topic,
for each language,
you will:

1. be aware of the different ways we can structure datatypes;
2. know how to create and use different datatypes;
