---
tags: [lang/csharp, area/oop, type/concept]
---

# OOP - Oriented Object Programming

To talk about OOP we have to start talking of classes

### Class #class

- A class is a blueprint of an object, what means a class is the template to create objects. this class defines which properties and methods will have the objects created from it
- It has actions/abilities - so called member functions or methods
- it has properties - so called member variables, you can create multiple different properties and you can call them later on
- Inheritance possible - the inheritance is possible with classes
- Can be used like a Datatype (ex. String is a Class)

```csharp
//A class in C# (and most other OOP programming languages)
//is a blueprint for creating objects.
//It defines a set of properties (data attributes)
//and methods (functions) that an object of that class will have
internal class Program
```
#### Access Modifiers
All types and type members have an accessibility level. The accessibility level controls whether they can be used from other code in your assembly or other assemblies. An [assembly](https://learn.microsoft.com/en-us/dotnet/standard/glossary#assembly) is a _.dll_ or _.exe_ created by compiling one or more _.cs_ files in a single compilation. Use the following access modifiers to specify the accessibility of a type or member when you declare it:

type or member can be accessed by any other code in the same assembly or another assembly that references it. The accessibility level of public members of a type is controlled by the accessibility level of the type itself.
```csharp
// public — accessible from everywhere
public class Class1 {
    public int age = 18;
    public void Walk() { }
}
public class Class2 {
    public void Main() {
        Class1 firstClass = new Class1();
        int i = firstClass.age; // OK
        firstClass.Walk();      // OK
    }
}
```
- [private](https://learn.microsoft.com/en-us/dotnet/csharp/language-reference/keywords/private): The type or member can be accessed only by code in the same/inside a `class` or `struct`.
```csharp
// private — not accessible from another class
public class Class1 {
    private int age = 18;
    private void Walk() { }
}
public class Class2 {
    public void Main() {
        Class1 firstClass = new Class1();
        int i = firstClass.age; // ERROR
        firstClass.Walk();      // ERROR
    }
}
```
- [protected](https://learn.microsoft.com/en-us/dotnet/csharp/language-reference/keywords/protected): The type or member can be accessed only by code in the same `class`, or in a `class` that is derived from that `class`.
```csharp
// protected — accessible in derived classes
public class Class1 {
    protected int age = 18;
    protected void Walk() { }
}
public class Class2 : Class1 {
    public void Main() {
        int i = age; // OK — this class is derived from Class1
    }
}
```
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
```csharp
internal class Car
{
    // This is a constructor
    // A constructor is similar to a method
    // that will be called once we create
    // an object of our blueprint car
    public Car() {
        Console.WriteLine("Car was created");
        // El constructor es un creador de objetos
    }
}
```

##### Calling the constructor on our Main Method
```csharp
static void Main(string[] args)
{
    // El constructor es un creador de objetos
    // O sea dentro de la memoria, y lo estamos almacenando dentro de esta referencia
    // This reference can be later called again in the code
    Car audi = new Car();
}
```

### Making methods on our new class Car

All of this methods will can be called by the new Objects type Car that we create
```csharp
public void Drive() { Console.WriteLine("Car is Driving"); }
// So now EVERY SINGLE CAR that we're going to create now
// will have access to this method called Drive
// Eso quiere decir que los objetos tipo Car que creemos tendrán acceso
// A los métodos que creemos para este objeto en particular

public void Stop() { Console.WriteLine("Car has stopped"); }
```

Calling methods in the class Program and the Main Method
```csharp
Car audi = new Car();

audi.Drive();

string userInput = Console.ReadLine();

if (userInput == "1")
{
    audi.Stop();
}
```

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

```csharp
// full specification constructor
public Car(string name, int hp, string color = "black")
{
    _name = name;
    _hp = hp;
    _color = color;
    Console.WriteLine($"{_name} was created");
    Drive();
}

// Member Methods
// private void Drive() — this method only can be called by its own class
private void Drive()
{
    Console.WriteLine($"{_name} is driving...");
}
public void Stop()
{
    Console.WriteLine($"{_name} has stopped");
}
```

You can for example, call it inside the constructor so that, once a new object is created, the method is called immediately and this cannot skip it

## Setters in C#

Let’s say we want to able be to change the name of an Object type ‘Car’ that we have created before, so, as we know the variable "_ name"  is private, so if you want to change a name, you must to use a method for it, so you can change through a setter, because commonly methods are public, so we let’s to create a method like the next way:

```csharp
public void setName(string name)
{
    _name = name;
}
```

```csharp
Car myCar = new Car();
myCar.setName("Porsche GT3 RS");
myCar.Info();
```

At the start our new object has the default name ‘Car’, but then through the method called setName, we can rename it for the string that we put in it

De esta manera podemos modificar la variable _name pero no directamente

That is a common practice in C-sharp programming

Cual es el punto de todo esto? por ejemplo se puede usar para asegurar que la variable nombre no sea un valor null, a través de un if statement que cheque si, en dado caso se usa un valor vacío (””) se le asigne un nombre por defecto igualmente

### Getters in C#

Getters are the opposite for Setters, with this you can GET how his name indicates, the information or any other thing from an object like in the case of Object Car, his name, hp, etc

```csharp
public string GetName()
{
    return "prefix " + _name + " suffix";
}
public int GetHp()
{
    return _hp;
}
```

##### Properties #properties
Properties make the same of set; get; but in one step, so you don’t need to define two methods (get and set separately)

```csharp
// Public Property
public string Name
{
    get { return _name; }
    set { _name = value; }
}
```
In this case we make a property called Name in which we use both, get and set, so when we want to call the different properties we have to use different syntax
```csharp
Car myCar = new Car();
myCar.Name = "My Porsche GT3"; // using property 'Name' as set
Console.WriteLine(myCar.Name); // using property 'Name' as get
```
They provide a flexible mechanism to read, write or compute the value of a private field
```csharp
// Public Property
public string Name
{
    get { return _name; } // get accessor
    set {                  // set accessor
        if (value == "")
        {
            _name = "Default Name";
        }
        else
        {
            _name = value;
        }
    }
}
```

Auto implemented properties
```csharp
// Auto implemented properties
public int MaxSpeed { get; set; }
```
```csharp
Car myCar = new Car();
myCar.MaxSpeed = 490;
Console.WriteLine(myCar.MaxSpeed);
```
These are properties which get and set don’t need to be defined, they are created by itself, internally it creates a private variable field and can only be accessed through this property

## Declaring properties and then implemented in the constructor #simpleconstructor

```csharp
// property called id
public int Id { get; set; }

// property called Name
public string Name { get; set; }

// property called GPA
public float GPA { get; set; }

// simple constructor
public Student(int id, string name, float gpa)
{
    Id = id;
    Name = name;
    GPA = gpa;
}
```

Read Only and Write Only Property

```csharp
public int MaxSpeed1 { get; } = 10; // Read Only
public int MaxSpeed2
{
    set                               // Write Only
    {
        _maxSpeed2 = value;
    }
}
```
You can make properties that you Only can Read or Write in them, so this is very useful when you want to create an object but you don’t want to change anything in it, this is called

- Immutable data
```csharp
public int MaxSpeed { get { return _maxSpeed; } } // Read Only
```
```csharp
// Default Constructor
public Car()
{
    // las buenas prácticas dicen de no dejar campos vacíos que no puedan ser null
    _name = "Car";
    _hp = 5;
    _color = "white";
    _maxSpeed = 5;
    Console.WriteLine($"{_name} was created");
    Drive();
}
```
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
```csharp
internal class ElectricalDevice
{
    // to determine the state of the device
    public bool IsOn { get; set; }
    // to store the brand of the device
    public string Brand { get; set; }

    // simple constructor
    public ElectricalDevice(bool isOn, string brand)
    {
        IsOn = isOn;
        Brand = brand;
    }

    // switch on the device
    public void SwitchOn() { IsOn = true; }
    public void SwitchOff() { IsOn = false; }
}
```

- In this demo we have a Parent/Base class called Electrical Device, that contains two properties, one to see if device is on and other with the brand of it
- A simple constructor that contains both properties
- And two methods, one to turn on the device and other to turn off it

This lines of code can be re used in other classes like Radio class and Tv class, because both shares same features
way 1
```csharp
// simple constructor re-using parent constructor (way 1)
public Chair(string color, string material)
{
    Color = color;
    Material = material;
}
```
way 2
```csharp
class Radio : ElectricalDevice
{
    // simple constructor re-using the parent constructor
    public Radio(bool isOn, string brand) : base(isOn, brand) { }
}
```

To inheritance the features of Parent class, you must use this sintaxis:

- Class NameClass : ParentNameClass

Then, when the constructor of the child class isn’t more complex than the parent class you can re use it, using the next syntax

public ConstructorName (Type prop1, Type prop2):base(parentProp1, parentProp2) { }

###### VIRTUAL AND OVERRIDE KEYWORD #virtualandoverride

```csharp
// methods
// an empty virtual method MakeSound for other classes to override
public virtual void MakeSound()
{
}
```

Making this method virtual means that it can be overridden by classes that inherit from animal

```csharp
class Dog : Animal
{
    // a new bool property to check if the dog is happy
    public bool IsHappy { get; set; }

    // constructor inherited
    public Dog(string name, int age) : base(name, age)
    {
        IsHappy = true;
    }

    // override of the virtual Eat method
    public override void Eat()
    {
        base.Eat();
    }
}
```

To can override a method you have to use keyword virtual in the base method, and when you want to override it in a child class inherited, you have to use override keyword in the method and inside use the keyword “base” for calling it

```csharp
// overriding the virtual method MakeSound
public override void MakeSound()
{
    //since every animal will make a totally different sound
    // each animal will implement their own version of MakeSound
    Console.WriteLine(“guau guau:3!”);
}
```

```csharp
// override of the virtual method Play
public override void Play()
{
    // check if the dog is happy, if yes call the Play method from the base class
    if (IsHappy)
    {
        base.Play();
    }
}
```

###### Override ToString Method
More string methods here: [[Methods and control structures]] [[String Manipulation]]```csharp
// modifying the ToString method so it shows me more organized information
public override string ToString()
{
    return String.Format($"{this.ID} - {this.Title}\nURL: {this.VideoURL}\nDuration: {Length} seconds\nBy {this.SendByUsername}");
}
```
WriteLine method accepts different types of data as arguments, so it calls internally ToString method of these objects to convert it in strings before print it onto the console
So you can override the ToString method so you can print the information as you want to
```csharp
public static void Main(string[] args)
{
    Dog dog1 = new Dog("Thomas", 12);
    Dog dog2 = new Dog("Maxi", 6);
    Dog dog3 = new Dog("Sasha", 6);
    Dog dog4 = new Dog("Karla", 9);

    List<Dog> dogs = new List<Dog>();
    dogs.Add(dog1);
    dogs.Add(dog2);
    dogs.Add(dog3);
    dogs.Add(dog4);

    foreach (Dog dog in dogs)
    {
        Console.WriteLine(dog.ToString());
    }
}

class Dog
{
    public string Name { get; set; }
    public int Age { get; set; }

    public Dog(string name, int age)
    {
        Name = name;
        Age = age;
    }

    public override string ToString()
    {
        return String.Format($"Name: {Name}, Age: {Age}");
    }
}
```

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

```csharp
class Ticket : IEquatable<Ticket>
{
    // property to store the duration of the ticket in hours
    public int DurationInHours { get; set; }
    // simple constructor
    public Ticket(int durationInHours)
    {
        DurationInHours = durationInHours;
    }

    bool IEquatable<Ticket>.Equals(Ticket? other)
    {
        if (other == null)
            return false;
        return DurationInHours == other.DurationInHours;
    }
}
```

```csharp
class Program
{
    static void Main(string[] args)
    {
        Ticket ticket1 = new Ticket(15);
        Ticket ticket2 = new Ticket(15);

        bool areEqual = ((IEquatable<Ticket>)ticket1).Equals(ticket2);
        Console.WriteLine(areEqual);
    }
}
```

This example is a kinda stupid but is the first example the teacher teach us xd

###### exercise Car and Chair

Class Car
```csharp
class Car : IDestroyable
{
    public string DestructionSound { get; set; }

    public Car(string color, string material)
    {
        DestructionSound = "CarDestructionSound.mp4";
    }

    public void Destroy()
    {
        Console.WriteLine($"Destroyed! {DestructionSound}");
    }
}
```
Class Chair
```csharp
class Chair : IDestroyable
{
    public string DestructionSound { get; set; }

    public Chair(string color, string material)
    {
        DestructionSound = "ChairDestructionSound.mp4";
    }

    public void Destroy()
    {
        Console.WriteLine($"Destroyed! {DestructionSound}");
    }
}
```
Interface IDestroyable
```csharp
interface IDestroyable
{
    // property to store the audio file for the destruction
    string DestructionSound { get; set; }

    // method to destroy an object
    void Destroy();
}
```
```csharp
static void Main(string[] args)
{
    Car car = new Car("Red", "Steel");
    Chair chair = new Chair("Brown", "Wood");

    car.Destroy();
    chair.Destroy();
}
```

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

```csharp
var cars = new List<Car>
{
    new BMW(250, "Black", "E46 M3"),
    new Audi(600, "White", "R8 2024")
};
```

One of things that you can do with polymorphism is for example, store in a List or any other data structure, different kind of objects that have been inherited from a Parent class.

In this example, both BMW and Audi are child form Car Class

```csharp
// Parent class Repair Method
public virtual void Repair()
{
    Console.WriteLine("Car was repaired!");
}
```
```csharp
// Child class BMW Repair Method
public override void Repair()
{
    Console.WriteLine($"Your BMW {this.Model} was repaired!");
}
```
```csharp
// Child class Audi Repair Method — no override keyword
public void Repair()
{
    Console.WriteLine($"Your Audi {Model} was repaired!");
}
```

As we can see, when a child override the Repair method it will be showed onto the console, otherwise if you just write the method in the child class and you don't modify his implementation it won't be shown

```csharp
static void Main(string[] args)
{
    // A car can be a BMW, an Audi, Porsche etc.
    // Polymorphism: no cast is required for implicit conversion from derived to base class
    var cars = new List<Car>
    {
        new BMW(250, "Black", "E46 M3"),
        new Audi(600, "White", "R8 2024")
    };

    foreach (Car car in cars)
    {
        car.Repair();
    }
    Console.ReadKey();
}
```


One advantage of instantiating an object as a type of the base class is that you are able to cast it to a Derived object. It wouldn't make much sense in this case to cast an audi to a BMW, but this is what would happen:

1. Car test = new Audi("A4", 200, "Black");
2. BMW newTest = (BMW)test;

If you instantiated the test car as an Audi however, you would get an error when attempting this:

1. Audi test = new Audi("A4", 200, "Black");
2. BMW newTest = (BMW)test;

I guess instantiating an object of base type would be useful when you don't have enough info available to classify a car as an Audi, and want to cast it to an Audi once you have that information.

```csharp
// Parent class ShowDetails Method
public void ShowDetails()
{
    Console.WriteLine($"This car has {this.HP}HorsePower and is Color {this.Color}");
}
```
```csharp
// Child BMW ShowDetails Method — 'new' hides the parent method
public new void ShowDetails()
{
    Console.WriteLine($"This {this.brand} {this.Model} has {this.HP} HP and it's Color {this.Color}");
}
```
```csharp
// Child Audi ShowDetails Method — without 'new' keyword
public void ShowDetails()
{
    Console.WriteLine($"This {this.brand} {this.Model} has {this.HP} HorsePower and it's Color {this.Color}");
}
```

How you can see with you put the keyword `new` in the method, when you create an instance of this method type, for example, in this case, type `BMW` and his reference is `BMW` too, the ShowDetails Method of `BMW` class is called, otherwise, if you create an object type Car and his reference is type for example, `BMW` or `Audi` the method that will be called would be the Parent Method.

So, what happens if you want to call the Parent ShowDetails Method instead an BMW object?

```csharp
// Create a Car-type variable from an Audi object to call parent ShowDetails
Car carRef = (Car)audiObject;
carRef.ShowDetails(); // calls parent method
```

You can create a new variable type Car and cast your, for example object type Audi and transform it in a Car type object

```csharp
// Child Audi ShowDetails — with override keyword
public override void ShowDetails()
{
    Console.WriteLine($"This {this.brand} {this.Model} has {this.HP} HorsePower and it's Color {this.Color}");
}
```

If you just override the Audi ShowDetails Method always will be called this for Reference values type Audi

###### Sealed Keyword
Means that a method cannot be override anymore or inherit form a class 
	
```csharp
namespace PolymorphicParameters
{
    sealed class BMW : Car
    {
    }
}
```


###### 'is a ' / 'has a' inheritance relationship / Composition

a bmw `IS A` car && a bmw `HAS A` carIdInfo

This is called "Composition" and is used for """Inherit""" between many quotes, some properties from a method without the need of inherit it, this allows that every class can be use this properties, not only a specific class and his child

```csharp
// 'Has a' relationship
// example: a BMW has a CarIdInfo
class CarIdInfo
{
    public int IDNUM { get; set; } = 0;
    public string Owner { get; set; } = "No owner";
}
```
```csharp
class Car
{
    private CarIdInfo _carIdInfo = new CarIdInfo();

    public void SetCarIdInfo(int idNum, string owner)
    {
        _carIdInfo.IDNUM = idNum;
        _carIdInfo.Owner = owner;
    }

    public void GetCarIDInfo()
    {
        Console.WriteLine($"The car has an ID #{_carIdInfo.IDNUM} and is owned by {_carIdInfo.Owner}");
    }
}
```
```csharp
audiB.ShowDetails();

Console.WriteLine("################");
M3 m3car = new M3(100, "blue", "M3SS");
m3car.SetCarIdInfo(6421530, "Jordan Tarazona");
m3car.GetCarIDInfo();
m3car.Repair();
```

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
```csharp
/* Just declaring this method as abstract you say ok,
whenever a class wants to inherit from me, it needs
to implement a functionality for Volume method      */
public abstract double Volume();
```

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

```csharp
// Write text into a file
string[] myLines = { "First line", "Second line", "Third line" };
Console.WriteLine("Enter the name of the file");
string fileName = Console.ReadLine();
File.WriteAllLines($@"C:\Users\Jorda\Documents\TextFiles\{fileName}.txt", myLines);
Console.WriteLine("Created with SUCCESS");
```

```csharp
// Add text to a file with StreamWriter (true = append / false = overwrite)
using (StreamWriter sw = new StreamWriter($@"C:\Users\Jorda\Documents\TextFiles\SampleTextFile.txt", true))
{
    sw.WriteLine("Additional line");
}

// Reading — call text outside the program
string text = System.IO.File.ReadAllText(source);
Console.WriteLine(text);

string[] lines = File.ReadAllLines(source);
foreach (string line in lines)
{
    if (line.Contains("Third"))
    {
        Console.WriteLine("line {0}: {1}", line);
    }
}
```

#### Structs
structs
```csharp
struct Game
{
    public string name;
    public string developer;
    public double rating;
    public string releaseDate;

    public void display()
    {
        Console.WriteLine($"Game name: {name} Developer: {developer} Rating: {rating} Release Date: {releaseDate}");
    }
}

class Program
{
    static void Main(string[] args)
    {
        Game game1;
        game1.name = "Ardensee";
        game1.developer = "Jordan";
        game1.releaseDate = "coming soon";
        game1.display();
    }
}
```
```csharp
// Cannot make Default constructor — You can only create a full constructor
public Game(string name, string developer, double rating, string releaseDate)
{
    this.name = name;
    this.developer = developer;
    this.rating = rating;
    this.releaseDate = releaseDate;
}
```

Difference with Class?
Structs cannot create default Constructor
Can implement one or more interfaces
Don't support inheritance

#### Enums
In c# an 'enum' is a data type that allow to define a set of constants with a name, this constants represent symbolic values that are associated to subjacent integer numbers

It's basically a set of constants, it's immutable and should be placed at the namespace level so it can be used by the whole library

```csharp
namespace EnumDemo
{
    // enum values are constants — they never change
    enum Days { Mo, We, Th, Fr, Sa, Su }
    enum Months { Jan = 1, Feb, Mar, Apr, May, Jun, Jul, Aug, Sep, Oct, Nov, Dec }

    class Program
    {
        static void Main(string[] args)
        {
            Days day = Days.Fr;
            Days day2 = Days.Th;

            // if Fr and Th are same will print true, otherwise false
            Console.WriteLine(day == day2);
            // gives us the Monday value as string representation
            Console.WriteLine(day);
            // we can get the integer value as well
            Console.WriteLine((int)Days.Mo);
            Console.WriteLine((int)Days.We);
        }
    }
}
```

