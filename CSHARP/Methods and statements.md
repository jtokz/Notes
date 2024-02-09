#basics #csharp #methods 
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

![[Untitled 25.png]]

In this example we can see that public is the access specified, which means this method can be used from other classes as well

int which is the return type, so this method would be returned an integer which is a number

Add - the name of the method in this case, so this method should simply add two values and the two values it should add are the parameters

int num1, int num2 - are the parameters, can be a lot, it could be 50, it doesn’t have to be two

into the method body you run the code, so whenever you have a data type, which is for example an integer, you have to return something that is of that data type

###### Methods with params here: #methodswithparams [[Arrays]]

Void method

![[Untitled 26.png]]

How to call a void method in the Main method

You can create very long methods which do loads of things and then you can simply call them in one line

A method should usually do one thing, so in this case, this method is just there to write something, so you shouldn’t create methods which do 20 different things or something like that, keep it simple

So if you want to have a method which does something else, then create an additional method

  

Try Catch #trycatch

Is used when you need for example, a specific type of character like Int, so we need that our program don’t crash and show a message with the error or something like that

![[Untitled 27.png]]

There are a lot of errors that you can list on the catch section being (Exception) the one that contains all errors, but if you want to show a different message for each error you can specific the error among the brackets

Some examples are:

Exception - all errors

FormatException - when you need an int but the user type a string

OverflowException - when you declare an int but the one the user enters is higher

Finally - Lo que entendí es que pase lo que pase esta parte del código se va a ejecutar, sea que funcione o no lo que esté en el try

  

Operators

![[Untitled 28.png]]

![[Untitled 29.png]]

![[Untitled 30.png]]

![[Untitled 31.png]]

nothing to say xd

If Else #ifelse
Basic structure of if else and else if
![[Untitled 32.png]]

tryParse with try catch and if else
![[Untitled 33.png]]

Enhanced If statement #enhancedif
![[Untitled 34.png]]

![[Untitled 35.png]]

Nested if statement #nestedif

![[Untitled 36.png]]

De esta manera no se anida sino que mantiene todos los statements en un solo parámetro donde, si no se cumplen todos sin excepción no va a correr esa parte del código

![[Untitled 37.png]]

==Create a user Login System, where the user can first register and then Login in. The Program should check if the user has entered the correct username and password, when login in (so the same ones that he used when registering).==

==As we haven't covered storing data yet, just create the program in a way, that registering and logging in, happen in the same execution of it.==

User If statements and User Input and Methods to solve the challenge.

This is static variables who can be used in any method

![[Untitled 38.png]]

Another way to resolve the challenge
![[Untitled 39.png]]

Switch Statements #switch 
![[Untitled 40.png]]

Switch compare the variable with the cases that you put in it, it’s a little similar to if but in this case you can put a lot of cases and the program will be not see like spaghetti

Break and Continue #breakandcontinue

![[Untitled 45.png]]

What the break do is, when the condition is met, break the execution of the loop
![[Untitled 46.png]]

But, when you put a continue, when the condition is met, it will skip it, en otras palabras cuando se cumpla la condición se saltará la iteración

For example

![[Untitled 47.png]]

![[Untitled 48.png]]

