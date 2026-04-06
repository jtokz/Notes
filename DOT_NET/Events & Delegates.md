---
tags: [lang/csharp, area/basics, type/concept]
---

# Delegates
A delegate is a type that can hold a reference to a method, and when you call the delegate, the method referenced will get called

Let's explain this concept with an example:

We have a List with 4 names, so we want to remove from it every name which contains the letter 'i'
```csharp
// list of names
List<string> names = new List<string>() { "Aiden", "Sif", "Walter", "Anatoli" };

Console.WriteLine("----before----");
// print the names before the remove all method
foreach (string name in names)
{
    Console.WriteLine(name);
}
```

for this, we have to our dispose the RemoveAll method, which needs a parameter `Predicate<T>` that have a Type and returns a boolean
![[Pasted image 20240414205632.png]]

```csharp
// a method called Filter that takes a string
static bool Filter(string s)
{
    // return whether the string s contains the letter 'i'
    // the Contains Method will return a bool which we will return as well
    return s.Contains("i");
}
```
Predicate is a delegate, so delegate is a blueprint that says what type and parameters would have a method to can store in it.
So we need a method that have a Type of variable and returns a boolean.

The filter method meets these characteristics
RemoveAll method contains instructions to do things internally once we pass the method that it needs, so we don´t need to worry about pass to Filter its parameter, because RemoveAll indicates it all what it needs to work correctly -In this case-

Calling our RemoveAll method and passing it as parameter the Filter method
```csharp
// calling RemoveAll and passing a method Filter we created
names.RemoveAll(Filter);

Console.WriteLine("----After-----");
// print the names left after using RemoveAll method
foreach (string name in names)
{
    Console.WriteLine(name);
}
```
it meets with the Predicate delegate and then make a foreach again with the remaining names
![[Pasted image 20240414213357.png]]


We are going to create our own delegates to filter a list of people

Let's consider the following class
```csharp
class Person
{
    // name property
    public string Name { get; set; }
    // age property
    public int Age { get; set; }
}
```

So we want to filter a list of people and display only, for example, adults or other type of filter so let's create some objects of type Person and add them to a list called People
```csharp
#region
// Creating a person filter by his age

// Create 4 Person objects
Person p1 = new Person() { Name = "Aiden", Age = 22 };
Person p2 = new Person() { Name = "Sif", Age = 68 };
Person p3 = new Person() { Name = "walter", Age = 12 };
Person p4 = new Person() { Name = "Anatoli", Age = 32 };
// Add the objects to a list called People
List<Person> people = new List<Person>() { p1, p2, p3, p4 };
```
Create a delegate wich would be boolean type and contain as parameter a (Person p)
```csharp
// defining a delegate type called FilterDelegate that takes
// a Person object and return a bool
public delegate bool FilterDelegate(Person p);
```

Since we want to apply different filters, let's actually create a method called DisplayPeople
#### Anonymous methods
Anonymous methods in C# can be defined using the delegate keyword and can be assigned to a variable of the delegate type
This means that we don't have to define a method of our own each time we want to call a method that needs

```csharp
FilterDelegate filter = delegate (Person p)
{
    return p.Age >= 22 && p.Age <= 30;
};
Console.WriteLine("#####################");
DisplayPeople("Young adult", people, filter);
```
You can store the functionality of a method in a variable of your delegate type, this is useful if is a concrete method and you don't want to reuse it in another part of your code

Passing an anonymous method directly
```csharp
// Passing an Anonymous method directly
DisplayPeople("All people", people, delegate(Person p) { return true; });
```
As you can see you have the possibility to pass directly in the DisplayPeople method your delegate method to filter, as you can see anonymous methods are super flexible
###### Lambda Expressions as Delegate or Anonymous method in Lambda File [[Lambda Expressions]] #Lambda 




# Multicast Delegates And Events
Is a delegate that works as a list where it can store a reference to more than one method

todo: 
pics
why private methods instead public?
multi delegate functionality 
what's trigger and triggered

static fields on GameEvent Manager in order to not needing to create an object of this type to call this methods

wrongs:
make sure to use += when you want to add a method to an event
Accidentaly call the event from other place (like a constructor or wherever)

There are a special type of delegates called events and that is made to prevent these kind of mistakes

put adding event keyword to GameEvent delegates variables 
```csharp
// create two delegates variables called OnGameStart and OnGameOver
public static event GameEvent OnGameStart, OnGameOver;
```
```csharp
public Player(string name)
{
    PlayerName = name;
    // subscribe our methods to the OnGameStart
    GameEventManager.OnGameStart += StartGame;
    GameEventManager.OnGameOver = GameOver;
    GameEventManager.OnGameStart();
}
```
![[Pasted image 20240419140748.png]]

En el mundo de la programación, el término “trigger” se refiere a una **función que se ejecuta automáticamente en respuesta a un evento específico
