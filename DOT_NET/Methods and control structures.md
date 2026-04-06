---
tags: [lang/csharp, area/basics, type/concept]
---

## Methods in C#

A method is a code block that contains a series of statements. A program causes the statements to be executed by calling the method and specifying any required method arguments. In C# every executed instruction is performed in the context of a method. The Main method is the entry point for every C# application and it is called by the common language runtime (CLR) when the program is started

They are super important in any OOP language (object oriented programming)

Syntax
`<Access Specifier> <Return Type> <Method Name> (Parameter List)`
`{`
`Method Body`
`}`

and what the hell is each of these names??

- Access Specifier - The Access Specifier determines the visibility of a variable or a method from another class, That means that when you create multiple classes, you can access methods that have a specific access specify and cannot access others, there are multiple types of access specifiers
    
    Ex.
    
    Public. - if you use public, you can access that method from another class
    
    Private. - if you use private you cannot.
    
- Return type - A method may return a value. The return type is the data type of the value the method returns. If the method is not returning any values, then the return type is void. So that means that if you want the method to give back something, so return something, you have to specify which data type you wanted to return.
    
    So for example, if you want to return a number, then you could use, for example, integer.
    
- Method name - Method name is a unique identifier and it is case sensitive. It cannot be same as any other identifier declared in the class - DriveCar -
- Parameter list - Enclosed between parentheses, the parameters are used to pass and receive data from a method. The parameter list refers to the type, order and number of the parameters of a method. Parameters are optional; that is, a method may contain no parameters.
- Method body - This contains the set of instructions needed to complete the required activity

```csharp
public int Add (int num1, int num2)
{
    int result = num1 + num2;

    return result;
}
```

In this example we can see that public is the access specified, which means this method can be used from other classes as well

int which is the return type, so this method would be returned an integer which is a number

Add - the name of the method in this case, so this method should simply add two values and the two values it should add are the parameters

int num1, int num2 - are the parameters, can be a lot, it could be 50, it doesn’t have to be two

into the method body you run the code, so whenever you have a data type, which is for example an integer, you have to return something that is of that data type

###### Methods with params here: #methodswithparams [[Arrays]]

Void method

```csharp
static void Main(string[] args)
{
    WriteString();
}

public static void WriteString()
{
    Console.WriteLine("I've called a method!");
}
```

How to call a void method in the Main method

You can create very long methods which do loads of things and then you can simply call them in one line

A method should usually do one thing, so in this case, this method is just there to write something, so you shouldn’t create methods which do 20 different things or something like that, keep it simple

So if you want to have a method which does something else, then create an additional method

  

Try Catch #trycatch

Is used when you need for example, a specific type of character like Int, so we need that our program don’t crash and show a message with the error or something like that

```csharp
try
{
    int userInputAsInt = int.Parse(userInput);
}
catch (FormatException)
{
    Console.WriteLine("Format exception, please enter the correct type.");
}
```

There are a lot of errors that you can list on the catch section being (Exception) the one that contains all errors, but if you want to show a different message for each error you can specific the error among the brackets

Some examples are:

Exception - all errors

FormatException - when you need an int but the user type a string

OverflowException - when you declare an int but the one the user enters is higher

Finally - Lo que entendí es que pase lo que pase esta parte del código se va a ejecutar, sea que funcione o no lo que esté en el try

  

Operators

```csharp
int num1 = 5;
int num2 = 3;
int num3;

// unary operators

num3 = -num1; // poniendole un - sería como multiplicar *-1
Console.WriteLine($"num3 is {num3}");

bool isSunny = true;
Console.WriteLine("is it sunny?: {0}", !isSunny); // El ! en el boolean hace referencia a que se use su opuesto
                                                   // O sea que si es True será False
```

```csharp
// increment operators
Console.WriteLine("num is {0}", num);
Console.WriteLine("num is {0}", num++); // you can increment inside of the statement
Console.WriteLine("num is {0}", ++num); // in the increment only takes effect on the next line
// also
Console.WriteLine("num is {0}", --num);

// if you make the increment before the variable, it will take effect at once
Console.WriteLine("num is {0}", num--);
```

```csharp
// operations
int result;
result = num1 + num2;
Console.WriteLine($"result num1 + num2 is: {result}");
result = num1 - num2;
Console.WriteLine($"result num1 - num2 is: {result}");
result = num1 * num2;
Console.WriteLine($"result num1 * num2 is: {result}");
result = num1 / num2;
Console.WriteLine($"result num1 / num2 is: {result}");
result = num1 % num2; // residuo de una división
Console.WriteLine($"result num1 % num2 is: {result}");
```

```csharp
// bool type operators
bool isLower = num < num2;
Console.WriteLine("num is lower than num2? - {isLower}");

bool isEqual;
isEqual = num == num2;
Console.WriteLine("num is or equal? - {isEqual}");

isEqual = num != num2;
Console.WriteLine("num is not equal that num2? - {isEqual}");

bool isMoreFunny = isLower || isEqual;
Console.WriteLine("result of isLower or isEqual is {isMoreFunny}");

isMoreFunny = isLower && isEqual;
Console.WriteLine("result of isLower and isEqual is {isMoreFunny}");
```

nothing to say xd

If Else #ifelse
Basic structure of if else and else if
```csharp
static void Main(string[] args)
{
    if(condition)
    {
        // what to do if condition is met
    } else if(condition2) {
        // what to do if condition2 is met
    }
    else
    {
        // what to do if none
    }
}
```

tryParse with try catch and if else
```csharp
Console.WriteLine("how many degrees are at?");
string userInput = Console.ReadLine();

bool.TryParse(userInput, out int parseValue);
int temperature = parseValue;

if (temperature < 12)
{
    Console.WriteLine("Take the coat");
}
else if (temperature >= 12 && temperature < 22)
{
    Console.WriteLine("Pants and Pull Over should be fine");
}
else
{
    Console.WriteLine("Pants are enough today");
}
catch (FormatException)
{
    Console.WriteLine("Not a number, exists");
}
```

Enhanced If statement #enhancedif
```csharp
// normal
int temperature = -5;
string stateOfMatter;

//if (temperature < 0)
//    stateOfMatter = "liquid";
//else
//    stateOfMatter = "liquid";

temperature = 30; // == cambia el valor que ya tenia
stateOfMatter = temperature > 0 ? "solid" : "liquid";

// in short
// stateOfMatter = temperature > 0 ? "solid" : "liquid";
// if that true, do the first, if it's false, do the second

// challenge - add the gas state of matter to the options
// if temp == 100 it's gas
temperature = 100;
stateOfMatter = temperature == 100 ? "gas" : temperature > 0 ? "solid" : "liquid";

Console.WriteLine($"State of matter is {0}", stateOfMatter);
```

```csharp
static void Main(string[] args)
{
    bool isAdmin = false;
    bool isRegistered = true;
    string userName = "";
    Console.WriteLine("Please enter your user:");
    userName = Console.ReadLine();

    if (isRegistered)
    {
        Console.WriteLine("Hi there, registered user!");
        if (isAdmin)
        {
            Console.WriteLine($"Hi there, {userName} :)");
        }
        else
        {
            Console.WriteLine($"Hi there, {userName} :(");
        }
    }
}
```

Nested if statement #nestedif

```csharp
static void Main(string[] args)
{
    bool isAdmin = false;
    bool isRegistered = true;
    string userName = "";
    Console.WriteLine("Please enter your user:");
    userName = Console.ReadLine();

    if (isRegistered && userName == "" && userName.Equals("Admin"))
    {
        Console.WriteLine($"Hi there, {userName} :");
    }
    else
    {
        Console.WriteLine($"Hi there, Admin :!");
    }
}
```

De esta manera no se anida sino que mantiene todos los statements en un solo parámetro donde, si no se cumplen todos sin excepción no va a correr esa parte del código

```csharp
Console.WriteLine("Hello, you need to register before continue :) put a username here:");
string user = Console.ReadLine();
Console.WriteLine("Now put a password:");
string password = Console.ReadLine();
Console.WriteLine($"Congrats, you are registered! now put your user:");
int para1 = int.Parse(userString);
string userInput2 = Console.ReadLine();
Console.WriteLine("Now your password:");
int passInput1 = int.Parse(passInputString);
string userInput3 = Console.ReadLine();
if (passInput1 == password && userInput3 == user)
{
    Console.WriteLine("Please wait... your information is correct! login in...");
}
else
{
    Console.WriteLine("Invalid User or Password");
}
```

==Create a user Login System, where the user can first register and then Login in. The Program should check if the user has entered the correct username and password, when login in (so the same ones that he used when registering).==

==As we haven't covered storing data yet, just create the program in a way, that registering and logging in, happen in the same execution of it.==

User If statements and User Input and Methods to solve the challenge.

This is static variables who can be used in any method

```csharp
static string username; // ** Global Variables **
static string password; // ** Global Variables **
```

Another way to resolve the challenge
```csharp
public static void Register()
{
    Console.WriteLine("You need to register first so please enter your username:");
    username = Console.ReadLine();
    Console.WriteLine("Please enter your password:");
    password = Console.ReadLine();
    Console.WriteLine("Congrats, you are registered!");
}

public static void Login()
{
    Console.WriteLine("Please enter your username:");
    string username = Console.ReadLine();
    Console.WriteLine("Please enter your password:");
    string password = Console.ReadLine();
    if (username == username && password == password)
    {
        Console.WriteLine("You're Logged in!");
    }
    else
    {
        Console.WriteLine("Login failed, wrong password. Restart Program");
    }
}
```

Switch Statements #switch 
```csharp
int age = 19;

switch(age)
{
    case <18:
        Console.WriteLine("Too young to party in the club.");
        break;
    case >18:
        Console.WriteLine("Good to go!");
        break;
    default:  // called when the others are not true
        Console.WriteLine("How old are you then?");
        break;
}
```

Switch compare the variable with the cases that you put in it, it’s a little similar to if but in this case you can put a lot of cases and the program will be not see like spaghetti

Break and Continue #breakandcontinue

```csharp
static void Main(string[] args)
{
    for(int i = 0; i < 10; i++)
    {
        if(i == 3)
        {
            Console.WriteLine("At 3 we stop");
            break;
        }
        Console.WriteLine(i);
    }

    Console.Read();
}
```

What the break do is, when the condition is met, break the execution of the loop
```csharp
static void Main(string[] args)
{
    for(int i = 0; i < 10; i++)
    {
        if(i == 3)
        {
            Console.WriteLine("skip the 3");
            continue;
        }
        Console.WriteLine(i);
    }

    Console.Read();
}
```

But, when you put a continue, when the condition is met, it will skip it, en otras palabras cuando se cumpla la condición se saltará la iteración

For example

```csharp
static void Main(string[] args)
{
    for(int i = 0; i < 10; i++)
    {
        if(i % 2 == 0)
        {
            Console.WriteLine("skip even numbers!");
            continue;
        }
        Console.WriteLine(i);
    }
}
```

![[Untitled 48.png]]

