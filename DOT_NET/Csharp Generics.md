Generics are used to build generic functionalities
Can create Generic #class, #methods, #interfaces and delegates


For example, List<"T"> is a generic when T is the data type you gonna use in this list
List<"int"> numbers = new List<"int">();
List<"Product"> products = new List<"Product">();

but why you would want make use of generics?
just like a list, you don't want to build the entire functionality for each single data type. Instead you want to share functionality across multiple data types.
So if we would create a list no matter of what data type, Product for example

List<"Product">products = new List<"Product">();
products.Add(...);
products.Find(...);
products.Remove(...);

And no matter what data type we would specify. it would be a string, an integer, product, person, whatever we would always have access to add, find, remove, and so on because list is a generic type and grants us therefore access to all of its methods

When you see <"T"> it means type, any generic type

![[Pasted image 20250215105758.png]]
Here we have created a class which is generic, but we can also create generic methods
We can put generic methods in generic classes or in default classes which are not generic
![[Pasted image 20250215120140.png]]

In resume:
- You can create generic classes, structs, interfaces, methods, and delegates
- Share functionality across multiple data types
- Reduce duplication and improve maintainability
- Used by advanced code design patterns (ex. Repository design pattern)
Biggest pitfall:
- Over-architecting the code when a simpler solution would have done the job too
 Biggest upsides
 - Unlocking next-level C# code, the ability to work on well-designed software and creating your own frameworks

##### Create own generic class
Here we can see a generic class Box which needs a specific type when an instance of its is created, it contains a property called Content which has the same type as its instance, so if you declare Box<"bool"> its property Content will be a bool too.
![[Pasted image 20250215123337.png]]
This class contains a method called Log, which returns a string with some info and the property Content

We create two instances of box, one of type int and one of type string
![[Pasted image 20250215123349.png]]
They are different types, but both can make use of the Content property and the Log method, no matter they are different and it is thanks to the class is generic


##### Using generics as parameters, returns and more
![[Pasted image 20250215131613.png]]
Here we have a private property T "content" with a initial value passed through the constructor with in parameters.

As the content property is private you don't have access to modify it so we create a method in order to change its value, same way by parameters
![[Pasted image 20250216233733.png]]
Look the GetContent method which return us a value in the respective datatype we have created the Box object thanks to T keyword in his implementation

##### Multiple generic types in a class
You can have more of one generic type in classes, just like Dictionary which has two <"TKey, Tvalue"> you can make use of more than just one generic type
![[Pasted image 20250217191336.png]]
![[Pasted image 20250217191506.png]]

##### Generic methods without generic classes
This is when you need specifically a method that accepts different data types but don't need that the class would be generic

![[Pasted image 20250217193207.png]]
![[Pasted image 20250217193623.png]]
This because Log method is generic

##### Constraints for generic classes
![[Pasted image 20250218220540.png]]
Following the before exercise we can store value type variables in our generic class Box, but we can for sure store entire objects, what happens if we don't want our box to be able to get created with interger type or float type, or any value type for example?

In that case we can set up a constraint so we can limit this functionality
![[Pasted image 20250218221614.png]]
![[Pasted image 20250218221624.png]]

##### Custom interface constraint
Suppose that we want to create a class named "Repository" and we want to make sure that in our application whatever we save to that repository has a ID, so ID is mandatory
![[Pasted image 20250219224644.png]]
This way only classes that inherit IEntity are enabled to be inside Box<"T"> and use its methods like Add
![[Pasted image 20250219231229.png]]
##### Constraints for generic methods
![[Pasted image 20250219234838.png]]
This == keyword only works with reference type objects like class, array, etc, so if you want to use something like this you must to make use of a constrait like Where T : class, This ensures that only classes can make use of this method, and as we can see, we can set constraints for our generic methods too, just like we did for generic classes
![[Pasted image 20250220000219.png]]

TODO: Put here why value types cannot use this method and == operator in this case**

##### Generic interfaces
You can too of course make your own generic interfaces that provides flexible contracts for multiple classes
![[Pasted image 20250220212117.png]]
Then you just need to inherit the interface and make the implementation of its methods and else
![[Pasted image 20250220212342.png]]

Why would you choose a generic repository over a generic class or other way around?
- if you want to have flexible contracts across multiple classes
When you would prefer a generic class over a generic interface?
- if you want to share the same functionality across multiple classes

##### Constraints for generic interfaces
Supose that in our project we implement an interface to check if an object has an Id, this interface would be called IEntity, so, supose that we want that only objects that has id would be able to make use of our IRepository interface
![[Pasted image 20250220214213.png]]
![[Pasted image 20250220214230.png]]
This means that in the previous exercise our ProductRepository class cannot contracts whit IRepository because the Product class that submit inside IRepository isn't implementing the IEntity interface, how we said IRepository only allow this if our type T is implementing the IEntity
![[Pasted image 20250220214333.png]]
![[Pasted image 20250220215632.png]]
This way it will works
![[Pasted image 20250220215652.png]]
but when you gonna make use of this kind of restrictions? well, let's say that we have a class called User and for whatever reason this class don't need an Id, just a name, nothing else.
Now, this should not work if we create a repository for that because it's again against our code guidelines and it won't work because we cannot store it to a database because we need an Id property so we have a primary key for example
![[Pasted image 20250220220925.png]]
![[Pasted image 20250220221015.png]]
![[Pasted image 20250220221004.png]]
This way User class can be stored in a Repository, because we implement IEntity in our User class and its property Id

##### Combining generic classes with generic interfaces
In rare situations like you enter a new company that follows strictly design pattern and you need to make use of a combination of generic classes and generic interfaces you should be familiar with this and what's going on under the hood and you should be able to see the pattern that they are using in the code
![[Pasted image 20250223132831.png]]
The approach of this things is that you don't need re-write code, this code works for every class you want to implement to
  
##### Generic reflections
![[Pasted image 20250224200815.png]]
C# is type safe, it has types and classes so most of the time when you get an error you're still in visual studio or when app starts, but with generics where all the types are generic, chances are that you might run if your logic gets more complicated into scenarios where you want to learn or find out more, or write specific scenarios for when a generic type is of a specific value, for example, hey if we have a generic type of type string here, we want to do that and if the generic type is of type integer, we want to do it that way
And you can do that by using reflection All information about what's under the hood in c# you can find that out with the type of keyword if you store it inside of Type you can inspect it basically, one common thing that you do with that during usual human development

##### Generics by default in Csharp
###### Action<>
![[Pasted image 20250303203210.png]]
You can use action like i did above, which encapsules a method without parameters and not return, that is, void

The generic part of this is when you make use of <"T">
![[Pasted image 20250303203652.png]]
Encapsulates a method with an unic parameter and don't return a value

But this Action delegate can store since 16 parameters and cannot return a value (a void)
![[Pasted image 20250309103411.png]]
something like this
![[Pasted image 20250309104517.png]]
###### Func<>
The principal difference between Action and Func is that Func generic delegate returns a value of type TResult, so you can specify what do you want to get from it
![[Pasted image 20250309105335.png]]
Same way you can pass it since 16 parameters and an out TResult
![[Pasted image 20250309110011.png]]
other example
![[Pasted image 20250309110410.png]]
we can of course make it on this way
![[Pasted image 20250309110916.png]]
###### Predicate<>
Predicate returns a bool that basically match any specific conditions, for example if you want to check if a person has a specific age or if a product matches a specific category or whatsoever
![[Pasted image 20250309111858.png]]
other example making use of a method that needs a Predicate
![[Pasted image 20250309112346.png]]



So in comparison, we now have an Action that doesn't return anything, it just executes code, have a Function where we can specify tons of parameters and the return value that we will get back once the code got executed, just like a method and we have a Method that returns true or false