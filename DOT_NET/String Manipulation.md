---
tags: [lang/csharp, area/basics, type/reference]
---

### String Manipulation

There are different ways of printing data on the screen, we are going to loot at composite strings, string formatting, string interpolation and verbatim strings

You can decant for one but if you like all of them, then it’s fine

  

1. string concatenation - consist in put together some variables like string, integers with other string text

```csharp
static void Main(string[] args)
{
    // String Manipulation
    int age = 31;
    string name = "Alfonso";

    // 1. string concatenation
    Console.WriteLine("String Concatenation");
    Console.WriteLine("Helo my name is " + name + ", I am " + age + " years old");
    Console.Read();
}
```

1. String formatting - this case uses an index starting at 0, the sintaxis is this

```csharp
// 2. string formatting
// uses index
Console.WriteLine("String Formatting");
Console.WriteLine("Hello my name is {0}, I am {1} years old, I'm from {2}", name, age, nacionality);
Console.Read();
```

1. String Interpolation

```csharp
// 3. string interpolation
// uses $ at the start wich will allow us to write our
// variables like {var}
Console.WriteLine("String Interpolation");
Console.WriteLine($"Hello my name is {name}, I'm {age} years old and I'm from {nacionality}");
```

1. Verbatim strings

```csharp
// 4. verbatim strings
// verbatim strings start with @ and tells the compiler to take the string literally
Console.WriteLine(@"some\path\here, connector adjecining with:
SuspenseItem
\label{item}");

// if you use a verbatim string you can type a directory because is not influenced any escape sequence
Console.WriteLine(@"C:\Users\Jordan\OneDrive\Escritorio\La\Url\De");
Console.WriteLine("Mahaha ya have no power here :)");
```

  

### String and its Methods

String is an object of the System.String class  

In programming terms string means sequence of characters

Functions of the String class are used to manipulate and to perform various actions on a given string

  

- SubString(int32) - is used to get the Substring from the string, starting from the specified index
    
    ex. Car, SubString 1 is a, each string has an index, in this case SubString 0 = C SubString 1 = a SubString 2 = r - So if you request SubString(1) - expected output: ar
    
- ToLower() - is used to convert the string to lowercase
- ToUpper() - is used to convert the string to uppercase
- Trim() . is used to trim all leading and trailing white space, This is used to remove all spaces at the beginning and end of a string
    
    For example when by accident have an empty space at the end when you copy an Email
    
- IndexOf(string) - is used to get the first occurrence of the string or character inside the string (for know what number of index is the first caracter that you put intro the function)
- IsNullOrWhiteSpace - returns true if the string is null or is blank else returns false

```csharp
// string methods
string firstName = "Jordan";
string lastName = "Tarazona";
string fullName = String.Concat("", firstName, lastName, "");

Console.WriteLine(firstName.Substring(3)); // output: "dan"
Console.WriteLine(firstName.ToLower()); // output: "jordan"
Console.WriteLine(firstName.ToUpper()); // output: "JORDAN"
Console.WriteLine(firstName.IndexOf('o')); // output: 1 bcos j = 0 o = 1 r = 2 etc.
Console.WriteLine(String.IsNullOrWhiteSpace(firstName)); // output = false
```

Some of sintaxis

String.Format - this method is used to insert the object or variable value inside any string

With the String.Format we can replace the value in the specified format

- Syntax:
    
    String.Format(”any string {index}”, object);
    
    So what that will do is it will put the object into the position of index so it will replace it
    
    Ex. var name = “Denis”
    
    String.Format(”My name is {0}”, name); Here the string name will be replaced at Index {0} in the string and the output will be “My name is Denis”
    

```csharp
var myName = "Jordan";
Console.WriteLine(String.Format("My name is {0}", myName));
```

output:

![[Untitled 20.png]]

  

Special caracters in Strings - Escape characters

Some characters have special meaning in strings, these are called escape characters, for example double quote “” is used to denote the start and end of a string, if you want to include a double quote inside a string, you need to escape it using the backslash

with \ before the special characters you can escape them for using inside a string

```csharp
// How to use special characters in strings with the escape character
string s1 = "this is a \"string\" with \na slash \\ and a colon: ";
Console.WriteLine(s1);
```

output:

![[Untitled 22.png]]

  

var

Is used to declare implicitly typed local variables, when you declare a variable using VAR, you’re telling the compiler to determine the data type of the variable based on the type of the value you’re assigning to it

```csharp
// var

var number = 0; // int
var text = "text"; // string
var isTrue = false; // boolean

// you cannot change the type of a variable once you've declared it
// number = "pollo"; - So you can't change an int for a string
// var number = 1.2f; - not even you can change for another type of number like int to-> float or double
```

const

```csharp
namespace constant
{
    // constants are immutable values which are known
    // const are variables who will not changeagain after they have been created
    // // very useful for storing values which you just don't want them to ever change
    // // variables are outside of any method, inside to the class but outside of the method

    class Program
    {
        // connected to fields
        const double PI = 3.14159265358;
        const int year = 2022;
        //since its const it can be used every 6 years day/1996 and you can not change a const
        // you can not change a constant (your birthday as its value)

        static void Main(string[] args)
        {
            Console.WriteLine("My birthday is always going to be {0}", myBirthday);
            Console.ReadKey();
        }
    }
}
```

no more to say xd
