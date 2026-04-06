---
tags: [lang/csharp, area/basics, type/concept]
---

With loops you can:
- Save time
- Quick and easy repetition of code, they allow to repeat your code easy multiple times based on conditions that you set up
- Allows you to work with huge amounts of data

Loop Types
- for loop
- while loop (check then go)
- do while loop (do first then check)
- forEach loop (run through array or list)


For Loop
`// syntaxis`
`for (start value; condition; increment)` 
`{`
`// code body`
`}`

```csharp
static void Main(string[] args)
{
    // for loop desde donde empieza y hasta donde va
    // counter es cuanto le suma en cada vuelta
    for(int counter = 5; counter <= 50; counter+=5) // == n | i = 0
    {
        // the conditionally variable will change with every iteration
        // as long as the condition is met the loop will continue to run
        // inside the code, you put the increment
        // in every single time the for loop is run, it will increase by one
    }

    for (int i = 0; i < 92; i++)
    {
        Console.WriteLine(i);
    }

    Console.Read();
}
```

###### Nested for loops here: #nestedforloop [[Arrays]]

While Loop

Here it checks first and then run the code
executes as long as the condition is met

`// syntaxis`
`counterVariable = 0;`
`while(condition)
`{`
`// execute your code`
`counterVariable++;`
`}`

```csharp
static void Main(string[] args)
{
    int i = 0;
    while(i<10)
    {
        Console.WriteLine(i);
        i++;
    }
    Console.ReadLine();
}
```
```csharp
string checker;
i = 0;
Console.WriteLine("Welcome to the ++School Student Supreme Counter++ (or SSSC) please, press Enter key to add one. :)");
i++;

{
    checker = Console.ReadLine();
    if (checker == "")
    {
        i++;
    }
    i = checker == "" ? i++ : i;
}

int i = 0;
string enteredText = "";
while (enteredText == "")
{
    Console.WriteLine("Please press enter to increase amount by one, type something else if you wanna finish counting. :)");
    enteredText = Console.ReadLine();
    i++;
    Console.WriteLine($"Current people count is {i}");
}
Console.WriteLine($"{i} people are inside the bus, press enter to close the program. :)");
```

Do While

Prints first, check then
So this prints onto the console a 15 because it first run the code and then evaluate the condition executes as long as the condition is met
`counterVariable = 0;`
`do{`
`// execute your code`
`counterVariable++;`
`} while(condition)`

```csharp
static void Main(string[] args)
{
    // Do while loop
    int i = 15;
    do
    {
        Console.WriteLine(i);
        i++;
    } while (i <= 5);

    Console.Read();
}
```
```csharp
string input;
do
{
    Console.WriteLine("Please enter a valid number");
    input = Console.ReadLine();
} while (!int.TryParse(input, out _));
// Aquí hace un loop mientras no se pueda convertir a un número, cuando se pueda para
```

forEach Loops

Runs through an array only as long as there is content
```csharp
static void Main(string[] args)
{
    int[] nums = new int[10];

    for (int i = 0; i < 10; i++)
    {
        nums[i] = i;
        Console.WriteLine($"Element {i} = {nums[i]}");
    }
}
```
ForEach loop structure
```csharp
int counter = 0;
foreach (int k in nums)
{
    Console.WriteLine($"Element {counter} = {k}");
    counter++;
}
```
forEach loop structure, in which the variable “k” will run through the whole array “nums”

What’s the difference?

in a for loop the data type will be always an integer, but in foreach loop the data type will be always the one of the array.
And you don’t need to specify the bounds, so you didn’t need to tell when it starts and when it ends, it just will run through the whole array
In performance for loop is faster than foreach loop

Why ForEach?

```csharp
int[] numbers = { 1, 2, 3, 4, 5 };
for (int i = 0; i < numbers.Length; i+= 2)
{
    Console.WriteLine(numbers[i]);
}
```

For Loop gives us more control over the iteration process, allowing us to skip every other number
ForEach loop will iterate over each element in the array, but you can’t skip other number

