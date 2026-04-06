---
tags: [lang/csharp, area/data, type/concept]
---

What is linq? Linq is a powerful library used to manipulate data from various sources as could be Arrays, Lists, databases, etc. Inside the C# code

##### Simple query operations
This is an example of array numbers, so we want to obtain only odd numbers, we can create a method that pass an array and manipulate it with key words like from, in, where, select, all of those are keywords of link to manipulate
```csharp
internal class Program
{
    static void Main(string[] args)
    {
        int[] numbers = new int[] {1,2,3,4,5,6,7,8,9};

        OddNumbers(numbers);
    }

    static void OddNumbers(int[] numbers)
    {
        Console.WriteLine("Odd Numbers: ");

        IEnumerable<int> oddNumbers = from number in numbers
                                      where number % 2 == 0
                                      select number;

        foreach (int i in oddNumbers)
        {
            Console.WriteLine(i);
        }
    }
}
```

Another example
You can order an array of names by order ascending, descending, etc
```csharp
string[] names = new string[] { "Jordan", "Carolina", "Laura", "Edgar", "Annie" };
var ordered = from name in names
              orderby name
              select name;

foreach (var i in ordered)
{
    Console.WriteLine(i);
}
```

Exercise with Universities and Students

Declare and initialize UniversityManager Class object with two list, University and Student with some information
```csharp
internal class UniversityManager
{
    public List<University> universities;
    public List<Student> students;

    // constructor
    public UniversityManager()
    {
        universities = new List<University>();
        students = new List<Student>();

        universities.Add(new University { Id = 1, Name = "Michigan" });
        universities.Add(new University { Id = 2, Name = "Harvard" });

        // Add some students
        students.Add(new Student { Id = 1, Name = "Jordan", Age = 26, Gender = "Male", UniversityId = 1 });
        students.Add(new Student { Id = 2, Name = "Carolina", Age = 16, Gender = "Female", UniversityId = 1 });
        students.Add(new Student { Id = 3, Name = "Edgar", Age = 48, Gender = "Male", UniversityId = 2 });
        students.Add(new Student { Id = 4, Name = "Laura", Age = 41, Gender = "Female", UniversityId = 2 });
        students.Add(new Student { Id = 5, Name = "Annie", Age = 9, Gender = "Female", UniversityId = 1 });
    }
}
```
Add some methods in order to filtering people or universities
```csharp
public void MaleStudents()
{
    IEnumerable<Student> maleStudents = from student in students
                                        where student.Gender == "Male"
                                        select student;

    Console.WriteLine("Male Students: ");
    foreach (Student student in maleStudents)
    {
        student.Info();
    }
}

public void FemaleStudents()
{
    IEnumerable<Student> femaleStudents = from student in students
                                          where student.Gender == "Female"
                                          select student;

    Console.WriteLine("Female Students: ");
    foreach (Student student in femaleStudents)
    {
        student.Info();
    }
}
```
Method to filter students of an specific university
```csharp
public void UniversityStudents(int universityStudentId)
{
    IEnumerable<Student> studentsInUniversity = from student in students
                                                where student.UniversityId == universityStudentId
                                                select student;

    string Name = "";
    switch (universityStudentId)
    {
        case 1:
            Name = "Michigan";
            break;
        case 2:
            Name = "Harvard";
            break;
    }

    Console.WriteLine($"Students of {Name} are:");
    foreach (Student student in studentsInUniversity)
    {
        student.Info();
    }
}
```
Method to sorting by age, of course we can create some other methods for sorting
```csharp
public void SortStudentsByAge()
{
    var sortedStudents = from student in students orderby student.Age ascending select student;

    Console.WriteLine("Students sorted by Age: ");

    foreach (Student student in sortedStudents)
    {
        student.Info();
    }
}
```
###### Create a collection from other collection join keyword
In this method we are going to create a new Collection only with Student name and University name, for this we need to use the join keyword and is necessary to connect two tables, for example in this case we are going to connect Student and University tables, and finally we need a key that both tables have, in this case, UniversityId on student list and Id in university list
```csharp
public void StudentAndUniversityNameCollection()
{
    var studentUniversityCollection = from student in students
                                      join university in universities on student.UniversityId equals university.Id
                                      orderby student.Name
                                      select new { StudentName = student.Name, UniversityName = university.Name };

    foreach (var i in studentUniversityCollection)
    {
        Console.WriteLine(i);
    }
}
```

Call the methods
```csharp
UniversityManager universities = new UniversityManager();
universities.MaleStudents();
universities.FemaleStudents();
PrintAction();
universities.UniversityStudents(1);
universities.UniversityStudents(2);
universities.SortStudentsByAge();
universities.StudentAndUniversityNameCollection();
```
Output
![[Pasted image 20240717104620.png]]

Linq with XML
We can use linq not only with list and arrays, you can use linq in a bunch of tools, like XML, SQL servers, LocalDBases
In this case we copy a xml file and store it in a string, then we need to use the library System.Xml.Linq
```csharp
using System.Xml.Linq;

internal class Program
{
    static string studentsXML =
        @"<Students>
            <Student>
                <Name>Jordan</Name>
                <Age>22</Age>
                <UniversityMichigan/>
            </Student>
            <Student>
                <Name>Carolina</Name>
                <Age>7</Age>
                <UniversityMichigan/>
            </Student>
            <Student>
                <Name>Edgar</Name>
                <Age>Edgar</Age>
                <UniversityHarvard/>
            </Student>
            <Student>
                <Name>Laura</Name>
                <UniversityHarvard/>
            </Student>
        </Students>";
}
```
Then you need to parse this information from string to xml file in order that linq can read this information
```csharp
static void OrderedBy(string order)
{
    XDocument studentXml = XDocument.Parse(studentsXML);
    var studentsByDescendants = studentXml.Descendants("Student")
        .Select(s => new
        {
            Name = s.Element("Name").Value,
            Age = s.Element("Age").Value,
            University = s.Element("University").Value
        });

    Console.WriteLine($"Sorted by {order}: ");
    foreach (var student in studentsByDescendants)
    {
        Console.WriteLine($"Student {0} with age {1} is from {2} university", student.Name, student.Age, student.University);
    }
}
```
And finally you can create different methods to manipulate this information

LinqToSql
In order to connect Linq with a DB you can use in c# LinqToSQLDataClassesDataContext Class, to create a DataContext, where our tables will be stored and talk always in the same context
```csharp
namespace LinqToSQL
{
    // summary: logic for MainWindow.xaml

    public partial class MainWindow : Window
    {
        LinqToSQLDataClassesDataContext dataContext;

        public MainWindow()
        {
            InitializeComponent();

            string connectionString = ConfigurationManager.ConnectionStrings["LinqToSQL.Properties.Settings.JtokzDBConnectionString"].ConnectionString;
        }
    }
}
```
So you need to create an object of this and connect it with the data base through its ConnectionString

Then, you need to create a new class LINQ to SQL Classes and put in it your tables, What this will do is transform your tables into classes so that you can create objects with their columns as properties
![[Pasted image 20240802121003.png]]

![[Pasted image 20240802120837.png]]
For example, if you have a table called University, with columns Id and Name, and then you drag it to LinqToSqlClasses.dbml archive, you now can create objects type University and set its properties
```csharp
University michigan = new University();
michigan.Name = "Michigan";
dataContext.Universities.InsertOnSubmit(michigan);
University harvard = new University();
harvard.Name = "Harvard";
dataContext.Universities.InsertOnSubmit(harvard);
dataContext.SubmitChanges();

MainDataGrid.ItemsSource = dataContext.Universities;
```
It's important to highlight that if your table has foreign keys and you drag the table that this foreign key belongs, LinqToSqlClasses will make a connection between this classes through the arrows that u can see above
This connections allows bring the other table here with it, for example if you have a foreign key UniversityId connected with University.Id, this will connect both tables
```csharp
University michigan = dataContext.Universities.First(u => u.Name.Equals("Michigan"));
// it's like that

List<Student> students = new List<Student>()
{
    new Student { Name = "Jordan", Gender = "Male", UniversityId = michigan.Id },
    new Student { Name = "Carolina", Gender = "Female", UniversityId = michigan.Id },
    new Student { Name = "Edgar", Gender = "Male", UniversityId = 2 },
    new Student { Name = "Laura", Gender = "Female", UniversityId = 2 },
    new Student { Name = "Annie", Gender = "Female", UniversityId = michigan.Id },
    new Student { Name = "Adriana", Gender = "Female", UniversityId = 2 },
    new Student { Name = "Jazmin", Gender = "Female", UniversityId = michigan.Id },
    new Student { Name = "Rovinson", Gender = "Male", UniversityId = 2 },
    new Student { Name = "Brayan", Gender = "Male", UniversityId = 2 },
};
```
In this example we create a List of type Student that contains some new students with its properties, and as you can appreciate the foreign key UniversityId is linked with two entries that we made before in University table, Michigan and Harvard Universities, so by filtering and storing in a new variable you can bind this two universities with they respective students
Adding some information to other tables
This case, StudentLectures table
```csharp
Student Carolina = dataContext.Students.First(st => st.Name.Equals("Carolina"));
Student Jordan = dataContext.Students.First(st => st.Name.Equals("Jordan"));
Student Laura = dataContext.Students.First(st => st.Name.Equals("Laura"));
Student Edgar = dataContext.Students.First(st => st.Name.Equals("Edgar"));
Student Annie = dataContext.Students.First(st => st.Name.Equals("Annie"));
Student Adriana = dataContext.Students.First(st => st.Name.Equals("Adriana"));
Student Jazmin = dataContext.Students.First(st => st.Name.Equals("Jazmin"));
Student Rovinson = dataContext.Students.First(st => st.Name.Equals("Rovinson"));
Student Brayan = dataContext.Students.First(st => st.Name.Equals("Brayan"));

Lecture Math = dataContext.Lectures.First(lct => lct.Name.Equals("Math"));
Lecture History = dataContext.Lectures.First(lct => lct.Name.Equals("History"));
Lecture Physic = dataContext.Lectures.First(lct => lct.Name.Equals("Physic"));
Lecture Sports = dataContext.Lectures.First(lct => lct.Name.Equals("Sports"));
Lecture Spanish = dataContext.Lectures.First(lct => lct.Name.Equals("Spanish"));

// Different ways to add info
// way 1
dataContext.StudentLectures.InsertOnSubmit(new StudentLecture { Student = Carolina, Lecture = History });
dataContext.StudentLectures.InsertOnSubmit(new StudentLecture { Student = Jordan, Lecture = Math });
dataContext.StudentLectures.InsertOnSubmit(new StudentLecture { Student = Edgar, Lecture = Physic });
dataContext.StudentLectures.InsertOnSubmit(new StudentLecture { Student = Annie, Lecture = History });
dataContext.StudentLectures.InsertOnSubmit(new StudentLecture { Student = Adriana, Lecture = Spanish });
dataContext.StudentLectures.InsertOnSubmit(new StudentLecture { Student = Rovinson, Lecture = Spanish });
dataContext.StudentLectures.InsertOnSubmit(new StudentLecture { Student = Jazmin, Lecture = Sports });
dataContext.StudentLectures.InsertOnSubmit(new StudentLecture { Student = Brayan, Lecture = Physic });
```
Some sorting and filtering methods
```csharp
public void GetLecturesByStudent(string student)
{
    Student _student = dataContext.Students.First(st => st.Name.Equals(student));
    var studentLectures = from sl in dataContext.StudentLectures
                          where sl.StudentId == _student.Id
                          select sl.Lecture;
    MessageBox.Show("Lectures of " + student + ": " + string.Join(", ", studentLectures.Select(l => l.Name)));
}

public void GetStudentsWithNrOfLectures(string universityName)
{
    var students = from st in dataContext.Students
                   join nz2 in dataContext.Universities on st.UniversityId equals nz2.Id
                   where nz2.Name == universityName
                   select new { Student = st.Name, University = nz2.Name };
    MainDataGrid.ItemsSource = students;
}

public void GetLectureUniversity()
{
    var lectureUniversity = from lu in dataContext.StudentLectures
                            join st2 in dataContext.Students on lu.StudentId equals st2.Id
                            join nz in dataContext.Universities on st2.UniversityId equals nz.Id
                            select new { StudentName = st2.Name, LectureName = lu.Lecture.Name, UniversityName = nz.Name };
    MainDataGrid.ItemsSource = lectureUniversity;
}
```
```csharp
public static void UpdateStudent(string oldName, string newName)
{
    Student student = dataContext.Students.First(st => st.Name.Equals(oldName));
    student.Name = newName;
    dataContext.SubmitChanges();
}

public void InsertStudent(string name, string gender, string university)
{
    Student student = new Student { Name = name, Gender = gender, University = univ };
    dataContext.Students.InsertOnSubmit(student);
    dataContext.SubmitChanges();
}

public static void DeleteStudent(string studentName)
{
    Student studentToDelete = dataContext.Students.First(st => st.Name.Equals(studentName));
    dataContext.Students.DeleteOnSubmit(studentToDelete);
    dataContext.SubmitChanges();
}
```
And a method to show ordered and clear info about the students
```csharp
public void StudentsView()
{
    var students = from student in dataContext.Students
                   orderby student.Name
                   select new { StudentId = student.Id, Student = student.Name, Gender = student.Gender,
                       UniversityId = student.UniversityId, University = student.University.Name };

    MainDataGrid.ItemsSource = students;
}
```
Actual app view:
