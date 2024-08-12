Microsoft SQL Server is a Microsoft software to create and manipulate data bases and other things of this topic

##### Creating a server and setting up all other things to make data bases
To create a server you must to download SQL server SetUp and make it there, follow the steps, it´s so easy, set a name, a password and little else then you need to download Microsoft SQL Server Management Studio, there you can make databases
![[Pasted image 20240518083637.png]]
You can login with the credentials that you made when creating server, select the server with its name and don´t forget clic the box `Trust server certificate`, otherwise it won´t work

HOW TO CREATE A DATABASE 
You have two ways (or more) to create one, you can make it by Visual Studio ![[Pasted image 20240518093100.png]]
as well you can make one from Sql server management
![[Pasted image 20240518093144.png]]
Need to write the server name, you can find it in on server properties, or write directly from somewhere place you see it
![[Pasted image 20240518093352.png]]

After this you can create your first table and add some information, so
![[Pasted image 20240515163716.png]]
This Key icon means that this is going to be the key column and 
![[Pasted image 20240515163732.png]]

Relationship table
In order to do a relationship between two tables we need to create an additional table in which you are going to put information about the tables you want to relate
And what information? well, it can be de Id´s of each one, so we are going to create a new table with 2 additional columns where we are going to put the Zoo's Id and Animal's Id
![[Pasted image 20240516154952.png]]
Set (As always) Identity Specifications > Is Identity = True
And then you need to bind the columns that you want to associate at this table, so
![[Pasted image 20240516155506.png]]
Create a new Foreing Keys to bind with those columns, set names and then in code you need to specify the nex info
![[Pasted image 20240516155652.png]]
first as i said Set a name, then the column in where that info will be stored and last, the table in which information will be subtracted, and the column of that table

Create a Query
![[Pasted image 20240516191155.png]]
![[Pasted image 20240516191233.png]]![[Pasted image 20240516212412.png]]

#### HOW TO CONNECT WITH THE APPLICATION
First of all you need to open the window Data Sources
![[Pasted image 20240518093738.png]]

Show information in User Controls

![[Pasted image 20240516233723.png]]
![[Pasted image 20240516233804.png]]
![[Pasted image 20240516233849.png]]

##### How to use SQL parameters

Why do you should to use Sql Parameteres?
When you need to put a variable in a Query, you think maybe is enough just put it onto the query like this:

	string query = "select a.Name from Animal a inner join ZooAnimal za on a.Id = za.AnimalId where za.ZooId = " + listZoos.SelectedValue;
where `lsitZoos.SelectedValue = the variable number that would be za.ZooId`

but what is the problem? This way you wuold be vulnerable to a Sql Injection, this is a method what hackers uses to exploit a vulnerability and inject scripts in the Query, how we can prevent this? through SqlCommand

##### Reset tables sheet
drop table dbo.ZooAnimal
drop table dbo.Zoo
drop table dbo.Animal
 
CREATE TABLE [dbo].[Zoo] (
    [Id]       INT           IDENTITY (1, 1) NOT NULL,
    [Location] NVARCHAR (50) NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);
 
CREATE TABLE [dbo].[Animal] (
    [Id]   INT           IDENTITY (1, 1) NOT NULL,
    [Name] NVARCHAR (50) NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);
 
CREATE TABLE [dbo].[ZooAnimal] (
    [Id]       INT IDENTITY (1, 1) NOT NULL,
    [ZooID]    INT NOT NULL,
    [AnimalId] INT NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [AnimalFK] FOREIGN KEY ([AnimalId]) REFERENCES [dbo].[Animal] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [ZooFK] FOREIGN KEY ([ZooID]) REFERENCES [dbo].[Zoo] ([Id]) ON DELETE CASCADE
);
 
insert into dbo.Zoo values ('New York')
insert into dbo.Zoo values ('Tokyo')
insert into dbo.Zoo values ('Berlin')
insert into dbo.Zoo values ('Kairo')
insert into dbo.Zoo values ('Milan')
 
insert into dbo.Animal values ('Shark')
insert into dbo.Animal values ('Clownfish')
insert into dbo.Animal values ('Monkey')
insert into dbo.Animal values ('Wolf')
insert into dbo.Animal values ('Gecko')
insert into dbo.Animal values ('Crocodile')
insert into dbo.Animal values ('Owl')
insert into dbo.Animal values ('Parrot')
 
insert into dbo.ZooAnimal values (1,1)
insert into dbo.ZooAnimal values (1,2)
insert into dbo.ZooAnimal values (2,3)
insert into dbo.ZooAnimal values (2,4)
insert into dbo.ZooAnimal values (3,5)
insert into dbo.ZooAnimal values (3,6)
insert into dbo.ZooAnimal values (4,7)
insert into dbo.ZooAnimal values (4,8)
insert into dbo.ZooAnimal values (5, 1)
insert into dbo.ZooAnimal values (5, 2)
insert into dbo.ZooAnimal values (5, 3)
insert into dbo.ZooAnimal values (5, 4)
insert into dbo.ZooAnimal values (5, 5)
insert into dbo.ZooAnimal values (5, 6)
insert into dbo.ZooAnimal values (5, 7)
insert into dbo.ZooAnimal values (5, 8)


#### Para que usar SqlAdapter y DataTable?
Un SqlAdapter se usa en conjunto con un DataTable para obtener datos de una consulta y llenar la tabla con esos datos, para poder trabajar cómodamente con ellos, verlos en pantalla, seleccionarlos y manipularlos como podría hacerse desde un ListBox, la finalidad es poder obtener los datos para poder trabajar con ellos en memoria sin necesidad de estar constantemente en conexión con la base de datos
Útil para llenar listas de datos

#### Para qué usar SqlCommand?
SqlCommand en principio es usado para pedir consultas a través de querys con parámetros, los cuales se los pasaremos a través de SqlCommand.Parameters, de este modo pasaremos un dato que puede variar según la solicitud del usuario actuando como una variable en la query, hacerlo a través de Parameters y no directamente como una variable en la petición hace que la consulta sea segura y evita una posible inyección query malintencionada

![[Pasted image 20240619192833.png]]
Es importante que, si necesitas seleccionar todos los datos de una tabla, ya sea para mostrar uno y tener seleccionado otro, usar el asterisco, ya que si por ejemplo, únicamente pedimos en la query a.Name, por más de que tengamos el Path en Id, ÚNICAMENTE tomará el dato que le pedimos, omitiendo todos los demás
![[Pasted image 20240521172917.png]]
![[Pasted image 20240518193100.png]]
Different ways to bind ConnectionString

![[Pasted image 20240619195405.png]]

![[Pasted image 20240619195638.png]]
In order to be able to use this way, you just need first to set in App.Config the Source path for the db connection

This in App.config

	<connectionStrings>
		<add name="ConnectionString" connectionString="Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\Jorda\source\repos\CurrencyConverterWithDB\CurrencyConverterWithDB\DB\CurrencyConverterDB.mdf;Integrated Security=True" providerName="sqlserver"/>
	</connectionStrings>

Explicando un poco cada parte del App.config
#### Desglose ConnectionString

- **name="ConnectionString"**: Este es el nombre que usarás para referenciar esta cadena de conexión en tu código. Es un identificador único dentro de tu configuración.
    
- **connectionString**: Esta es la cadena real de conexión que le dice a tu aplicación cómo conectarse a la base de datos.
    
    - `Data Source=(LocalDB)\MSSQLLocalDB`: Especifica el servidor de la base de datos. `(LocalDB)\MSSQLLocalDB` se refiere a una instancia local de SQL Server.
    - `AttachDbFilename=C:\Users\Jorda\source\repos\CurrencyConverterWithDB\CurrencyConverterWithDB\DB\CurrencyConverterDB.mdf`: Especifica la ubicación del archivo de la base de datos (.mdf).
    - `Integrated Security=True`: Indica que se usará la autenticación integrada de Windows para conectarse a la base de datos.
- **providerName="sqlserver"**: Especifica el proveedor que se usará para conectarse a la base de datos. En este caso, es `sqlserver`.

###### Binding Path

![[Pasted image 20240627194232.png]]