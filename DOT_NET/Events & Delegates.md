# Delegates
A delegate is a type that can hold a reference to a method, and when you call the delegate, the method referenced will get called

Let's explain this concept with an example:

We have a List with 4 names, so we want to remove from it every name which contains the letter 'i'
![[Pasted image 20240414205745.png]]

for this, we have to our dispose the RemoveAll method, which needs a parameter `Predicate<T>` that have a Type and returns a boolean
![[Pasted image 20240414205632.png]]

![[Pasted image 20240414205816.png]]
Predicate is a delegate, so delegate is a blueprint that says what type and parameters would have a method to can store in it.
So we need a method that have a Type of variable and returns a boolean.

The filter method meets these characteristics
RemoveAll method contains instructions to do things internally once we pass the method that it needs, so we don´t need to worry about pass to Filter its parameter, because RemoveAll indicates it all what it needs to work correctly -In this case-

Calling our RemoveAll method and passing it as parameter the Filter method
![[Pasted image 20240414213208.png]]
it meets with the Predicate delegate and then make a foreach again with the remaining names
![[Pasted image 20240414213357.png]]


We are going to create our own delegates to filter a list of people

Let's consider the following class
![[Pasted image 20240414220210.png]]

So we want to filter a list of people and display only, for example, adults or other type of filter so let's create some objects of type Person and add them to a list called People
![[Pasted image 20240414220342.png]]
Create a delegate wich would be boolean type and contain as parameter a (Person p)
![[Pasted image 20240414220457.png]]

Since we want to apply different filters, let's actually create a method called DisplayPeople

TODO / PUT HERE 2ND EXERCISE OF DELEGATES DEMO
#### Anonymous methods
Anonymous methods in C# can be defined using the delegate keyword and can be assigned to a variable of the delegate type
This means that we don't have to define a method of our own each time we want to call a method that needs

![[Pasted image 20240415203743.png]]
You can store the functionality of a method in a variable of your delegate type, this is useful if is a concrete method and you don't want to reuse it in another part of your code

Passing an anonymous method directly
![[Pasted image 20240416132138.png]]
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
![[Pasted image 20240419135706.png]]
![[Pasted image 20240419135717.png]]
![[Pasted image 20240419140748.png]]

En el mundo de la programación, el término “trigger” se refiere a una **función que se ejecuta automáticamente en respuesta a un evento específico
