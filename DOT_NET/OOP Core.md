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
#### Access Modifiers
All types and type members have an accessibility level. The accessibility level controls whether they can be used from other code in your assembly or other assemblies. An [assembly](https://learn.microsoft.com/en-us/dotnet/standard/glossary#assembly) is a _.dll_ or _.exe_ created by compiling one or more _.cs_ files in a single compilation. Use the following access modifiers to specify the accessibility of a type or member when you declare it:

type or member can be accessed by any other code in the same assembly or another assembly that references it. The accessibility level of public members of a type is controlled by the accessibility level of the type itself.
![[Pasted image 20240324100608.png]]
- [private](https://learn.microsoft.com/en-us/dotnet/csharp/language-reference/keywords/private): The type or member can be accessed only by code in the same/inside a `class` or `struct`.
![[Pasted image 20240324100442.png]]
- [protected](https://learn.microsoft.com/en-us/dotnet/csharp/language-reference/keywords/protected): The type or member can be accessed only by code in the same `class`, or in a `class` that is derived from that `class`.
![[Pasted image 20240324100852.png]]
- [internal](https://learn.microsoft.com/en-us/dotnet/csharp/language-reference/keywords/internal): The type or member can be accessed by any code in the same assembly, but not from another assembly. In other words, `internal` types or members can be accessed from code that is part of the same compilation.
- [protected internal](https://learn.microsoft.com/en-us/dotnet/csharp/language-reference/keywords/protected-internal): The type or member can be accessed by any code in the assembly in which it's declared, or from within a derived `class` in another assembly.
- [private protected](https://learn.microsoft.com/en-us/dotnet/csharp/language-reference/keywords/private-protected): The type or member can be accessed by types derived from the `class` that are declared within its containing assembly.

![[Pasted image 20240324102047.png]]
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

Let’s say we want to able be to change the name of an Object type ‘Car’ that we have created before, so, as we know the variable "_ name"  is private, so if you want to change a name, you must to use a method for it, so you can change through a setter, because commonly methods are public, so we let’s to create a method like the next way:

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
way 1
![[Pasted image 20240213115442.png]]
way 2
![[Untitled 136.png]]

To inheritance the features of Parent class, you must use this sintaxis:

- Class NameClass : ParentNameClass

Then, when the constructor of the child class isn’t more complex than the parent class you can re use it, using the next syntax

public ConstructorName (Type prop1, Type prop2):base(parentProp1, parentProp2) { }

###### VIRTUAL AND OVERRIDE KEYWORD #virtualandoverride

![[Untitled 137.png]]

Making this method virtual means that it can be overridden by classes that inherit from animal

![[Untitled 138.png]]

To can override a method you have to use keyword virtual in the base method, and when you want to override it in a child class inherited, you have to use override keyword in the method and inside use the keyword “base” for calling it

![[Untitled 139.png]]

![[Untitled 140.png]]

###### Override ToString Method
More string methods here: [[Methods and control structures]] [[String Manipulation]]![[Pasted image 20240208135901.png]]WriteLine method accepts different types of data as arguments, so it calls internally ToString method of these objects to convert it in strings before print it onto the console
So you can override the ToString method so you can print the information as you want to
![[Pasted image 20240307190803.png]]

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

###### exercise Car and Chair

Class Car
![[Pasted image 20240213162519.png]]
Class Chair
![[Pasted image 20240213162541.png]]
Interface IDestroyable
![[Pasted image 20240213162712.png]]
![[Pasted image 20240214132940.png]]

![[Pasted image 20240213133327.png]]

##### IEnumerable and IEnumerator #collections [[Collections]] 

IEnumerable interface is the base interface for many collections in C# and its job is to provide a way to iterate through a collection
So this is why we can use `foreach` loops to go through a list or a dictionary because they are inheriting from the IEnumerable interface
In other words when the collection class implement IEnumerable interface it becomes contable and we can count each element in it individually

There are two different versions of the IEnumerable interface
`IEnumerable T` for generic collections &
`IEnumerable` for non generic collections

Interface for generic collections is less complicated than non generic

``IEnumerable<T> contains a single method that you must implement when implementing this interface;
GetEnumerator(), which returns an IEnumerator T object
The returned `IEnumerator T provides the ability to iterate through the collection
by exposing a Current property that points at the object we are currently at in the collection.


TODO - Put here IEnumerable Examples

Polymorphism

![[Pasted image 20240310123419.png]]

One of things that you can do with polymorphism is for example, store in a List or any other data structure, different kind of objects that have been inherited from a Parent class.

In this example, both BMW and Audi are child form Car Class

![[Pasted image 20240310124644.png]]
![[Pasted image 20240310124715.png]]
![[Pasted image 20240310124740.png]]
![[Pasted image 20240310124754.png]]

As we can see, when a child override the Repair method it will be showed onto the console, otherwise if you just write the method in the child class and you don't modify his implementation it won't be shown

![[Pasted image 20240310125913.png]]


One advantage of instantiating an object as a type of the base class is that you are able to cast it to a Derived object. It wouldn't make much sense in this case to cast an audi to a BMW, but this is what would happen:

1. Car test = new Audi("A4", 200, "Black");
2. BMW newTest = (BMW)test;

If you instantiated the test car as an Audi however, you would get an error when attempting this:

1. Audi test = new Audi("A4", 200, "Black");
2. BMW newTest = (BMW)test;

I guess instantiating an object of base type would be useful when you don't have enough info available to classify a car as an Audi, and want to cast it to an Audi once you have that information.

![[Pasted image 20240310132543.png]]
![[Pasted image 20240310132551.png]]
![[Pasted image 20240310132558.png]]
![[Pasted image 20240310132354.png]]

How you can see with you put the keyword `new` in the method, when you create an instance of this method type, for example, in this case, type `BMW` and his reference is `BMW` too, the ShowDetails Method of `BMW` class is called, otherwise, if you create an object type Car and his reference is type for example, `BMW` or `Audi` the method that will be called would be the Parent Method.

So, what happens if you want to call the Parent ShowDetails Method instead an BMW object?

![[Pasted image 20240310134004.png]]

You can create a new variable type Car and cast your, for example object type Audi and transform it in a Car type object

![[Pasted image 20240310134406.png]]

If you just override the Audi ShowDetails Method always will be called this for Reference values type Audi

###### Sealed Keyword
Means that a method cannot be override anymore or inherit form a class 
	
![[Pasted image 20240312184815.png]]
![[Pasted image 20240312184825.png]]


###### 'is a ' / 'has a' inheritance relationship / Composition

a bmw `IS A` car && a bmw `HAS A` carIdInfo

This is called "Composition" and is used for """Inherit""" between many quotes, some properties from a method without the need of inherit it, this allows that every class can be use this properties, not only a specific class and his child

![[Pasted image 20240314154850.png]]
![[Pasted image 20240314154905.png]]
![[Pasted image 20240314154924.png]]

- Composition are a set of methods and properties separated in an own Class, so the objetive is encapsulation of this information so that you only be able to access it through methods that you provide
- This is known as encapsulation

### Composition vs Inheritance

#### Composición:

**Definición**: La composición es un principio de diseño en el que un objeto contiene otros objetos como parte de su estructura interna. Es decir, una clase puede tener una o más instancias de otras clases como miembros, lo que permite la construcción de objetos complejos a partir de objetos más simples.
#### Herencia:
**Definición**: La herencia es un mecanismo mediante el cual una clase (llamada subclase o clase derivada) hereda los atributos y métodos de otra clase (llamada superclase o clase base). La subclase puede extender o modificar el comportamiento de la superclase, lo que permite la creación de jerarquías de clases.

**Diferencias**:

- **Relación**: En la composición, los objetos están relacionados como "tiene un" (has-a), lo que significa que un objeto es parte de otro objeto.
- **Flexibilidad**: Al utilizar composición, los objetos pueden ser fácilmente reemplazados o modificados sin afectar la clase que los contiene.
- **Acoplamiento**: La composición generalmente resulta en un acoplamiento más débil entre las clases, ya que cada objeto puede operar de forma independiente.
- **Relación**: En la herencia, las clases están relacionadas como "es un" (is-a), lo que significa que la subclase es una versión específica de la superclase.
- **Extensión**: La herencia permite extender el comportamiento de la clase base, agregando nuevos métodos y atributos o sobrescribiendo los existentes.
- **Rigidez**: La herencia puede resultar en un acoplamiento más fuerte entre las clases, ya que los cambios en la clase base pueden afectar a todas las subclases.

**Similitudes**:

- Ambos conceptos tienen como objetivo principal facilitar la reutilización de código y promover un diseño modular y flexible.

#### Cuándo usar cada uno:

- **Composición**: Utiliza la composición cuando necesites construir objetos complejos a partir de partes más simples, cuando quieras evitar acoplamientos fuertes entre clases o cuando no exista una relación clara de "es un" entre las clases.
    
- **Herencia**: Usa la herencia cuando tengas una relación clara de "es un" entre las clases, cuando desees compartir comportamientos comunes entre clases relacionadas y cuando quieras aprovechar el polimorfismo para tratar objetos de diferentes clases de manera uniforme.

### Abstract Classes

When you use the abstract keyword you say to the program that you don't want to instance any object directly from this class, so you just want to use his properties and methods for his children

When you implement abstract keyword in a method you say this:
![[Pasted image 20240313112404.png]]
![[Pasted image 20240313112334.png]]

So, when you inherit a Class you must to define the abstract methods that you made
Otherwise you gonna have an error

##### Abstract class vs Interface

###### Definition:

Abstract: 
An abstract class is an incomplete class or a class that can't be instantiated, which means we cannot create objects of them.
The purpose of an abstract class is to provide a blueprint for derived classes and to set some rules.

Interface:
Interface is a contract and it can contain only method declarations
Cannot contain method definitions
They define an ability that a class has

###### Similarities:

Cannot be instantiated
Both support Polymorphism

###### Differences:

| Interface  | Abstract    |
| --- | --- |
|Not implemented at all  | Either partially implemented or not implemented at all    |
|Can't have constructor   | Can have constructor    |
|Contains only method  | May contain method definitions|
|Cannot have fields |Have fields |
|Classes can implement more than one interface|Classes can only extend(inherit) one class|
|Classes must implement all its members|Classes must implement abstract members only|


Some things:
- What the object is: abstract class
- What the object can do: Interface
- 'implementation' means that the declared methods could contain some code for his use, so if you say that an interface not implement at all refers to the methods don't have code, just are declared 
- An abstract class is designed to be inherited by subclasses that either implement or override its methods
- You wouldn't want to use interfaces in a situation where you're constantly writing the same code for all of the interface methods

### Who different variables stores data

##### When we declare a variable with a data-type, we are essentially saying "Hey! You're gonna hold this type of data." When we cast the variable to another data-type, we are saying whatever data you have, convert it to this data-type. So "**Data is changed**."

##### When we declare a variable with class-type. We are essentially saying "Hey! You're gonna **point** to this type of data( Object )." It's just a reference. When we cast it to another class-type, we are saying the object you're pointing to is this(casted type) class type now. "**Object remains unchanged in itself**." Since it's the same object, there's no independent copy.

###### READ AND WRITE FILE TEXT

![[Pasted image 20240322120555.png]]
![[Pasted image 20240322120618.png]]

#### Structs
structs
![[Pasted image 20240324105325.png]]
![[Pasted image 20240324114450.png]]

![[Pasted image 20240324114645.png]]

Difference with Class?
Structs cannot create default Constructor
Can implement one or more interfaces
Don't support inheritance

#### Enums
In c# an 'enum' is a data type that allow to define a set of constants with a name, this constants represent symbolic values that are associated to subjacent integer numbers

It's basically a set of constants, it's immutable and should be placed at the namespace level so it can be used by the whole library

![[Pasted image 20240405190055.png]]
![[Pasted image 20240405190127.png]]

