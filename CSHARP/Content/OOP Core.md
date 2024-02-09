#oop #csharp

# OOP - Oriented Object Programming

To talk about OOP we have to start talking of classes

### Class #class

- A class is a blueprint of an object, what means a class is the template to create objects. this class defines which properties and methods will have the objects created from it
- It has actions/abilities - so called member functions or methods
- it has properties - so called member variables, you can create multiple different properties and you can call them later on
- Inheritance possible - the inheritance is possible with classes
- Can be used like a Datatype (ex. String is a Class)

![[Untitled 49.png]]
## Object #object

- Properties: HP, Amount of Wheels, Lumen, Doors
- Abilities: Drive, Break, Open Window, Make Light
- Inheritance: Ej. A5 < Audi < Car - Donde:

*/
class Car { / Definición de la clase Car / }  
class Audi : Car { /Audi hereda de Car _/ }  
class A5 : Audi { /A5 hereda de Audi} 
/*

![[Untitled 50.png]]

Creating a new Class
![[Untitled 51.png]]

##### Creating a constructor #constructor
![[Untitled 52.png]]

##### Calling the constructor on our Main Method
![[Untitled 53.png]]

### Making methods on our new class Car

All of this methods will can be called by the new Objects type Car that we create
![[Untitled 54.png]]

Calling methods in the class Program and the Main Method
![[Untitled 55.png]]

We can call it in a lot of ways, just simply calling it with nothing else or using it in a condition or other way

### why don't we just go ahead and make all variables public?

Well, making member variables private is a fundamental principle of object oriented programming known as encapsulation.

- Encapsulation is the practice of hiding the internal state of an object and allowing access and modification through methods like getters and setters.
- Data integrity: By making member variable private, we can control how they are accessed and modified.
    
    This allows us to enforce rules on how the data is set
    
    For example, we can perform validation in the setter method of a property to ensure the data is always in a valid state
    
- Abstraction: Making member variables hides the internal implementation details of the class. This allows us to change the internal implementation without affecting other parts of the code that use the class
- Reducing Complexity: By exposing only what’s necessary, we can reduce the complexity of using the class. Other parts of the code don’t need to know or care about the internal stat of the object, they just need to know what methods to call

And if we make private a method, how can we call it on the main method?

![[Untitled 56.png]]

You can for example, call it inside the constructor so that, once a new object is created, the method is called immediately and this cannot skip it

## Setters in C#

Let’s say we want to able be to change the name of an Object type ‘Car’ that we have created before, so, as we know the variable _name is private, so if you want to change a name, you must to use a method for it, so you can change through a setter, because commonly methods are public, so we let’s to create a method like the next way:

![[Untitled 57.png]]

![[Untitled 58.png]]

![[Untitled 59.png]]

At the start our new object has the default name ‘Car’, but then through the method called setName, we can rename it for the string that we put in it

De esta manera podemos modificar la variable _name pero no directamente

That is a common practice in C-sharp programming

Cual es el punto de todo esto? por ejemplo se puede usar para asegurar que la variable nombre no sea un valor null, a través de un if statement que cheque si, en dado caso se usa un valor vacío (””) se le asigne un nombre por defecto igualmente

### Getters in C#

Getters are the opposite for Setters, with this you can GET how his name indicates, the information or any other thing from an object like in the case of Object Car, his name, hp, etc

![[Untitled 60.png]] 
##### Properties #properties
Properties make the same of set; get; but in one step, so you don’t need to define two methods (get and set separately)

![[Untitled 61.png]]
In this case we make a property called Name in which we use both, get and set, so when we want to call the different properties we have to use different syntax
![[Untitled 62.png]]
They provide a flexible mechanism to read, write or compute the value of a private field
![[Untitled 63.png]]

Auto implemented properties
![[Untitled 64.png]]
![[Untitled 65.png]]
These are properties which get and set don’t need to be defined, they are created by itself, internally it creates a private variable field and can only be accessed through this property

## Declaring properties and then implemented in the constructor #simpleconstructor

![[Untitled 66.png]]

Read Only and Write Only Property

![[Untitled 67.png]]
You can make properties that you Only can Read or Write in them, so this is very useful when you want to create an object but you don’t want to change anything in it, this is called

- Immutable data
![[Untitled 68.png]]
![[Untitled 69.png]]
Read-only properties are commonly used when you want to create an object with data that doesn’t change after the object is created. For example, in a class representing a BirthDate, you could have a read-only property for the Date. Once de BirthDate object is created, the Date should not change

- Computed Data:

Read-only properties are also used then the property value is computed from other data. For example, in a Rectangle class, you could have a read-only property for the Area, that computes the area of the rectangle from its Width an Height

- Sensitive Data:

Write-only properties can be used for a sensitive data that should be set, but not read from the application. For example, in a UserCredentials class, you might have a write-only property for the Password. The application needs to set the password, but it shouldn’t be able to get the password one it’s set

- Triggering Actions:

A write-only property can also be used to trigger some action when data is set. For example, in a Logger class, you could have a write-only property message that writes a message to a log file when set

## INHERITANCE #inheritance

Inheritance allows define a class in terms to another class, which makes it easier to create and maintain an application. This also provides an opportunity to reuse the code functionality and speeds up implementation time

![[Untitled 132.png]]

![[Untitled 133.png]]

Parent/Base class - contains the essential properties and methods that we will can re use in new classes based on this

Child class - it allows to define a child class that reuses or inherits extends or modifies a parent class’s
![[Untitled 134.png]]

INHERITANCE IN CODE
![[Untitled 135.png]]

- In this demo we have a Parent/Base class called Electrical Device, that contains two properties, one to see if device is on and other with the brand of it
- A simple constructor that contains both properties
- And two methods, one to turn on the device and other to turn off it

This lines of code can be re used in other classes like Radio class and Tv class, because both shares same features

![[Untitled 136.png]]

To inheritance the features of Parent class, you must use this sintaxis:

- Class NameClass : ParentNameClass

Then, when the constructor of the child class isn’t more complex than the parent class you can re use it, using the next sintax

public ConstructorName (Type prop1, Type prop2):base(parentProp1, parentProp2) { }

VIRTUAL AND OVERRIDE KEYWORD #virtualandoverride

![[Untitled 137.png]]

Making this method virtual means that it can be overridden by classes that inherit from animal

![[Untitled 138.png]]

To can override a method you have to use keyword virtual in the base method, and when you want to override it in a child class inherited, you have to use override keyword in the method and inside use the keyword “base” for calling it

![[Untitled 139.png]]

![[Untitled 140.png]]

###### Override ToString Method
More string methods here: [[Methods and statements]] [[String Manipulation]]![[Pasted image 20240208135901.png]]WriteLine method accepts different types of data as arguments, so it calls internally ToString method of these objects to convert it in strings before print it onto the console
So you can override the ToString method so you can print the information as you want to

### INTERFACES #interfaces

Specially useful when our classes don't have a relationship with each other and they don't share a base class, so inheritance isn't an option

Concept:

En C#, una interfaz (interface en inglés) es un tipo de referencia que define un conjunto de métodos, propiedades y eventos que una clase puede implementar. Una interfaz define la estructura que una clase debe seguir, pero no proporciona ninguna implementación de los miembros definidos en ella. En lugar de eso, las clases que implementan una interfaz deben proporcionar su propia implementación para cada miembro definido en la interfaz.

Las interfaces en C# se definen utilizando la palabra clave `**interface**`. Aquí tienes un ejemplo básico de cómo se define una interfaz en C#:

interface IReproductorMusical  
{  
void Reproducir();  
void Pausar();  
void Detener();  
}  

En este ejemplo, `**IReproductorMusical**` es una interfaz que define tres métodos: `**Reproducir()**`, `**Pausar()**`, y `**Detener()**`. Las clases que implementen esta interfaz deben proporcionar una implementación para cada uno de estos métodos.

Para implementar una interfaz en una clase, se utiliza la palabra clave `**:**`, seguida del nombre de la interfaz. Aquí tienes un ejemplo de cómo se implementaría la interfaz `**IReproductorMusical**` en una clase `**ReproductorMP3**`:

class ReproductorMP3 : IReproductorMusical  
{  
public void Reproducir()  
{  
// Implementación de la reproducción de música  
}  

```C#
public void Pausar()
{
    // Implementación de pausar la reproducción de música
}

public void Detener()
{
    // Implementación de detener la reproducción de música
}
```

}

Con esta implementación, la clase `**ReproductorMP3**` cumple con el contrato definido por la interfaz `**IReproductorMusical**`, ya que proporciona una implementación para cada uno de los métodos definidos en la interfaz. Esto significa que se puede tratar a `**ReproductorMP3**` como un `**IReproductorMusical**`, lo que facilita la interoperabilidad y el polimorfismo en tu código.

En otras palabras, una interfaz define equis cantidad de métodos pero no define qué hacen, cuando se hereda esa interfaz a una clase, es la clase misma la que debe definir qué exactamente hacen estos métodos?

Exactamente. Una interfaz en C# define un conjunto de métodos, propiedades o eventos que deben ser implementados por cualquier clase que herede esa interfaz. Sin embargo, la interfaz no proporciona ninguna implementación de estos métodos. En cambio, es responsabilidad de la clase que implementa la interfaz proporcionar la implementación concreta para cada método definido en la interfaz.

Por lo tanto, cuando una clase hereda una interfaz en C#, debe proporcionar la implementación para todos los miembros de la interfaz. Esto significa que la clase debe definir qué hacen exactamente estos métodos, cómo se comportan y qué acciones realizan cuando son invocados. Esto proporciona un contrato claro y consistente entre las clases que implementan la interfaz y el resto del código que las utiliza, ya que garantiza que cualquier clase que implemente la interfaz proporcionará cierto conjunto de funcionalidades definidas por los métodos de la interfaz, aunque la implementación concreta de estas funcionalidades puede variar según la clase específica.


Implementation

![[Untitled 141.png]]

![[Untitled 142.png]]

This example is a kinda stupid but is the first example the teacher teach us xd