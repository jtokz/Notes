#basics #datatypes 
Variables - Una variable se compone de: el tipo de dato, un nombre que se le va a signar y los datos que va a llevar y la sintaxis para declarar una variable, hay varios tipos de variables y algunos de ellos son:


int - para un integer number, o sea un número entero

int MyFirstNumber = 5;

float - for a float number, meaning numbers that have decimal point

float pi = 3,1415f ;

bool - for a boolean value like true or false

bool isGPSEnabled = true;

string - use to store text

string myName = “Jordan”;

char - use for store a single character like an at sign or a dollar sign

char at = ‘@’;

So if you only need to declare a sign you must to use chat and not string because string use a greater amount of memory

So the more variables we declare, the larger memory our app is going to require.


Datatypes and their limits

First of all, variables can be pretty much declared outside of a method, but also inside of a method

![[Untitled.png]]

You can change the value of a variable writing bellow a new value so when you call the variable it will show the new value

![[Untitled 1.png]]

When you don’t assigned a value, it will be assigned the default value (=0). This if it’s c# because another programm’s default value is null

![[Untitled 2.png]]

Now this variable will only be available within that particular method where it was declared in, and if we want to use it in another method now, it will not be visible. So we cannot use it there and it will result in errors.

  
another different types of int variables:

sbyte x = 120; - whole numbers from -128 to 127 (this for use less storage and memory)

short x = 30000; - whole numbers from -32767 to 32767

int x = 2000000000; - whole numbers from -2,147,486,648 to 2,147,483,647

long x = 9000000000000 - (a lot xd) - -9,223,327,036,854,775,808 to 9,223,327,036,854,775,807

Try to use the smaller every time you can


another different type of float variables:

float x = 99.99f (7 digits precision) - allows decimals and a range from 1.5x10^-45 to 3.4*10^38 // The f tells C-sharp that we’re talking about a float, if you don’t type it, c# will consider it was a double value and we’ll receive an error

double x = 1.5; (15 digits precision) - allows decimals and an even higher range than the float

decimal x = 1.5; more precision than double (28 digits precision)

when to use each one?

Float is mostly used in graphics libraries (high demands for processing powers) // Performance

double is mostly used for real world values (except money calculations)

decimal is mostly used in financial applications (high level of accuracy)

  

bool switch = false; - only allows tho states: true / false

char singleLetter = ‘A’; - allows a single character literal o unicode

string username = “Jason1995” - allows multiple letters and unicodes

  

![[Untitled 3.png]]

Cuando asignamos una variable de algún tipo esta variable se vuelve del tipo que le asignamos y por lo tanto adquiere las propiedades de ese tipo, por ejemplo si hacemos una variable tipo String, esta variable tendrá acceso a dichos métodos (methods) a través de la sintaxis de punto como por ejemplo ToUpper, que capitaliza el data que hemos introducido en esta variable

Value type and reference type - Data types can be categorized into two categories based on how they occupy memory location, those categories are value type and reference type