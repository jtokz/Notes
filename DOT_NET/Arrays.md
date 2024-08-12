#basics #csharp #oop

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



![[Untitled 71.png]]
De esta manera se puede implementar un tryparse, para que se ejecute si cumple los requisitos sin necesidad de un if else

![[Untitled 72.png]]
### Multidimentional Array #multidimentionalarrays
How to declare
![[Untitled 77.png]]

#### Making a matrix #matrix 
![[Untitled 78.png]]
To print a number of the matrix, you have to select the coordinates, first in Y and then X  

Another ways
![[Untitled 79.png]]![[Untitled 80.png]]
Changing one of values of the array
![[Untitled 81.png]]

##### 3D Arrays #3darrays
![[Untitled 82.png]]    ![[Untitled 83.png]]
##### Nested for loops #nestedforloop 
![[Pasted image 20240219165419.png]]
![[Untitled 84.png]]
primero se ejecutará i=0, luego dará paso a int j.
int i recorrerá las filas o rows mientras que j correrá sobre las column
int j se ejecutará sobre las column hasta que se termine el recorrido de su fila o row, luego, cuando llegue al final validará si el número de columna es menor al máximo y como no lo será, terminará su ciclo y dará paso a que se vuelva a ejecutar i, que en este punto ya será i = 1, luego se repite, como ya se ejecutó, i dará lugar a que se ejecute lo de adentro y repetirá pero esta vez en la posición i=1 y no i=0, o sea en la siguiente fila, j de nuevo iterará sobre las columnas hasta que el valor sea menor al número máximo de columnas y así sucesivamente

How to print Odd or even numbers
![[Untitled 85.png]]

### Jagged Array #jaggedarray

Jagged array is an Array within an Array
![[Untitled 86.png]]    ![[Untitled 87.png]]
##### Array as parameter
![[Untitled 88.png]]

In this case, we put the size of the array in a variable because later we are going to need it to calculate the average, so size, in this case, is de amount of variables that we are going to put into our array

##### Params keyword #params #methods  [[Methods and control structures]]
 ![[Untitled 89.png]]    ![[Untitled 90.png]]![[Untitled 91.png]]    ![[Untitled 92.png]]
 
 A real use of params in a practice example:
 ![[Untitled 93.png]]
 ![[Untitled 94.png]] 
 ![[Untitled 95.png]]