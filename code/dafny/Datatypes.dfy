/* =============================================================================

   Datatypes and classes

   =============================================================================

   In this final intro to Dafny basics we will cover creating datatypes and
   classes.

   Specifically, we will cover:

   + Creating enumerated types, unions, and records;
   + Creating basic classes;
 */

/* =============================================================================

   Enumerated Types

   =============================================================================

   Dafny supports algebraic datatypes, these data types are 'sums of products'
   in that we are creating choices between different ways we can say what the
   datatype is.

 */

// We begin with the example of a enumerated type to represent different sizes.
datatype Size
  = Small
  | Medium
  | Large

/* [ Note ]

   Here the keyword `datatype` indicates that we are creating a new datatype
   which we have named `Size`.

   The equal sign indicates that we are then to define the datatypes' data
   constructors, each separated by the pipe symbol `|`.

   For `Size`, these constructors are: `Small`, `Medium`, and `Large`.
 */



/* =============================================================================

   Pattern Matching

   =============================================================================

   To deconstruct datatypes we can use the match statement in Methods, and
   expression in dunctions.

 */

method ToString(s : Size) returns (str : string)
{
  match s
  {
  case Small => return "Small";
  case Medium => return "Medium";
  case Large => return "Large";
  }
}

/* [ NOTE ]

   The keyword `match` indicates we are matching on what `s` could be.

   We delineate each possible 'case' with the keyword `case`, followed by the
   name of the constructor we want to examine.

   If we do not want to examine any more cases we can use the wildcard pattern:
   `_`.

   For example:
 */

method ToString2(s : Size) returns (str : string)
{
  match s
  {
  case Small => return "Small";
  case _ => return "Do not care";
  }
}


// We can also use match in the functional fragment of Dafny

function toString(s : Size) : string
{
  match s
  {
  case Small => "Small"
  case Medium => "Medium"
  case Large => "Large"
  }
}

/* [ NOTE ]

   There are is little difference in syntax between the two!

   This can make reading code harder.

   For example, consider the following rewrite of `ToString2`.
 */

method ToString3(s : Size) returns (str : string)
{
  return match s
         {
         case Small => "Small"
         case _ => "Do not care"
         }
         ;
}


function pair(x:(int,int)) : (int,int,int)
method Pair(x:(int,int)) returns (p : (int,int))
{
  var (a,v,b) := pair((1,1));
  var x := pair((1,1)).3;
}
/* =============================================================================

   Datatypes are more than enums

   =============================================================================

   Datatypes in Dafny can contain other data, and can be generic.

 */

/* Here is an example of a datatype to capture two shapes, circle and rectangle,
   and their size.
 */
datatype Shape
  = Circle(s : Size)
  | Rectangle(s : Size)
  | Inner(i : int, a : Shape)

/* [ NOTE ]

   For each constructor we use parenthesis to denote the difference data that
   the constructor can contain.

   Constructors can have different arity, and even be inductive.

 */

// Here is an example of pattern matching over shapes:
function shapeToString(s : Shape) : string
{
  match s
  {
  case Circle(s) => "Circle " + toString(s)
  case Rectangle(s) => "Rectangle " + toString(s)
  case Inner(i,s) => "Inner " + shapeToString(s)
  }
}

datatype Person = Person(name : string, dob : string, height : int)

method CreatingAndAccessingData()
{
  var p := Person("Hello", "123", 12);
  var n := p.name;
}

/*
   Here is an example of an optional datatype that we can use to capture error
   states.
 */
datatype Optional<T>
  = Nothing
  | Just(value : T)

function isJust<T>(s : Optional<T>) : bool
{
  match s
  {
  case Nothing => false
  case Just(_) => true
  }
  //        ^ wildcards can be within the constructor pattern.
}

/* =============================================================================

   Simple Objects

   =============================================================================

   We now end our tour by looking at basic Objects.

   Dafny also supports Object oriented programming.

   Let us define a simple class with two fields.
 */

class Simple
{
  // here are our class' fields.

  var field1 : int
  var field2 : string

  /* The default constructor is as follows and takes the 'shape' of a method.

     Like many OO languages, we use the `this` keyword to talk about the
     specific instance of a class.
   */
  constructor(i : int, str : string)
  {
    this.field1 := i;
    this.field2 := str;
  }

  /*
     Methods are supported too.
   */
  method GetField() returns (str : string)
  {
    return this.field2;
  }

  /*
     So are functions!
   */
  function getField() : string
    reads this // <- we need this because of how Dafny operates.
  {
    this.field2
  }

}

/*
   Any example of creating objects.

   We create objects using the `new` keyword.
 */
method CreatingObjects()
{
  var obj := new Simple(1, "hello");
}


/* =============================================================================

   Generic Objects

   =============================================================================

   We now end our tour by looking at the creation of a simple generic object.

 */

class Complex<T>
{
  var field1 : T

  constructor(t : T)
  {
    this.field1 := t;
  }
}

// -- [ EOF ]


/* =============================================================================

   Header

   ========================================================================== */

/* [ NOTE ]


 */

/* [ Marker ] ==================================================================
   [ Marker ] =============================================================== */
