#oop #object #csharp #collections
[[OOP Core]] [[Arrays]] [[Methods and control structures]]
Generic and non-generic collections in C#

Collections are classes that we can use to store a collection of objects
- Unlike arrays, collections are not limited to one type of object
- No size constraints, it can grow in size as we add more elements

Why do we need Collections?
 
We use them to store, manage and manipulate groups of objects more efficiently for example:
- Adding
- Deleting
- Replacing
- Searching
- Copying
###### ArrayList (Non-Generic Collection)  #arraylist

- Accepts different type of data
- can store a lot amount of data

![[Pasted image 20240223123212.png]]
![[Pasted image 20240223124339.png]]
![[Untitled 96.png]]
##### List ( Generic Collection) #list 
![[Untitled 98.png]]
![[Pasted image 20240223125442.png]]
![[Pasted image 20240223125522.png]]
- Only can store one type of data, and you need to specify it once you gonna create it

Declaring a Collection
Make sure you are using System.Collections or System.Collections.Generic, if not write it on the top of the sheet

![[Untitled 98.png]]
### Hashtables #hashtables (non-generic collection)

Always 1 to 1 relationship

Podríamos poner un ejemplo para tratar de entenderlo:

Digamos que tenemos un Student registration system y que cada estudiante tiene un ID y muchos otros datos como name, age, grades, a picture entre otros

Para hacer que el sistema funcione necesitamos una ID especial para cada estudiante

Si guardamos esta información usando hashtables o un dictionary, el ID del estudiante sería la key y el student data sería un object que contuviera toda la otra información del estudiante, que sería el value

Así es como podrás encontrar los datos reales por decirlo de alguna manera

Entonces: Key vendría siendo la ubicación, o la identificación, el cómo vamos a encontrarlo y Value sería lo que contiene

*Making a class called Class student and creating a constructor of it

![[Untitled 101.png]]
#oop #object [[OOP Core]]
![[Untitled 102.png]]

![[Untitled 103.png]]

Hashtable is a collection of dictionary entries, so using a temporary object of dictionary entry, we can go through our hashtable using a foreach loop

![[Untitled 104.png]]

Por qué es necesario castear los objetos como entry o studentsTable? es necesario volverlos de tipo Student para poder acceder a sus propiedades como sería .Name, .Id, .GPA
En el contexto del código que proporcioné anteriormente, la variable `**entry**`, de tipo `**DictionaryEntry**`, se utiliza dentro de un bucle `**foreach**` para iterar a través de los elementos de la `**Hashtable**` `**studentsTable**`.

Cuando se utiliza un bucle `**foreach**` con una `**Hashtable**`, cada iteración del bucle `**foreach**` recupera un par clave-valor de la `**Hashtable**`. La variable `**entry**` en este caso es una instancia de `**DictionaryEntry**` que contiene dos propiedades:

- `**Key**`: Representa la clave (en este caso, el ID del estudiante).
- `**Value**`: Representa el valor asociado a esa clave (el objeto `**Student**`).

Entonces, en cada iteración del bucle `**foreach**`, la variable `**entry**` contiene un par clave-valor de la `**Hashtable**` `**studentsTable**`. Por ejemplo, si tienes cinco elementos en la `**Hashtable**`, el bucle `**foreach**` se ejecutará cinco veces, cada vez asignando a `**entry**` un par clave-valor diferente de la `**Hashtable**`.

Aquí hay un ejemplo simplificado para ilustrar cómo `**entry**` representa cada par clave-valor mientras se itera a través de la `**Hashtable**`:

```JavaScript
foreach (DictionaryEntry entry in studentsTable)
{
	// Accediendo a la clave y al valor de cada entrada en la Hashtable
	var key = entry.Key; // La clave (ID del estudiante)
	var value = entry.Value; // El valor (objeto Student)
}
```

En resumen, `**entry**` en el contexto del bucle `**foreach**` representa cada par clave-valor dentro de la `**Hashtable**` `**studentsTable**`, permitiéndote acceder dinámicamente a cada clave y su valor asociado durante cada iteración del bucle.
###### Another way to simplify this

![[Untitled 105.png]]

#### Dictionaries #dictionaries - (generic collection) 

Similar to hashtables a dictionary will store its value and a key value pair like we had with

In dictionary you have to specify the type of both, Key and Value like a list, so you need to declare if it is a string, int, etc

That means that we have a lot of flexibility, but not the same flexibility that we had in a hashtable

![[Untitled 106.png]]

![[Untitled 107.png]]

![[Untitled 108.png]]

![[Untitled 109.png]]

![[Untitled 110.png]]

![[Untitled 111.png]]

![[Untitled 112.png]]

![[Untitled 113.png]]

Update information:

![[Untitled 114.png]]

Remove
![[Untitled 115.png]]


Stacks and Queues
They are data structures, a data structure is a data organization, management and storage format that enables efficient access and modification

Each data structure has a unique way of storing and managing the data we insert into it.
  

#### STACKS #stack - Stores data in the form of a stack

- Data can be added/removed from top
- Can’t access the elements in the middle
- First come last out or last in, first out (LIFO)

Stack basically adds and removes data from the top only

- So this concept stacks are usually or very often used in mathematical algorithms and in data management

Stacks in Programming

- Reversing data
- Web browser back button - and example could be the back button, your browser save the web pages you clicked on and pressing the back button will load the last page you went to, and then the one before it
- Undo/Redo buttons

Both, stacks and Q’s are collections like lists and dictionaries

Stacks have their own unique operations that we can use, for example to manipulate and manage the data and they store

- Push(Object obj)
    
    Using the push method we can add data to the stack, of course the data always will be added on top
    
- Object Pop()
    
    Using the pop methos we can remove data from the top of the stack
    
- Object Peek()
    
    will return the data on the top of the stack without removing it

### QUEUES #queues

- Data can be added from the rear (back) and removed from the front and can’t access the elements in the middle (FIFO)

Uses:

- Operative systems/ IO requests, mouse movements
    
    So they can be executed in the order that they came in
    
- Managing web requests in a server
- Queuing input in video games

Methods of Queues:

- Enqueue(Object obj)
    
    Add data to the queue, of course the data will be added to the back of the queue
    
- Object Dequeue()
    
    Remove data from the front
    
- Object Peek()
    
    Return the object or data in the front of the queue without removing it

 Buscar ventajas y desventajas de las Colecciones no genéricas y Colecciones genéricas

STACKS IN CODE
  
![[Untitled 116.png]]

in console:

![[Untitled 117.png]]

![[Untitled 118.png]]

![[Untitled 119.png]]

![[Untitled 120.png]]

![[Untitled 121.png]]

![[Untitled 122.png]]

QUEUES IN CODE

![[Untitled 123.png]]
