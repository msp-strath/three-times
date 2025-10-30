Datatypes in Idris,
however,
are constructed differently.
For datatypes are *indexed families*,
a *type constructor*
(how we construct types)
paired with several
*data constructors*.

We can rewrite `MaybeStr` as:

```
data MaybeStr : Type where
  Nothing : MaybeStr
  Just : (value : String) -> MaybeStr
```

In fact, the above definition is what the simple definition is transformed to internally!
