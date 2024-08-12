What is linq? Linq is a powerful library used to manipulate data from various sources as could be Arrays, Lists, databases, etc. Inside the C# code

##### Simple query operations
This is an example of array numbers, so we want to obtain only odd numbers, we can create a method that pass an array and manipulate it with key words like from, in, where, select, all of those are keywords of link to manipulate
![[Pasted image 20240709111014.png]]

Another example
You can order an array of names by order ascending, descending, etc
![[Pasted image 20240709111535.png]]

Exercise with Universities and Students

Declare and initialize UniversityManager Class object with two list, University and Student with some information
![[Pasted image 20240717103523.png]]
Add some methods in order to filtering people or universities
![[Pasted image 20240717103652.png]]
Method to filter students of an specific university
![[Pasted image 20240717103759.png]]
Method to sorting by age, of course we can create some other methods for sorting
![[Pasted image 20240717103909.png]]
###### Create a collection from other collection join keyword
In this method we are going to create a new Collection only with Student name and University name, for this we need to use the join keyword and is necessary to connect two tables, for example in this case we are going to connect Student and University tables, and finally we need a key that both tables have, in this case, UniversityId on student list and Id in university list
![[Pasted image 20240717103944.png]]

Call the methods
![[Pasted image 20240717104556.png]]
Output
![[Pasted image 20240717104620.png]]

Linq with XML
We can use linq not only with list and arrays, you can use linq in a bunch of tools, like XML, SQL servers, LocalDBases
In this case we copy a xml file and store it in a string, then we need to use the library System.Xml.Linq
![[Pasted image 20240718094813.png]]
Then you need to parse this information from string to xml file in order that linq can read this information
![[Pasted image 20240718094920.png]]
And finally you can create different methods to manipulate this information

LinqToSql
In order to connect Linq with a DB you can use in c# LinqToSQLDataClassesDataContext Class, to create a DataContext, where our tables will be stored and talk always in the same context
![[Pasted image 20240731120043.png]]
So you need to create an object of this and connect it with the data base through its ConnectionString

Then, you need to create a new class LINQ to SQL Classes and put in it your tables, What this will do is transform your tables into classes so that you can create objects with their columns as properties
![[Pasted image 20240802121003.png]]

![[Pasted image 20240802120837.png]]
For example, if you have a table called University, with columns Id and Name, and then you drag it to LinqToSqlClasses.dbml archive, you now can create objects type University and set its properties
![[Pasted image 20240802121608.png]]
It's important to highlight that if your table has foreign keys and you drag the table that this foreign key belongs, LinqToSqlClasses will make a connection between this classes through the arrows that u can see above
This connections allows bring the other table here with it, for example if you have a foreign key UniversityId connected with University.Id, this will connect both tables
![[Pasted image 20240802131436.png]]
In this example we create a List of type Student that contains some new students with its properties, and as you can appreciate the foreign key UniversityId is linked with two entries that we made before in University table, Michigan and Harvard Universities, so by filtering and storing in a new variable you can bind this two universities with they respective students
Adding some information to other tables
This case, StudentLectures table
![[Pasted image 20240802133600.png]]
Some sorting and filtering methods
![[Pasted image 20240802133654.png]]
![[Pasted image 20240802133729.png]]
And a method to show ordered and clear info about the students
![[Pasted image 20240802133823.png]]
Actual app view:
