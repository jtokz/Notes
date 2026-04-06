---
tags: [lang/csharp, area/oop, area/basics, type/concept]
---

**Ver también:** [[OOP Core]] · [[Arrays]] · [[Methods and control structures]] · [[Loops]] · [[String Manipulation]] · [[Variables]]

Most relevant:
- C sharp is a single inheritance language, not multi inheritance language

Para escribir código C# debemos de hacerlo en un IDE (integrated development environment) como Visual Studio 2022, que provee las herramientas para desarrollar aplicaciones que se ejecutan en windows pero también se pueden hacer para Apple, móvil y demás

.NET es un framework de Microsoft para facilitar y agilizar el desarrollo de aplicaciones

Un ejemplo para la sintaxis de mi primera app ‘Hello, world!” para que sea ejecutada y abierto en un programa sería:  

`namespace MyFirstNamespace`  
`{`  
	`internal class Program`  
	`{`  
		`static void Main(string[] args)`  
		`{`  
			`Console.WriteLine("Hello, world!");`  
		`}`  
	`}`  
`}`  

En donde el método es llamado Main, pero es llamado static void, void porque no retorna nada y static porque es estático, lo que quiere decir que este método se puede llamar sin haber creado un objeto o programa

A method is a piece of code that you can execute without having to rewrite the code again and again

static void Main(string[] args)

Se declara qué tipo de método se usará, este será el punto de partida de nuestro programa y luego se ejecutará lo que esté dentro de las llaves

We can pass additional details of type “string array” to this main method, that wants to say that the method allow arguments (args) of strings type according to the parameters

internal class Program

So it’s internal class, which means that this class can only be used inside of the same assembly, so basically inside of the same project, even though that’s not exactly correct, but you cannot use it outside of this assembly

So another program that we're writing will not be able to access this program file because it is locked.

and then all of that is inside of this

namespace called My First Namespace, which is the name of the project that we gave it.

  

Partes del Visual Studio 2022

-El código

-El Solution Explorer- So in here you will find all of your files that you have, once you have multiple files so for example, multiple classes, which we will do later on in the course, then it's very useful to jump between those different classes and see everything that's going on in our solution.

Explorer Now what you can do here is you can open your whole project so you can see this whole solution is called Hello World and the project is called Whole World.

Our code is easy to read and understand now, but once we have a file with multiple hundred lines of code,

then it's easy to jump around between the different methods in here via the Solution Explorer.

  

### Value type in detail

Value types are generally stored in the stack, meaning their allocation and deallocation is managed automatically as the program grows and shrinks and the data is stored actually directly.

Common examples of value types include primitive data types like int, float, long, double char, bool and decimal.

Other value types in c sharp are structs and enums

Value type and reference type
### Value type
 
- Store actual data directly
- Typically stored in the stack
- Common examples of value types include primitive data types like int, float, long, double, char, bool, decima, these are also considered value types - struct, enum
- Nullable version available (int?, double?, etc.)
    
    Then there are nullable value types and every value type has a corresponding nullable version that can
    
    hold any value of the type or null.
    
    These are declared with a question mark.
    
    (int?, double?, etc)
    
    En C#, los "nullable value types" (tipos de valor anulables) son una característica que permite que los tipos de valor (como `**int**`, `**double**`, `**bool**`, etc.) puedan tener un valor adicional llamado "null". Los tipos de valor normales en C# no pueden contener el valor nulo, lo que significa que siempre tienen que tener un valor válido. Por ejemplo, si declaras una variable `**int**`, debe contener un número entero válido, no puede ser nula.
    
    ej.
    
    int = 23;
    
    int? = null;
    

Can be stored in heap if it is part of a reference type like a field in a class or an element in an array

### Reference Type

Is a variable type which instead of storing the value in memory directly, it stores the memory location of the actual data

The variable here stores the memory reference of the data and not the data directly

Reference type data types are string, class, Array, etc

When we copy this reference type of a data type it will just copy the memory address of the data so we will then have two variable pointing to the same data

Coding Standards

Set of guidelines, best practices and programming styles that developers followed when writing source code for a project

So all big software comanies follow these standards and companies have their own standards as well

ex.

- Reasonable variable name - give a name that describes what this variable is really used for
    
    int age = 22;
    
    int userAge = 35;
    
- Proper method name - a function should be given a name based on the functionality it does in the code or program
    
    void CheckInternetConnection() {
    
    // fancy networking code
    
    }
    
- Comments - it’s a good practice always leave comments in your code and in big tech companies it’s a must, functions should have comments which state the use and functionality of that function
    
    // this is a comment
    

It helps other developers working on the same project to understand what the use of that function is. And it's not just for other developers, but it's also for yourself.

When you come back to the code a couple of years later or even a couple of months, you will find it really tough to understand your own code if you don't have proper comments and you will have to figure out everything from scratch again, which will take way too much time.

### Different types of comments for your code

Single-Line Comments

//a bool to check if user is logged in

bool isUserLoggedIn = true;

Multiline Comments

/* these methods are responsible

for storing user data and connecting

to the data base */

XML docummentation comments

///<summary>

///This method is very cool

///</summary>

void CoolMethod() {

}

//cool code

```csharp
namespace XML_Comments
{
    /// <summary>
    /// Esta clase da un mensaje
    /// </summary>
    public class Mensaje
    {
        /// <summary>
        /// Aqui se almacena la edad
        /// </summary>
        public int edad { get; set; }

        /// <summary>
        /// Este método saluda
        /// </summary>
        /// <param name="user">Almacena el nombre del usuario</param>
        /// <returns>Retorna un saludo con el nombre</returns>
        public string Saludos(string user)
        {
            return $"Saludos {user}";
        }
    }
}
```

```csharp
using XML_Comments;

Mensaje m = new();

m.edad = 28;

m.Saludos("Jordan");
```

Este tipo de comentarios sirve para que cuando se reutilice alguna parte del código ya escrito vaya acompañado de un pequeño mensaje de qué hace esa propiedad, clase, método, etc


### Console Class and some of its Methods

We are going to see some the most relevants methods that you are going to use in a future as programmer

Console.Write(”text here”) - Prints and keeps the cursor on the same line

Console.WriteLine(”text here”) - Prints and puts the cursor in the next line

Console.Read() - Takes a single input of type string and it returns the ASCII value of that input —so it returns an integer value—

Console.ReadLine() - Takes a string or integer input and returns it as the actual output value

Console.ReadKey() - Takes a single input of type string and it returns the Key info - very useful when you need to keep the program running without shutting down

```csharp
namespace Ejercicio1
{
    public class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("HELLO WELCOME"); // prints the text and jumps to a new line
            Console.Write("HELLO"); // prints the text in the same line
            Console.Write("WELCOME"); // again a .Write for as expected Output like "HELLOWELCOME"
            Console.ReadKey(); // for keep running the program until we type a key
        }
    }
}
```

Output

HELLO WELCOME // printed as a result of Console.WriteLine()

HELLOWELCOME // printed as a result of two lines of Console.Write()

```
HELLO WELCOME
HELLOWELCOME
```

EXAMPLE:

```csharp
Console.Write("Enter a string: ");
string readInput = Console.ReadLine();
Console.WriteLine("You have entered: " + readInput);

Console.Write("Enter a string: ");
int asciiValue = Console.Read();
Console.ReadKey();
```

Here the console asks to user to enter a string

That string is stored in a Variable named readInput

Then the console return a message with a message “you have entered …” and the variable that previously we has declared

Does the same thing below but in this case with the method “Read” that returns a ASCII value


### Implicit and explicit conversion

Implicit conversions

it's when you don’t need add a specific factor of conversion because there aren’t conflicts with the variables, a case of this is when you want to pass the value of an int to a long for example, since they bot use integer numbers

```csharp
// Implicit Conversion
int num = 12345;
long bigNum = num;
Console.WriteLine(bigNum);
```


Explicit conversion

Explicit conversions require a [cast expression](https://learn.microsoft.com/en-us/dotnet/csharp/language-reference/operators/type-testing-and-cast#cast-expression). Casting is required when information might be lost in the conversion, or when the conversion might not succeed for other reasons. Typical examples include numeric conversion to a type that has less precision or a smaller range, and conversion of a base-class instance to a derived class.

Ex. Convert a double to int

```csharp
// Explicit Conversion
double myDouble = 13.37;
int myInt;

// cast double in int;
myInt = (int)myDouble;
// with this sintaxis i can put my double into a int variable
// this is knowed as casting, that's explicit conversion
Console.WriteLine(myInt);
Console.Read();
```

You can also convert a number like an int or double, float etc in a string so you have to use a special sintaxis

```csharp
// typeConversion
string myString = myDouble.ToString(); // 13.37 -> "13.37"
```
### Parse

You can extract the numbers into a string to convert them onto an int, double, etc. and therefore be able to operate with them through syntax Parse

```csharp
static void Main(string[] args)
{
    string myString = "15";
    string mySecondString = "13";
    string result = myString + mySecondString;

    int num1 = Int32.Parse(myString);
    int num2 = Int32.Parse(mySecondString);
    int resultInt = num1 + num2;
    Console.WriteLine(resultInt);
    Console.Read();
}
```

```csharp
// Tarea 1 - Parsing

string stringForFloat = "0.85"; // datatype should be float
string stringForInt = "12345"; // datatype should be int

float stringInFloat = float.Parse(stringForFloat);
int stringOnInt = Int32.Parse(stringForInt);

Console.WriteLine(stringInFloat);
Console.WriteLine(stringOnInt);
Console.Read();
```

In this we convert a string into a float too



STATIC KEYWORD
static means that the method will not be used as part of an object. For example you have:

class ExampleClass

    public static  void StaticMethod()
    {
          Console.WriteLine("Some text");
    }
   `public void NonStaticMethod()`
  `{`
        `Console.WriteLine("Some text");`
   `}`
`
Now if you would like to use NonStaticMethod, you would have to first create object from that class and run the method on that object (createdObject.NonStaticMethod())

On the other hand you can use StaticMethod() directly without creating an object from class, so you would run it with ExampleClass.StaticMethod()

#### Math Class

Math class is a class with a lot of mathematic methods that you can implement  in your projects

```csharp
// Some methods of Math Class

// Round up / Ceiling
Console.WriteLine("Ceiling: " + Math.Ceiling(25.33));
// Round Down / Floor
Console.WriteLine($"Floor of number {num}: {Math.Floor(5.13)}");

Console.WriteLine($"Lower of num {num1} and num {num2} is {Math.Min(num1, num2)}");
Console.WriteLine($"Higher of num {num1} and num {num2} is {Math.Max(num1, num2)}");

Console.WriteLine($"The value to the power of 3 is {Math.Pow(3, 8)}");
Console.WriteLine($"Always positive: {Math.Abs(-101)}");
```

#### Random Class

```csharp
class Program
{
    static void Main(string[] args)
    {
        Random dice = new Random();

        for (int i = 0; i < 10; i++)
        {
            int numEyes = dice.Next(1, 7); // maxValue is not included
            Console.WriteLine(numEyes);
        }
    }
}
```

```csharp
// Fortune Exercise
Random answer = new Random();
Console.WriteLine("Write a question to the crystal sphere");
int response = answer.Next(1, 5);
switch (response)
{
    case 1:
        Console.WriteLine("Yes");
        break;
    case 2:
        Console.WriteLine("Maybe");
        break;
    case 3:
        Console.WriteLine("No");
        break;
}
```

#### DateTime Class
```csharp
// CultureInfo makes that shows the time in specific region format like AM/PM in US
CultureInfo value = new CultureInfo("en-US");

DateTime dateTime = new DateTime(1997, 11, 10, 18, 30, 0);
Console.WriteLine("My Birthday is {0}", dateTime);

// Write Today on screen
DateTime dt = DateTime.Now;
Console.WriteLine(dt);

// Write tomorrow
DateTime tomorrow = GetTomorrow();
Console.WriteLine($"Tomorrow will be {tomorrow}");

// The first day of a specific year
Console.WriteLine(GetFirstDayOfYear(1973));
// The day of the week
Console.WriteLine(GetDayFDOfYear(1973));
```

```csharp
// Specific info
DateTime dt = DateTime.Now;
// Shows today's hours and minutes, and seconds
Console.WriteLine(dt.ToString("hh:mm:ss"));
string input = Console.ReadLine();

// Days passed since a date
DateTime jordancaro = new DateTime(1997, 11, 10);
TimeSpan jordancaroborn = DateTime.Now.Subtract(jordancaro);
Console.WriteLine($"Jordan has lived {jordancaroborn.Days} days since Jordan's birth");
```

```csharp
static DateTime GetTomorrow()
{
    return DateTime.Today.AddDays(1);
}

static DateTime GetFirstDayOfYear(int year)
{
    return new DateTime(year, 1, 1);
}

static DayOfWeek GetDayFDOfYear(int year)
{
    DateTime firstDay = GetFirstDayOfYear(year);
    return firstDay.DayOfWeek;
}
```

##### Nullable variables
```csharp
int? numB = new int?();
double? numC = new double?();
bool? boolD = new bool?();

Console.WriteLine("Our nullable numbers are: {0},{1},{2},{3}", numB, numC, num1, num2);
// Our nullable boolean value is:
Console.WriteLine(boolD);
```

Nullable variables will make that the program don't crashes  when you implement a variable without a value, so if you declare as nullable you can use it but won't show anything

What is the approach for this? in that case you will use Nullable?
For example, when you have formularies like First name, Second name, Family name Etc. and a camp can be stay empty so that won't make the program crashes

Ex.
```csharp
bool? isMale = null;
if (isMale == true)
{
    Console.WriteLine("User is male");
}
else if (isMale == false)
{
    Console.WriteLine("User is female");
}
else
{
    Console.WriteLine("No gender chosen");
}
```

```csharp
Console.WriteLine("Value of num is: {0}", numb);
// NULL COALESCING OPERATOR (??)
// If num has a value take it, if it's null return 13.37
numb = numb ?? 13.37;
Console.WriteLine("Value of num is: {0}", numb);
Console.WriteLine("Value of num1 is: {0}", num1);
```

##### Garbage Collection

- The .Net Framework provides an automatic memory management
	- That means you don't need to use the garbage collector manually as you do in all the programming languages such as C, C++ and others
	- That's why it's something that not much people use very often
	- So you hace more complex programs and really advanced you maybe gonna need to use it
- In C# it's not something that you have to use all the time or even have to use at all in most cases

How does it work?

Ex.
	Human jordan = new Human(); // allocates memory

- The Framework takes care of reclaiming memory for reuse in the system, once objects are no longer being used
	- In this case, I'm creating this object and then i might use it and it might use it again and again but in one point i'm going to stop to use it anymore and the garbage collector will clean it up because is now blocked and the garbage collector has to clean up so it has to make this memory available again for other objects for exaample

Example

![[Pasted image 20240410114847.png]]

In this example the system memory pool has a bunch of memory, so we can use this memory for multiple different programs, but now we have our program which runs it, and now in our program we create an object

![[Pasted image 20240410115036.png]]
We need a little bit space in our memory for our program, so there's a reference from our program to that memory where our object is stored so we can reuse it and we can call it from different spots and so forth
creates other one and another one
![[Pasted image 20240410120126.png]]
There are reference to our memory pool, so we maybe delete the reference by setting a variable null or by setting the object null, and then the reference suddenly gone, now there is no reference from our program to this little memory allocation here anymore and our garbage collector notices it and says, okay, there's no reference, so this little piece of memory is never used, so let's just clean it up or  let's re allocate it or let's just freed up for other allocation
![[Pasted image 20240410120517.png]]

```csharp
// Example of when garbage collection would kick in
public void myFunction {
    Human denis = new Human(); // allocates Memory
    denis.teach();
    int age = denis.age;
    denis.getOlder();
}
// The function ends → "denis" goes out of scope → no references left → GC cleans it up
```
We use denis Object, call it's methods, set some properties and so forth but at one point, this Denis object in the memory is not required anymore because the function call is over.
So the function ends and Denis goes out of scope and there are no references to Denis anymore because myFunction is a function and we have this object which is within a function, so the scope of it is within the function, so once the function call is over, there's no direct referennce to it anymore because we can't reference  to an object which is within a function from outside of this function
![[Pasted image 20240410121323.png]]
So we would need to create fields for that or do the other approaches for this, but in the end the garbage collector, which is cleaning up this Denis and re-allocate this memory

What do you need to know
- You don't have to manually call the garbage collector (but you can)
- The garbage collector requires processing power
- The garbage collector's goal is to free up memory but not use too much processing power
- Memory isn´t necessarily reclaimed right away
- You can implement the finalizer method to execute code just before an object is released from memory by the Garbage collector

When does the Garbage Collector run?
- When the system has low physical memory
- When the memory allocated exceeds a pre-set threshold
- When GC.Collect() is called. Even though this is a tricky method

##### Main method ( ) string[] args
Main method has as parameter the Array string[] args where you can put here some words as arguments, let's put there an argument called 'Jordan' and then we are going to print it onto the console
1. Namespace properties
2. Debug
3. Open debug launch profiles UI
![[Pasted image 20240411132414.png]]
```csharp
namespace SimpleTests
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Hello, " + args[0]);
        }
    }
}
```
Here we use this args array and indicates which position you want to print, as well we are using string concatenation in order to write some things in addition to args string word

Adding some other strings to args
```csharp
static void Main(string[] args)
{
    Console.WriteLine("Hello, " + args[0]);

    foreach (string arg in args)
    {
        Console.WriteLine(arg);
    }
}
```

In order to don't get an error when you use the parameter args and it would be null, you can make 
```csharp
static void Main(string[] args)
{
    // arguments cannot be null. It's safe to check the length property without null checking
    if (args.Length == 0)
    {
        Console.WriteLine("This is a smart app that uses args :) Please provide arguments next time");
        // Pause the application so it doesn't quit after printing our error message
        Console.ReadKey();
        // Quit the application entirely since we can't proceed further since the arguments are empty
        return;
    }
    Console.WriteLine("Hello, " + args[0]);
}
```

You can pass arguments through CMD so if you just open the .exe without arguments it will show the message but you can try to open it with cmd and pass there arguments like this
![[Pasted image 20240411165225.png]]

To to this you need first to build it in the IDE so before to pass arguments by CMD debug it with f5 to build it

##### How can we use this?
This is very useful for applications for example you can say to user that pass help for instructions

Rule #1: Never trust the user
So we need to cover the possible mistakes that users may make

For example. We are going to create an application which the user has pass arguments, so if they need help, they will have to ask for help using 'help'
```csharp
// check if the first command we got is help
if (args[0] == "help")
{
    // display menu
    Console.WriteLine("*** Instructions ***");
    Console.WriteLine("* use one of the following commands followed by 2 numbers");
    Console.WriteLine("* 'add' : to add 2 numbers");
    Console.WriteLine("* 'sub' : to subtract 2 numbers");
    Console.WriteLine("* example: 'add 5 2'");
    Console.WriteLine("********************");
    // pause
    Console.ReadKey();
    return;
}
```
How to call help command?
As this is a cmd app, you must to call it in your Terminal so you need to type the .exe and then the args that you want to pass to it
![[Pasted image 20240414181327.png]]
So at continue to the path you have to put the args following instructions of help command

Code for instructions:

```csharp
// check the length of args
if (args.Length != 3)
{
    Console.WriteLine("Invalid arguments, please use the help command for instructions");
    // pause
    Console.ReadKey();
    // quit the app
    return;
}
```

```csharp
// In C# 6 and earlier, you must declare a variable in a separate statement before you pass it
// Note: if the parsing operation fails, 'out' will have its default value
bool isNumParsed = float.TryParse(args[1], out float num1);
bool isNum2Parsed = float.TryParse(args[2], out float num2);

if (!isNumParsed)
{
    Console.WriteLine("Invalid arguments, please use the help command for instructions");
    Console.ReadKey();
    return;
}
```

```csharp
// a variable to store the results
float result;
switch (args[0])
{
    // case 1 'add' — add the 2 numbers and print the value
    case "add":
        result = num1 + num2;
        Console.WriteLine($"The sum of {num1} and {num2} is {result}");
        break;
    // case 2 'sub' — subtract the two numbers and print the value
    case "sub":
        result = num1 - num2;
        Console.WriteLine($"The sub of {num1} and {num2} is {result}");
        break;
    default:
        Console.WriteLine("Invalid arguments, please use the help command for instructions");
        break;
}
```
And then just simply follow the instructions
![[Pasted image 20240414181629.png]]
