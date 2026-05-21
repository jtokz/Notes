---
tags: [area/basics, type/concept]
---

*Need to do comments later*

Here we are talking about some principles in programming that will make our code more readable, scalable and maintainable

###### Clarity and precision in naming
When declaring variables and assigning them a name, we must try to be as clear as possible about their name and what use it will have, this will help us a lot when working with other people and so everyone will understand what use this variable has, or even ourselves if we see the code after a long time and do not remember its use

Example.
```csharp
// bad naming variables
int n = 1;
string s = "Jordan";

// good naming
int studentsCount = 226;
string studentName = "Pedro";
```

![[Pasted image 20240917182210.png]]

![[Pasted image 20240917182231.png]]

```csharp
//-- Naming classes and its methods --
class OrderProcessor
{
    public void ProcessOrder()
    {
    }
    public void PrintOrder()
    {
    }
    public void DeleteOrder()
    {
    }
}
```

![[Pasted image 20240917182322.png]]

![[Pasted image 20240917203654.png]]

```csharp
// -- Code Documentation --
/// <summary>
/// Represents a customer with Id and Name
/// </summary>
public class Customer
{
    /// <summary>
    /// Gets the Id of the customer
    /// </summary>
    public int Id { get; }
    /// <summary>
    /// Get or Set the Name of the customer
    /// </summary>
    public string Name { get; set; }
}
```
![[Pasted image 20240918115232.png]]
![[Pasted image 20240918121051.png]]
![[Pasted image 20240918121037.png]]
```csharp
/// <summary>
/// Gets the customer by id
/// </summary>
/// <param name="customerId">The id for the customer to retrieve</param>
/// <returns>Return the customer</returns>
public Customer GetCustomerById(int customerId)
{
    return new Customer { Name = "John" };
}
```
![[Pasted image 20240918133732.png]]

#### Code formating and structuring

In a class you can organize the information in this way:
- Properties
- Fields
- Constructor
- Methods

#### Organizing files and namespaces

When you are working you will have similar type of objects, some objects could be models and other services for example and you can group this objects in folders, in order to do that you can modify the namespace even working inside it, by adding a dot (.) and the name of the extension of this namespace and then create and move the classes to its respective folders
![[Pasted image 20240920133922.png]]

Then, when you gonna use this objects you can import its content using keyword 'using' and the namespace extension, this is usually done automatically
```csharp
using SimpleTests.Models;

namespace SimpleTest
{
    class Program
    {
        public static void Main(string[] args)
        {
            Customer customer = new Customer();
        }
    }
}
```

#### Method structuring

Maybe when we see this we think it's fine, but in this method happens a bunch of things, and is better try to do one method for each thing that this method need to do.

This in order to have a code more readable, which can be modified at any time and these modifications don't break the code
```csharp
class OrderProcessor
{
    public void ProcessOrder(Order order)
    {
        // validate order
        if (order.Quantity > 0)
        {
            // save order
            Console.WriteLine("Order Saved!");
            // notify customer
            Console.WriteLine("Customer Notified!");
        }
    }
}
```

So let's do that
 
 This is a better way when in a future you want to change some things on the code and do it in a controlled way
```csharp
class OrdersProcessor
{
    public void ProcessOrder(Order order)
    {
        if (IsValid(order))
        {
            SaveOrder(order);
            NotifyCustomer(order);
        }
    }

    private bool IsValid(Order order)
    {
        // TODO: Validate order logic
        return true;
    }

    private void SaveOrder(Order order)
    {
        // TODO: Save order logic
    }

    private void NotifyCustomer(Order order)
    {
        // TODO: Notify customer logic
    }
}
```
it is made in this way because when you want to use that logic anywhere else again, example, saving an order, you don´t have to duplicate that code following the dry principle, don´t repite yourself.
We simply create an encapsulated method that handles the logic for saving, notification or whatever

#### DRY principle (Don't repeat yourself)
Says that you shouldn't duplicate your code

Here there's a lot of duplicated code
![[Pasted image 20240920151900.png]]
Notice that this is a problem when you for example want to change something like the discount for another bigger which is now set to 1000usd to 800. 
*You have to change it three times* 

So let's try to reduce the redundant code and try to make it shortly

![[Pasted image 20240921163918.png]]
This way code is reduced a lot en avoid some bugs that could be happens
![[Pasted image 20240921163955.png]]
And then you just simply use it

#### KISS principle (Keep it simple, stupid)
The name say all

This principle has some specific steps:
1. Review the code if you're curious if you could or should change something
2. Find the parts of the code where you think it's overly complex: 
	For example: Loops are very performance heave so when you stumble across code and you identify multiple loops, be aware. Same applies for nested loops.
	If you see multiple loops inside of a method, you want to dig deeper
3. Refactoring the code to make it more straightforward 

Example:
Imagine we have this code

How you can refactor it?
![[Pasted image 20240923124911.png]]
So we can notice that we are iterating through the same List and using the same if statement so we can just simply remove all of second foreach and simply add totalPrice to the first
```csharp
public static void PrintOrdersDetails(List<Order> orders)
{
    Console.WriteLine("#### Your Orders #####\n");
    double totalPrice = 0;

    foreach (var order in orders)
    {
        if (order.Quantity > 0)
        {
            Console.WriteLine($"Product: {order.ProductName}");
            Console.WriteLine($"Order ID: {order.Id}");
            Console.WriteLine($"Quantity: {order.Quantity}");
            Console.WriteLine($"Price: {order.Price}");
            totalPrice += order.Price;
        }
    }
    Console.WriteLine($"Total price: {totalPrice}");
}
```
This way you reduce the code and complexity giving a simpler solution

Just call
![[Pasted image 20240930115917.png]]
![[Pasted image 20240923161213.png]]
And having the same response

#### Exception Handling
use a lot of try catch lmao
okno
When the application goes wrong you need to send a message to the final user explaining what is going on? this message must to be as descriptible as possible so that the user understand what's wrong with the app 

This is an example to how you don't to show an exception to the user, you need to be descriptive and clear
![[Pasted image 20240930113253.png]]
Something like this
![[Pasted image 20240930114039.png]]
This describes perfectly how you must to handle an exception, showing a short and clear message explaining what's going on?

Other example
```csharp
public void ReadFile(string filePath)
{
    try
    {
        string content = File.ReadAllText(filePath);
        Console.WriteLine(content);
    }
    catch (FileNotFoundException ex)
    {
        Console.WriteLine("File not found: " + ex.Message);
    }
    catch (UnauthorizedAccessException ex)
    {
        Console.WriteLine("You don't have the permissions to access here: " + ex.Message);
    }
    catch (Exception ex)
    {
        Console.WriteLine("An error occurred: " + ex.Message);
    }
    // some common exceptions
    // File not found
    // Unauthorized Access
    // Other Exception
}
```
Here we covered some specific exceptions and then general exceptions, this way you provide the necessary information to the user or another developer about what's wrong with the app 
###### The most important thing is APP NEVER SHOULD TO CRASH

## SOLID Principles
Make code more understandable, flexible and maintainable 

There are 5 principles:
#### Single Responsibility
A class should have only one job or responsibility, this one keeps your code encapsulated and easy to maintain, so if you need that functionality and this other and that, then you just bring them together

Example.
In this example we have a class with MULTIPLE responsibilities like Adding orders, Logging orders and Notify orders, so as this principle says a class only must to have one responsibility
```csharp
class OrderService
{
    List<Order> orders = new List<Order>();

    public void AddOrder(Order order)
    {
        orders.Add(order);
    }

    // method to Log the order to a file
    public void LogOrder(Order order)
    {
        Console.WriteLine($"Order {order.Id} logged.");
    }

    public void NotifyCustomer(Order order)
    {
        Console.WriteLine($"Order {order.Id} added.");
    }
}
```

Those three are entirely different responsibilities, so you know you could group them adding order, deleting order, getting an order and all of that and that would be one responsibility, but Logging has nothing to do with managing, so adding or removing them.
So in that case we would have to split up the OrderService into multiple subclasses so that each class only has one responsibility. 

One class to actually handle the orders, adding, removing and so on.
One class that is only here for notification.
And One class that is here for logging the order.

So let's refactor this class
![[Pasted image 20241009110727.png]]

This way each of them is built for a single responsibility, OrderService handles the access adding, getting, removing of orders, OrderLogger logs orders, OrderNotifier notifies, now the challenge is make the program works fine again.

After adding this new classes we can make that our OrderService acts as the Orchestrator handling the other classes, making first private instances of each new subclasses and making it works inside its own methods, in this order of ideas our OrderService continues being the main Handle class and could call other subclasses in order to making them works
```csharp
class OrderService
{
    private List<Order> orders = new List<Order>();
    private OrderLogger logger = new OrderLogger();
    private OrderNotifier notifier = new OrderNotifier();

    public void AddOrder(Order order)
    {
        orders.Add(order);
        logger.LogOrder(order);
        notifier.NotifyCustomer(order);
    }
}
```
#### Open/Closed
Software entities should be Open for extensions but closed for modification. 

It means that if you have a code that works fine and you want to add a new feature or extend that code, then you just create derived version from that, you add interfaces or whatever, but you don't change the code base because that one is already working and if you want to add some additional functionality you want to make use of inheritance, interfaces so on.
So we are open for extension, but we are closed for modification on the existing code

The open-close principle give us a way on how we can or should extend the functionality of our software

Here this application works, and is well designed as of right now.
But what happens if we should create another type of invoice, for example a discounted invoice? and open-close principle says we don't modify the existing logic that is working? At this point our application works fine, absolutely well designed and perfectly fine and we should not modify the logic here
![[Pasted image 20241009122629.png]]
![[Pasted image 20241009122709.png]]

Instead of modify the existing algorithms and the stuff that we have in our application, we want to create new classes and extend the functionality and rely on what's working already.
This basically means that if we would create or we need to create a discounted invoice, for example, we  would simply a new Class DiscountedInvoice that is going to inherit from Invoice class, this way your code will be Open to extend and Closed to modify, and by inheriting the redundant code is reduced 
#### Liskov Substitution 
Is here to help us to achieve that we can replace our derived clases with base classes without causing errors

Example.
One example fore this would be, we got a base class called Bird, that implements a method that allows birds to fly, but we are going to add a new bird "Penguin", what happens? birds cannot fly. So, how we can say to the app that penguins are not enabled to fly, how we can block the Fly method to penguins ir order that no other programmer can call Fly method?

```csharp
class Bird
{
    public virtual void Fly()
    {
        Console.WriteLine("Flying...");
    }
}
```
```csharp
class Penguin : Bird
{
    public override void Fly()
    {
        throw new NotImplementedException("Penguins cannot fly");
    }
}
```
```csharp
Bird sparrow = new Bird();
sparrow.Fly();
Bird penguin = new Penguin();
penguin.Fly(); // This will throw an exception
```

So now we got a exception because penguins can't fly, to solve this problem we first need to focus in the error:

All birds cannot fly, but All birds can make a sound, so we can implement an interface to manage which birds can Fly

```csharp
public interface IFlyable
{
    void Fly();
}
```
This way you can only implement this functionality to birds that can fly
And let base Bird class only for things that all kind of birds can do, like Make a sound or something like that
```csharp
class Bird
{
    public virtual void MakeSound()
    {
        Console.WriteLine("Kikiriki");
    }
}
```
```csharp
// *** Liskov Substitution ***
Bird sparrow = new Sparrow(); // store a Bird class sparrow in a Sparrow variable
sparrow.MakeSound(); // As a bird, can make a sound but for fly
((IFlyable)sparrow).Fly(); // we need to cast it

Bird penguin = new Penguin();
penguin.MakeSound();
```
This way only birds that can fly will have access to this functionality
#### Interface Segregation
Clients should no be forced to depend on interfaces they do not use.

If you have bloated interfaces which offer tons of functionality, but your classes are not using all of those methods that you have inside of your interfaces, then you should break down that one bloated interface into smaller interfaces, and then you let just your classes implement whatever functionality they need


In this example, we have the Interface IWorker, which implements two methods, Work and Eat, so each one the classes that use this contract,  must be forced to implement both methods, and that would cause problems like the next one
```csharp
interface IWorker
{
    public void Work();
    public void Eat();
}
```
```csharp
class Robot : IWorker
{
    public void Work()
    {
        Console.WriteLine("Robot is working");
    }
    public void Eat()
    {
        // Robots don't eat, but are forced to implement this method
        Console.WriteLine("Robots can't eat!");
    }
}
```
Robot workers can Work but they don't need to eat, so they will be forced to make use of Eat method

How we can solve this problem? splitting in two interfaces, IWorkable and IEatable, this way classes could implement just the methods that specifically need 
![[Pasted image 20250209114056.png]]
```csharp
class Robot : IWorkable
{
    public void Work()
    {
        Console.WriteLine("Robot is working");
    }
}
```
```csharp
class Worker : IWorkable, IEatable
{
    public string? Name { get; set; }
    public void Work()
    {
        Console.WriteLine("Working...");
    }
    public void Eat()
    {
        Console.WriteLine($"{Name} is eating...");
    }
}
```

#### Dependency Inversion
High-level modules should depend on abstractions, not on low-level modules 
Is used to reduce the coupling

Example
```csharp
public class EmailService
{
    public void SendEmail(string to, string subject, string body)
    {
        Console.WriteLine($"Sending email to {to} with subject {subject}");
    }
}
```
```csharp
public class Notification
{
    private readonly EmailService _emailService;

    public Notification()
    {
        _emailService = new EmailService();
    }
    public void Send(string message)
    {
        _emailService.SendEmail("user@example.com", "notification", message);
    }
}
```
```csharp
// *** Dependency Inversion ***
Notification notification = new Notification();
notification.Send("Hola");
```

In this example, Notification class (a high-level module) directly depends on the EmailService class (a low-level module)
This violates the dependency inversion principle because Notification is tightly coupled to EmailService
That means that if we want to make changes in EmailService we need to change things in Notification class too

Instead, we can make use to interfaces to uncouple the code

```csharp
public interface IEmailService
{
    public void SendEmail(string to, string subject, string body);
}
```
We can use an interface that abstracts the methods needed to send emails and thus be able to provide different implementations with different classes that inherit it.
If you just simply create an instance of any email class inside Notification class, you will have to change code from many parts if you want to change the email service or something like that
```csharp
public class EmailService : IEmailService
{
    public void SendEmail(string to, string subject, string body)
    {
        Console.WriteLine($"Sending email to {to} with subject {subject}");
    }
}
```
This way you abstract the logic inside EmailService and pass to notification class through IEmailService interface
```csharp
public class Notification
{
    private readonly IEmailService _emailService;

    public Notification(IEmailService emailService)
    {
        _emailService = emailService;
    }
    public void Send(string message)
    {
        _emailService.SendEmail("user@example.com", "notification", message);
    }
}
```
Like this you are injecting the dependency (EmailService class) as an IEmailService interface object through the constructor
```csharp
public class MockEmailService : IEmailService
{
    public void SendEmail(string to, string subject, string body)
    {
        Console.WriteLine($"This is a test, sending a fake email to {to} with subject {subject}");
    }
}
```
This is also very useful to make unit test since you can inject the Mock dependency through the constructor thanks to the interface that works as a bridge between the high-level module and the low-level module (MokeEmailService in this case)
```csharp
// *** Dependency Inversion ***
IEmailService emailService = new EmailService();
Notification notification = new Notification(emailService);
notification.Send("Hola");

IEmailService fakeEmailService = new MockEmailService();
Notification fakeNotification = new Notification(fakeEmailService);
fakeNotification.Send("This is a test, email send correctly!");
```
Finally, we create instances of each emailService (normal and mock) and then store them in IEmailService Objects to be able to inject them through the Notification constructor