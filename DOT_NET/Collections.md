---
tags: [lang/csharp, area/oop, type/concept]
---

**Ver también:** [[OOP Core]] · [[Arrays]] · [[Methods and control structures]]

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

```csharp
// Declaring an ArrayList usesFront amount of objects
ArrayList myArrayList = new ArrayList(100);

// adding elements to the arrayList
myArrayList.Add("Amanda");
myArrayList.Add("Alexander");
myArrayList.Add(32);
myArrayList.Add(1.5);
myArrayList.Add(true);
myArrayList.Add(2344);
myArrayList.Add(244);
myArrayList.Add(202);

// remove element with specific value from the ArrayList
myArrayList.Remove(32); // only remove the first 32 from the list

// delete element at specific position on index
myArrayList.RemoveAt(0);
```
```csharp
double sum = 0;

foreach (object obj in myArrayList)
{
    if(obj is int)
    {
        sum += Convert.ToDouble(obj);
    }
    else if (obj is double)
    {
        sum += (double)obj;
    }
    else if (obj is string)
    {
        Console.WriteLine(obj);
    }
}
Console.WriteLine(sum);
```
![[Untitled 96.png]]
##### List ( Generic Collection) #list 
```csharp
using System.Collections.Generic;
```
```csharp
// ###################################
// Declaring List
var numbers = new List<int>(); // List of type int without values
var numbers2 = new List<int> { 1, 5, 90, 35 }; // List of type int with values

// Adding and Removing values:
numbers.Add(7); // Adds an integer with a value of 7 to our list
numbers.Remove(7); // Removes an element with a value of 7 from our list

// Remove at index
numbers.RemoveAt(2); // Removes an element at a specific position (index)

// Sorting a list
numbers.Sort(); // Sort in ascending order

// Clearing a list
numbers.Clear(); // Deletes every element so our list is empty
```
```csharp
// ####################################
// Lists and loops
var numbers2 = new List<int> { 5, 10, 15, 20, 25, 30, 35, 40 };

foreach (int element in numbers2)
{
    Console.WriteLine(element);
}

for (int i = 0; i < numbers2.Count; i++)
{
    Console.WriteLine(numbers2[i]);
}
```
- Only can store one type of data, and you need to specify it once you gonna create it

Declaring a Collection
Make sure you are using System.Collections or System.Collections.Generic, if not write it on the top of the sheet

```csharp
using System.Collections.Generic;
```
### Hashtables #hashtables (non-generic collection)

Always 1 to 1 relationship

Podríamos poner un ejemplo para tratar de entenderlo:

Digamos que tenemos un Student registration system y que cada estudiante tiene un ID y muchos otros datos como name, age, grades, a picture entre otros

Para hacer que el sistema funcione necesitamos una ID especial para cada estudiante

Si guardamos esta información usando hashtables o un dictionary, el ID del estudiante sería la key y el student data sería un object que contuviera toda la otra información del estudiante, que sería el value

Así es como podrás encontrar los datos reales por decirlo de alguna manera

Entonces: Key vendría siendo la ubicación, o la identificación, el cómo vamos a encontrarlo y Value sería lo que contiene

*Making a class called Class student and creating a constructor of it

```csharp
// Class Student
class Student
{
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
}
```
#oop #object [[OOP Core]]
```csharp
// Key - Value
// Donna key = id - Value = data
Hashtable studentsTable = new Hashtable();
Student stud1 = new Student(1, "Jordan", 90);
Student stud2 = new Student(2, "Monica", 85);
Student stud3 = new Student(3, "Carolina", 90);
Student stud4 = new Student(4, "Andres", 80);
Student stud5 = new Student(5, "Laura", 73);

studentsTable.Add(stud1.Id, stud1);
studentsTable.Add(stud2.Id, stud2);
studentsTable.Add(stud3.Id, stud3);
studentsTable.Add(stud4.Id, stud4);
studentsTable.Add(stud5.Id, stud5);
```

```csharp
// Storing data in a variable to access them
Student storeStudent1 = (Student)studentsTable[1];

// Printing onto the console only one student
Console.WriteLine($"The student: {storeStudent1.Name}, associated to the ID #{storeStudent1.Id} have an average of {storeStudent1.GPA}");
```

Hashtable is a collection of dictionary entries, so using a temporary object of dictionary entry, we can go through our hashtable using a foreach loop

```csharp
// Creating a loop to iterate in each student
foreach (DictionaryEntry entry in studentsTable)
{
    Student currentStudent = (Student)entry.Value;

    Console.WriteLine($"The student: {currentStudent.Name}, associated to the ID #{currentStudent.Id} have an average of {currentStudent.GPA} in his/her grades");
}
```

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

```csharp
// another way to do that simplifying the syntax
foreach (Student student in studentsTable.Values)
// Creating the iterator type Student, and making it iterate directly into the values you can skip create a temp value and cast then
{
    Console.WriteLine($"ID: {student.Id}");
    Console.WriteLine($"Name: {student.Name}");
    Console.WriteLine($"Grade points average: {student.GPA}");
}
```

#### Dictionaries #dictionaries - (generic collection) 

Similar to hashtables a dictionary will store its value and a key value pair like we had with

In dictionary you have to specify the type of both, Key and Value like a list, so you need to declare if it is a string, int, etc

That means that we have a lot of flexibility, but not the same flexibility that we had in a hashtable

```csharp
class Program
{
    // key - value
    // auto - car
    static void Main(string[] args)
    {
        // Example of creating a Dictionary:
        // where int = Key && string = Value - initializing it with an empty dictionary
        Dictionary<int, string> myDictionary = new Dictionary<int, string>();
```

```csharp
class Employee
{
    // few properties like Role, Name, Age and Rate
    public string Role { get; set; }
    public string Name { get; set; }
    public int Age { get; set; }
    public float Rate { get; set; }

    // Yearly Salary = rate/h * number of days * number of weeks * number of months
    public float Salary
    {
        get
        {
            return Rate * 8 * 5 * 4 * 12;
        }
    }

    // Simple constructor
    public Employee(string role, string name, int age, float rate)
    {
        Role = role;
        Name = name;
        Age = age;
        Rate = rate;
    }
}
```

```csharp
Employee[] employees =
{
    new Employee("CEO", "Jordan", 26, 180),
    new Employee("Manager", "Carolina", 18, 50),
    new Employee("RRHH", "Cristian", 27, 20),
    new Employee("Secretary", "Andrea", 29, 15),
    new Employee("Lead Developer", "Javier", 32, 22),
    new Employee("Intern", "Lucia", 17, 10)
};
```

```csharp
// Actual dictionary for the excercise:
// Where KEY = string && VALUE = whole object type Employee
Dictionary<string, Employee> employeesDirectory = new Dictionary<string, Employee>();

foreach (Employee employee in employees)
{
    // this is assuming that for every single role we have just one employee
    employeesDirectory.Add(employee.Role, employee); // Key = Role - value = whole object
}
```

```csharp
// Printing information searching by Role/Key
Employee empToget = employeesDirectory["CEO"];
Console.WriteLine($"Employee Name:{empToget.Name} Role:{empToget.Role} Annual Salary:{empToget.Salary}");

// But what happens if you put wrong information? Let's find a solution
// This is when you will receive a string
string input = "Test Me a Role";
Employee result;
if (employeesDirectory.TryGetValue(input, out result)) // it returns true if the operation was successful and false otherwise
{
    Console.WriteLine("Employee Retrieved!");
    Console.WriteLine($"Employee Name: {result.Name}");
    Console.WriteLine($"Employee Role: {result.Role}");
    Console.WriteLine($"Employee Salary: {result.Salary}");
}

Console.WriteLine("does not exist");
```

```csharp
// to see all employees data
foreach (Employee emp in employeesDirectory.Values)
{
    Console.WriteLine("##################");
    Console.WriteLine($"Name: {emp.Name}");
    Console.WriteLine($"Role: {emp.Role}");
    Console.WriteLine($"Salary: {emp.Salary}");
    Console.WriteLine("##################");
}
```

```csharp
// One way to iterate in the Directory by a for loop using linq
// This way you can iterate both, Key and Value if you define it
foreach (KeyValuePair<string, Employee> emp in employeesDirectory)
{
    // by using ElementAt() to return the key-value pair stored at index i
    KeyValuePair<string, Employee> keyValuePair = employeesDirectory.ElementAt(i);
    Employee employeeAtIndex = keyValuePair.Value;
    Console.WriteLine($"Employee Key: {keyValuePair.Key}");
    Console.WriteLine($"Employee Age: {employeeAtIndex.Age}");
    Console.WriteLine($"Employee Salary: {employeeAtIndex.Salary}");
}
```

```csharp
// Another way:
// to see all employees data
// So in this way you just can iterate in one, Key or Value and you need to define it
foreach (Employee emp in employeesDirectory.Values)
{
    Console.WriteLine("##################");
    Console.WriteLine($"Name: {emp.Name}");
    Console.WriteLine($"Role: {emp.Role}");
    Console.WriteLine($"Salary: {emp.Salary}");
    Console.WriteLine("##################");
}
```

Update information:

```csharp
// Example to update information of the dictionary
// In this case we are going to replace the person who is our HR
string KeyToUpdate = "HR";
if(employeesDirectory.ContainsKey(KeyToUpdate))
{
    // dictionary name--[key name ]-- new object type employee
    employeesDirectory[KeyToUpdate] = new Employee("HR", "Elena", 22, 18);
    Console.WriteLine("Employee with Role/Key {0} was updated!", KeyToUpdate);
}
else
{
    Console.WriteLine("Employee not found with this key");
}
```

Remove
```csharp
// *** REMOVE INFO ***
string KeyToRemove = "Intern";
if( employeesDirectory.Remove(KeyToRemove)) // Validate and remove at once
{
    Console.WriteLine("The employee with the Role/Key {0} was successfully removed!", KeyToRemove);
}
```


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
  
```csharp
static void Main(string[] args)
{
    // defining a new Stack
    // Only one type for stack
    Stack<int> stack = new Stack<int>();

    // add elements to the stack using Push()
    stack.Push(1337); // ---> The highest in this moment

    // return the element at the top of the stack without removing it
    Console.WriteLine("The value in the stack is: {stack.Peek()}"); // --> Expected: 1337

    stack.Push(1); // the newest
    stack.Push(2);
    stack.Push(3);
    Console.WriteLine("The value in the stack is: {stack.Peek()}");
    Console.WriteLine("The value in the stack is: {stack.Peek()}");
    Console.WriteLine("The value in the stack is: {stack.Peek()}");

    // Popping an item
    Console.WriteLine("Popped item! : {stack.Pop()}");
    int myTopItem = stack.Peek(); // 337, myNewTopItem
    Console.WriteLine("New top: {myTopItem}");
}
```

in console:

![[Untitled 117.png]]

```csharp
// defining a new stack
// only one type for stack
Stack<int> stack = new Stack<int>();

// be careful, an empty stack that uses Pop will cause an error
if (stack.Count > 0) {
    stack.Pop();
}
```

![[Untitled 119.png]]

![[Untitled 120.png]]

![[Untitled 121.png]]

```csharp
// How to add different kind of elements
// Defining a new stack
int[] numbers = {2,8,3,1,2,3};
Stack<int> stack = new Stack<int>();

// making add values of the array to the stack
foreach (int number in numbers)
    stack.Push(number);

// printing information to confirm the element was added correctly
Console.WriteLine("number {0} was added", numbers);
Console.WriteLine(stack.Count);

Console.WriteLine("Topped value {0} is been deleted: {1}", myStack.Peek(), myStack.Pop());
// the fastest number is the base of the stack (top appears)
```

QUEUES IN CODE

```csharp
// Defining a Queue of integers
Queue<int> queue = new Queue<int>();
// Adding items with the method Enqueue
queue.Enqueue(23);
queue.Enqueue(72);
queue.Enqueue(13);
queue.Enqueue(53);
queue.Enqueue(13);
// the item added means that whoever will be the first item in the queue w

// print the first item in the queue
Console.WriteLine("Next number in the queue: {0}", queue.Peek());

// Removing an item from the queue using Dequeue
//                 <--- queue.Dequeue(); <---

// defining off elements
if (queue.Count > 0)
{
    Console.WriteLine("Shift {0} has been attended", queue.Dequeue());
    Console.WriteLine("Current Queue count is: {0}", queue.Count);
}

if(queue.Count == 0)
{
    Console.WriteLine("No more people");
}
```
