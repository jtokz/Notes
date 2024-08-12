#Lambda 

![[Pasted image 20240416133034.png]]

Lambda expressions can have one of the following two forms:

- Expression Lambda
	(input-parameters) => expression

- Statement Lambda
	(input-parameters) => {
		``<sequence-of-statements>
	}

When can i use Lambda Expressions?
1. **Funciones de orden superior**: Las expresiones lambda pueden usarse en métodos que toman funciones como argumentos, como en tu ejemplo con el método `DisplayPeople`. Esto permite pasar la lógica como un argumento al método, lo que hace que el código sea más flexible y dinámico.
    
2. **LINQ (Language Integrated Query)**: Las expresiones lambda son ampliamente utilizadas en consultas LINQ para filtrar, ordenar, agrupar y proyectar datos en colecciones de objetos. Por ejemplo, puedes usar expresiones lambda en métodos como `Where`, `OrderBy`, `Select`, etc.
    
3. **Manejo de eventos**: Puedes usar expresiones lambda para manejar eventos en lugar de definir métodos separados. Esto puede hacer que el código sea más conciso y legible al definir el manejador de eventos directamente donde se asigna el evento.
    
4. **Tareas asincrónicas (async/await)**: Las expresiones lambda pueden ser útiles al trabajar con métodos asincrónicos (`async`) y esperar (`await`), donde puedes definir la lógica del método de forma concisa en línea.
    
5. **Inyección de dependencias**: En ciertos marcos y patrones de diseño, como en ASP.NET Core, puedes usar expresiones lambda para registrar servicios en contenedores de inyección de dependencias.
    
6. **Configuración de acciones diferidas**: Las expresiones lambda pueden usarse para configurar acciones que se ejecuten más tarde, por ejemplo, en respuesta a algún evento específico o después de un período de tiempo.
    
7. **Implementación de comparadores personalizados**: Puedes usar expresiones lambda para definir comparadores personalizados para tipos complejos que no tienen un orden natural, como ordenar una lista de objetos por una propiedad específica.

##### Lambda Expressions as delegate parameter

Let's see in code inside of our previous example
// Make a new Display people example which filter if people's age is > 20 & contains in his name a keyword, in this case `A` 

![[Pasted image 20240416135046.png]]
With this you can use a Lambda expression as parameter making the role of a delegate method, like an anonymous method

Let's see how a normal filter method is look like, in order to not get confused
![[Pasted image 20240416141600.png]]
Our Lambda Expression makes this same role, so the `p` in our Lambda expression is the parameter of the filter method of 
Type Person (p) <-- being `p` a Person type variable which get access to the properties of Person class, so, as you can see it don't have a name just put it followed by => lambda expression sign

You can use the properties like 


La estructura básica de una expresión lambda en C# es la siguiente:

`(parameters) => expression_or_statement_block`

Donde:

- `parameters`: Representa los parámetros de entrada de la lambda, si no tiene parámetros, se indicaría con paréntesis vacíos `()`. Si tiene un solo parámetro, no es necesario usar paréntesis alrededor del parámetro. Para múltiples parámetros, se separan por comas y se pueden envolver en paréntesis.
- `=>`: La flecha lambda, que separa los parámetros de la expresión o bloque de instrucciones.
- `expression_or_statement_block`: Puede ser una única expresión o un bloque de instrucciones que representa la lógica de la lambda. Si es una única expresión, el valor de retorno se determina automáticamente. Si es un bloque de instrucciones, debe usar llaves `{}` y, si es necesario, la palabra clave `return` para devolver un valor.

Ejemplos:

- Lambda sin parámetros y una única expresión:
    
    `() => Console.WriteLine("Hello, world!");`
    
- Lambda con un parámetro y una única expresión:
    
    `x => x * x;`
    
- Lambda con múltiples parámetros y un bloque de instrucciones:
    
    csharpCopy code
    
    `(x, y) => {     int sum = x + y;     return sum; };`
    

Es importante tener en cuenta que las expresiones lambda en C# son funciones anónimas y pueden ser asignadas a variables, pasadas como argumentos de métodos o usadas en cualquier lugar donde se espera una referencia a una función.

![[Pasted image 20240416195432.png]]
![[Pasted image 20240416195335.png]]


Code exercise
1. Create and store using static keyword Lambda expressions with names Plus, Minus, Divide and Multiply.
    
    You can store function as follow:
    
    static Func<int, int> Name = (a) => a;
    
2. Create a static dictionary called Operators that uses a string as a Key and lambda function as a value.
    
    Example: {"sign", Function}
    
3. Create a static method OperationGet that will get as input a string, test if this string is a Key in the dictionary and if positive return function otherwise returns null.

![[Pasted image 20240416210542.png]]