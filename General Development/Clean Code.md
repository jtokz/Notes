
*Need to do comments later*

Here we are talking about some principles in programming that will make our code more readable, scalable and maintainable

###### Clarity and precision in naming
When declaring variables and assigning them a name, we must try to be as clear as possible about their name and what use it will have, this will help us a lot when working with other people and so everyone will understand what use this variable has, or even ourselves if we see the code after a long time and do not remember its use

Example.
![[Pasted image 20240903124827.png]]

![[Pasted image 20240917182210.png]]

![[Pasted image 20240917182231.png]]

![[Pasted image 20240917182242.png]]

![[Pasted image 20240917182322.png]]

![[Pasted image 20240917203654.png]]

![[Pasted image 20240918121022.png]]
![[Pasted image 20240918115232.png]]
![[Pasted image 20240918121051.png]]
![[Pasted image 20240918121037.png]]
![[Pasted image 20240918133345.png]]
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
	![[Pasted image 20240920134434.png]]

#### Method structuring

Maybe when we see this we think it's fine, but in this method happens a bunch of things, and is better try to do one method for each thing that this method need to do.

This in order to have a code more readable, which can be modified at any time and these modifications don´t break the code
![[Pasted image 20240920135147.png]]

So let's do that
 
 This is a better way when in a future you want to change some things on the code and do it in a controlled way
![[Pasted image 20240920142929.png]]
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
![[Pasted image 20240923161115.png]]
This way you reduce the code and complexity giving a simpler solution
![[Pasted image 20240923161213.png]]
And having the same response