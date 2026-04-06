---
tags: [lang/csharp, area/basics, area/oop, type/concept]
---

- Stores a fixed size sequential collection of elements
- ONLY of the same type, so you can store multiple information within one variable, but it has to be the same type
- Can create all kinds of types: int, string, object, etc.
- Great to store a collection of data - easier to think of a collection of variables of the same type stored at contiguous memory locations

![[Untitled 70.png]]

- Declaring an array:
    
    `dataType[] arrayName;`
    
    Example
    `int[] grades;`
    
- Initializing an array:
    
    `dataType[] arrayName = new dataType[amountOfEntries];`
    
    Example
    `int[] grades = new int[5];`
    
- Assigning values to an array:
    
    `arrayName[index] = value;`
    Example 
    `grades[0] = 15;`
    `grades[1] = 12;`



```csharp
Console.WriteLine($"Grades at index 1 is {grades[1]}");
string input = Console.ReadLine();
int.TryParse(input, out grades[1]);
Console.WriteLine($"Grades at index 1 is {grades[1]}");
```
De esta manera se puede implementar un tryparse, para que se ejecute si cumple los requisitos sin necesidad de un if else

```csharp
// another ways to initialize arrays

int[] gradesOfMathStudentsA = { 20, 13, 12, 8, 8 };

int[] gradesOfMathStudentsB = new int[] { 15, 20, 3, 17, 18, 15 };

// view the lenght of an array

Console.WriteLine("current student's grade are: {0}",gradesOfMathStudentsB.Length);
```
### Multidimentional Array #multidimentionalarrays
How to declare
```csharp
static void Main(string[] args)
{
    // declare 2D Array
    string[,] matrix;

    // declare 3D Array
    int[,,] threeD;

    // 4D
    int[,,,] fourD;
}
```

#### Making a matrix #matrix 
```csharp
// two dimensional array
int[,] array2D = new int[,]
{
    {1,2,3},
    {4,5,6},
    {7,8,9}
};

Console.WriteLine("you think the value {0}", array2D[2,0]); // Y,X
Console.ReadKey();
```
To print a number of the matrix, you have to select the coordinates, first in Y and then X  

Another ways
```csharp
int[,] array2D2 = { {1,2}, {3,4} };
```

```csharp
// another way to create arrays
string[,] array2DString = new string[3, 2] { { "1", "2" }, { "3", "4" }, { "5", "6" } };
```
Changing one of values of the array
```csharp
array2DString[1, 1] = "chicken";
Console.WriteLine(array2DString[1,1]);
```

##### 3D Arrays #3darrays
```csharp
string[,,] array3D = new string[,,]
{
    {
        /* punto 0,0,0*/{"000", "001"}, // Array 1
                        {"010", "011"}
    },
    {
        /* punto 1,0,0*/{"100", "101"}, // Array 2
                        {"110", "111"}
    }
};

Console.WriteLine("select 110 value: {0}", array3D[1,1,0]); // Z,Y,X
// De manera en que Array1 está detrás de array 2, y cuando se selecciona
// El array 2 se añade una unidad al eje Z,
Console.ReadKey();
```

![[Untitled 83.png]]
##### Nested for loops #nestedforloop 
```csharp
static int[,] matrix = // static to can use it in the main method
{
    {1,2,3},
    {4,5,6},
    {7,8,9}
};
```
```csharp
// GetLength(0) for first dimension -rows-
for (int i = 0; i < matrix.GetLength(0); i++)
{
    // GetLength(1) for second dimension iterance -columns-
    for (int j = 0; j < matrix.GetLength(1); j++)
    {
        Console.WriteLine(matrix[i,j] + " ");
    }
}
```
primero se ejecutará i=0, luego dará paso a int j.
int i recorrerá las filas o rows mientras que j correrá sobre las column
int j se ejecutará sobre las column hasta que se termine el recorrido de su fila o row, luego, cuando llegue al final validará si el número de columna es menor al máximo y como no lo será, terminará su ciclo y dará paso a que se vuelva a ejecutar i, que en este punto ya será i = 1, luego se repite, como ya se ejecutó, i dará lugar a que se ejecute lo de adentro y repetirá pero esta vez en la posición i=1 y no i=0, o sea en la siguiente fila, j de nuevo iterará sobre las columnas hasta que el valor sea menor al número máximo de columnas y así sucesivamente

How to print Odd or even numbers
```csharp
for (int i = 0; i < matrix.GetLength(0); i++)
{
    for(int j = 0; j < matrix.GetLength(1); j++)
    {
        int number = matrix[i,j];
        if (number % 2 == 1)
        {
            Console.WriteLine(number);
        }
    }
}
```

### Jagged Array #jaggedarray

Jagged array is an Array within an Array
```csharp
// declare jaggedArray
int[] jaggedArray = new int[3];
jaggedArray[0] = new int[];
jaggedArray[1] = new int[];
jaggedArray[2] = new int[];

jaggedArray[0] = new int[] { 1, 2, 3, 7, 11 };
jaggedArray[1] = new int[] { 1, 2, 3 };
jaggedArray[2] = new int[] { 1, 2, 3, 4 };

// alternative way
new int[] { 1, 2, 3, 7, 11 };
new int[] { 1, 2, 3 };
new int[] { 1 };

Console.WriteLine(jaggedArray[0][3]);
```

```csharp
for (int i = 0; i < jaggedArray.Length; i++)
{
    for (int j = 0; j < jaggedArray[i].Length; j++)
    {
        // este valor sería el valor del elemento en la posición 0
        // para i=0 y j=0 lo que mostraría en la consola el valor del elemento del array 0 en la posición 0
        // siendo el primer elemento del primer array 1, y asi sucesivamente
        Console.Write(jaggedArray[i][j]);
    }
}
```
##### Array as parameter
```csharp
static void Main(string[] args)
{
    int[] studentGrades = new int[] { 15, 12, 8, 32, 6, 22 };
    double averageResult = GetAverage(studentGrades);
    Console.WriteLine(averageResult);
}

static double GetAverage(int[] gradesArray)
{
    int size = gradesArray.Length;
    double average;
    int sum = 0;

    for(int i = 0; i < size; i++)
    {
        sum += gradesArray[i];
    }
    average = (double)sum / size;
    return average;
}
```

In this case, we put the size of the array in a variable because later we are going to need it to calculate the average, so size, in this case, is de amount of variables that we are going to put into our array

##### Params keyword #params #methods  [[Methods and control structures]]
```csharp
internal class Program
{
    static void Main(string[] args)
    {
        ParamsMethod("bread","milk","fish","rice","eggs");
    }

    public static void ParamsMethod(params string[] sentence) // sentence = array of type string
    {
        for(int i = 0; i < sentence.Length; i++)
        {
            Console.Write(sentence[i]+" ");
        }
    }
}
```

![[Untitled 90.png]]![[Untitled 91.png]]

```csharp
static void ParamsMethod(params object[] stuff)
{
    foreach (object obj in stuff)
    {
        Console.Write(obj + ' ');
    }
    Console.ReadKey();
}

static void Main(string[] args)
{
    int price = 50;
    float pi = 3.1415f;
    char at = '@';
    string name = "100 años de soledad";
    ParamsMethod(price, pi, at, book);
}
```
 
 A real use of params in a practice example:
```csharp
public static int Sum(params int[] numbers)
{
    int total = 0;

    foreach (int number in numbers)
    {
        total += number;
    }

    return total;
}

static void Main(string[] args)
{
    int sum1 = Sum(1, 2, 3, 5);
    int sum2 = Sum(Sum(4, 0)));
    int sum3 = Sum(20, 40, 60, 80, 90);
    Console.WriteLine(sum1);
    Console.WriteLine(sum2);
    Console.WriteLine(sum3);
}
```

```csharp
public static int MinV2(params int[] numbers)
{
    int min = int.MaxValue;

    foreach (int number in numbers)
    {
        if(number < min)
        {
            min = number;
        }
    }

    return min;
}

public static int MaxV2(params int[] numbers)
{
    int max = int.MinValue;

    foreach (int number in numbers)
    {
        if (number > max)
        {
            max = number;
        }
    }

    return max;
}
```

```csharp
class Program
{
    static void Main(string[] args)
    {
        int min = MinV2(5000, 12, 15, 45, 23463, 412, 36, 3, 634, 234, 6, 2, 243, 234, 5, 3, 14, 5, 6, 7, 9, 2, 1, 9);
        int max = MaxV2(5000, 12, 15, 45, 23463, 412, 36, 3, 634, 234, 6, 2, 243, 234, 5, 3, 14, 5, 6, 7, 9, 2, 1, 9);

        Console.WriteLine($"The min value is: {min} & the max value is: {max}");
        Console.ReadKey();
    }
}
```