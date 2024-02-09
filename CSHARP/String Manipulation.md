#basics #stringmethods
### String Manipulation

There are different ways of printing data on the screen, we are going to loot at composite strings, string formatting, string interpolation and verbatim strings

You can decant for one but if you like all of them, then it’s fine

  

1. string concatenation - consist in put together some variables like string, integers with other string text

![[Untitled 14.png]]

1. String formatting - this case uses an index starting in 0, the sintaxis is this

![[Untitled 15.png]]

1. String Interpolation

![[Untitled 16.png]]

1. Verbatim strings

![[Untitled 17.png]]

  

### String and its Methods

String is an object of the System.String class

In programming terms string means sequence of characters

Functions of the String class are used to manipulate and to perform various actions on a given string

  

- SubString(int32) - is used to get the Substring from the string, starting from the specified index
    
    ex. Car, SubString 1 is A, each string has an index, in this case SubString 0 = C SubString 1 = a SubString 2 = r - So if you request SubString(1) - expected output: ar
    
- ToLowe() - is used to convert the string to lowercase
- ToUpper() - is used to convert the string to uppercase
- Trim() . is used to trim all leading and trailing white space, This is used to remove all spaces at the beginning and end of a string
    
    For example when by accident have an empty space at the end when you copy an Email
    
- IndexOf(string) - is used to get the first occurrence of the string or character inside the string (for know what number of index is the first caracter that you put intro the function)
- IsNullOrWhiteSpace - returns true if the string is null or is blank else returns false

![[Untitled 18.png]]

Some of sintaxis

String.Format - this method is used to insert the object or variable value inside any string

With the String.Format we can replace the value in the specified format

- Syntax:
    
    String.Format(”any string {index}”, object);
    
    So what that will do is it will put the object into the position of index so it will replace it
    
    Ex. var name = “Denis”
    
    String.Format(”My name is {0}”, name); Here the string name will be replaced at Index {0} in the string and the output will be “My name is Denis”
    

![[Untitled 19.png]]

output:

![[Untitled 20.png]]

  

Special caracters in Strings - Escape characters

Some characters have special meaning in strings, these are called escape characters, for example double quote “” is used to denote the start and end of a string, if you want to include a double quote inside a string, you need to escape it using the backslash

with \ before the special characters you can escape them for using inside a string

![[Untitled 21.png]]

output:

![[Untitled 22.png]]

  

var

Is used to declare implicitly typed local variables, when you declare a variable using VAR, you’re telling the compiler to determine the data type of the variable based on the type of the value you’re assigning to it

![[Untitled 23.png]]

const

![[Untitled 24.png]]

no more to say xd
