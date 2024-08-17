We are going to talk about JSON language, json stands for JavaScript Object Notation which is an open standard file format and a data interchange format that uses human readable text to store and transmit data objects.
The power of json is that we can convert strings into objects in any programming language and vice versa, so convert objects to strings which we can then send over the network or store locally to retrieve them later

JSON object has the following format
![[Pasted image 20240814144316.png]]
curly brackets for the content, a key or name which will go stored the information in this case, in variable called name we are going to store the data "Sif". and if we want add more information it will be separated by comma

![[Pasted image 20240814144941.png]]
This is the way that this information would like as C# object, so we need to set a class that contain this properties.

So how we can convert json in c# object and vice versa? this concepts are called
#### Serialization and Deserialization
Imagine we load our json data or received it from a server and we managed to store it as a string
![[Pasted image 20240814145305.png]]
In order to understand this `@` character and other standards you can go to [[Standards]] and learn about this and other useful keywords

This is the method through we can Deserialize and Serialize files
![[Pasted image 20240814152120.png]]
And this is how Collections are in Json format
![[Pasted image 20240815120742.png]]

When you are dealing with Json you probably get it from an API, the data you are fetching could be representing a table in a database which means you won´t be receiving a single json object but a collection of json objects
A collection of json objects can be parse into an array of dogs, in this case for example
![[Pasted image 20240815122853.png]]
The different objects in json are separated by comma, and surrounded by square brackets

Let´s applicate this theory in Visual Studio

First of all we need a source of information, we are going to use an API in order to get some information about an object

This will be our source path:  https://my-json-server.typicode.com/typicode/demo/posts

If we put this on web it return us some information in json format:
![[Pasted image 20240815123307.png]]
So now we need to create a class to store this information and its properties that will be id and title, you can of course name this class whatever you want, so if is about post we'll call this Post class

So we create the class Post and set two properties that will be ones that we fetch from the api
You need to name the properties same that in the json file, otherwise it won't match to store it inside the property
![[Pasted image 20240815124316.png]]
Other thing that you can do is use JsonProperty to match with a property even if it's named different
![[Pasted image 20240815124544.png]]

Once you have created this class we can pass to Main method to do things, but before we need to know what is an async task, async tasks are key to achieving a better performance in our applications and avoid a block when realize hard operations

What is a sync task?
Is one that runs in a sequential or blocking manner, this means that when an operation is performed, the program waits for it to finish before continuing with the next instructions.
If the task takes too long, the main thread of execution (thread) becomes blocked, which can cause the application to freeze or become unresponsive, especially for input/output operations (such as accessing a database or making an http request)

An example:
![[Pasted image 20240815130053.png]]
Once we know the concept of Synchronous operation is easier to understand what Async task is, so an async operation is an operation that don't block the application, is executed in other thread so this task can takes all the time that it needs without blocking the main thread and freeze our app

So, back to our exercise we need first of all modify our Main Method and convert it in an async method
![[Pasted image 20240815130608.png]]
Then you can store the source where you going to get the information
![[Pasted image 20240815135707.png]]
Now you need to create an HttpClient object to manage the requests, all of this you need to store in vars in order to can operate later with them
So an async method needs something to wait for, so create a request with the `await` keyword, it waits in other thread different to the main thread the response of this request and use the GetAsync Method to get information from the (`url`) 

Remember all of this information will come in form of objects that we cannot yet deal with, this is just an object type HttpResponseMessage, so we need to adjust to other type of information we can deal with
![[Pasted image 20240815140338.png]]
by using ReadAsStringAsync we can transform this response in a string that we can use, it will come in json format
![[Pasted image 20240815140829.png]]
so we need to transform in C# objects of the class we created earlier, and of we can see is not just an simple object, it's a collection of them, in this case is necessary to declare it as an array of objects with []
![[Pasted image 20240815141140.png]]
In the syntax we can see that we are using the JsonConvert class, in order to can be able to use this objects we need to add a NuGet package so open it and download the Newtonsoft.Json package
![[Pasted image 20240815141345.png]]
![[Pasted image 20240815141427.png]]
and finally add the using to our app
![[Pasted image 20240815141507.png]]
In .NET 8.0 is not necessary add this libraries because you can use they objects by default

So back to where we were, JsonConvert class has different methods and properties, this for example is a static method, so you don't need to create an object to use it and you can access to all of its content
![[Pasted image 20240815141140.png]]
DeserializeObject is the method through we can convert Json content in C# content so you set the <Class ([])<-- square brackets if is a collection> and the json file you want to convert

Disclaimer: All of this you need to do inside a try & catch because internet can throw a lot of errors

And finally we needs to dispone the connection
![[Pasted image 20240815142309.png]]
This is basically how you can get information from internet, an api wherever other source

In the following link you can find info about a project => [[Currency Converter using an API]]
