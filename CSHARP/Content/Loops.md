#basics #loops
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

![[Untitled 41.png]]

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

![[Untitled 42.png]]
![[Untitled 43.png]]

Do While

Prints first, check then
So this prints onto the console a 15 because it first run the code and then evaluate the condition executes as long as the condition is met
`counterVariable = 0;`
`do{`
`// execute your code`
`counterVariable++;`
`} while(condition)`

![[Untitled 44.png]]
![[Untitled 76.png]]

forEach Loops

Runs through an array only as long as there is content
![[Untitled 73.png]]
ForEach loop structure
![[Untitled 74.png]]
forEach loop structure, in which the variable “k” will run through the whole array “nums”

What’s the difference?

in a for loop the data type will be always an integer, but in foreach loop the data type will be always the one of the array.
And you don’t need to specify the bounds, so you didn’t need to tell when it starts and when it ends, it just will run through the whole array
In performance for loop is faster than foreach loop

Why ForEach?

![[Untitled 75.png]]

For Loop gives us more control over the iteration process, allowing us to skip every other number
ForEach loop will iterate over each element in the array, but you can’t skip other number

