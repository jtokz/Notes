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

Deserialization
![[Pasted image 20240814152120.png]]
