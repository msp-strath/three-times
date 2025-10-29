---
title: "Hello Worlds"
subtitle: "AA"
toc: true
abstract: |
   hello work
---

We begin our journey into the Worlds of Python, Dafny, and Idris by saying `Hello!`

## Python

```{.python}
if __name__== "__main__":
    print("hello")
```

```{.python}
def main():
    print("Hello")

if __name__== "__main__":
    main()

```

## Dafny

```{.dafny}
method Main()
{
  print("Hello\n")
}
```

## Idris

```{.idris}
main :: IO ()
main = printLn "Hello"
```


methods that support mandatory, optional and keyword arguments...
