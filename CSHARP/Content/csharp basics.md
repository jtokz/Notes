#csharp #oop #basics #dev 
[[OOP Core]] [[Arrays]] [[Methods and statements]] [[Loops]] [[String Manipulation]] [[Variables]] 

Para escribir código C# debemos de hacerlo en un IDE (integrated development environment) como Visual Studio 2022, que provee las herramientas para desarrollar aplicaciones que se ejecutan en windows pero también se pueden hacer para Apple, móvil y demás

.NET es un framework de Microsoft para facilitar y agilizar el desarrollo de aplicaciones

Un ejemplo para la sintaxis de mi primera app ‘Hello, world!” para que sea ejectuado y abierto en un programa sería:  
  
Console.WriteLine("Hello, world!");  

// Esta siendo la nueva sintaxis, ya que la anterior necesitaba de algunas líneas más para que fuese posible ejecutar el código


La anterior sintaxis sería:


`namespace OldStyleApp`  
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

So it’s internal class, wich means that this class can only be used inside of the same assembly, so basically inside of the same project, even though that’s not exactly correct, but you cannot use it outside of this assembly

So another program that we're writing will not be able to access this program file because it is locked.

and then all of that is inside of this

namespace called Old Style App, which is the name of the project that we gave it.

  

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
- Common examples of value types include primitive data types link int, float, long, double, char, bool, decima, these are also considered valye types - struct, enum
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

Is a variable type wich instead of storing the malue in memory directly, it stores the memory location of the actual data

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

![[Untitled 4.png]]

![[Untitled 5.png]]

Este tipo de comentarios sirve para que cuando se reutilice alguna parte del código ya escrito vaya acompañado de un pequeño mensaje de qué hace esa propiedad, clase, método, etc


### Console Class and some of its Methods

We are going to see some the most relevants methods that you are going to use in a future as programmer

Console.Write(”text here”) - Prints and keeps the cursor on the same line

Console.WriteLine(”text here”) - Prints and puts the cursor in the next line

Console.Read() - Takes a single input of type string and it returns the ASCII value of that input —so it returns an integer value—

Console.ReadLine() - Takes a string or integer input and returns it as the actual output value

Console.ReadKey() - Takes a single input of type string and it returns the Key info - very useful when you need to keep the program running without shutting down

![[Untitled 6.png]]

Output

HELLO WELCOME // printed as a result of Console.WriteLine()

HELLOWELCOME // printed as a result of two lines of Console.Write()

![[Untitled 7.png]]

EXAMPLE:

![[Untitled 8.png]]

Here the console asks to user to enter a string

That string is stored in a Variable named readInput

Then the console return a message with a message “you have entered …” and the variable that previously we has declared

Does the same thing below but in this case with the method “Read” that returns a ASCII value


### Implicit and explicit conversion

Implicit conversions

is when you don’t need add a specific factor of conversion because there aren’t conflicts with the variables, a case of this is when you want to pass the value of an int to a long for example, since they bot use integer numbers

![[Untitled 9.png]]

  

Explicit conversion

is when you need to convert an integer number to a decimal number like is case of double to int, since they stores a different kind of numbers

![[Untitled 10.png]]

  

You can also convert a number like an int or double, float etc in a string so you have to use a special sintaxis

![[Untitled 11.png]]

### Parse

You can extract the numbers into a string to convert them onto an int, double, etc. and therefore be able to operate with them trough syntax int32.Prase

![[Untitled 12.png]]

![[Untitled 13.png]]

In this we convert a string into a float too



