---
tags: [lang/csharp, area/ui, type/concept]
---

**Ver también:** [[csharp basics]]

WPF is the framework to make graphical interfaces

Print a message
MessageBox.Show(String a);

# XAML

Creating a Grid by XAML
```xml
<Grid x:Name="myGrid">

    <Grid.ColumnDefinitions>
        <ColumnDefinition Width="10" />
        <ColumnDefinition Width="*" />
        <ColumnDefinition Width="*" />
        <ColumnDefinition Width="10" />
        <ColumnDefinition Width="*" />
        <ColumnDefinition Width="*" />
        <ColumnDefinition Width="10" />
    </Grid.ColumnDefinitions>
```
```xml
<Grid.RowDefinitions>
    <RowDefinition Height="10" />
    <RowDefinition Height="25" />
    <RowDefinition Height="10" />
    <RowDefinition Height="25" />
    <RowDefinition Height="10" />
</Grid.RowDefinitions>

<Button Grid.Column="2" Grid.Row="1" HorizontalAlignment="Center" Grid.Row="2" VerticalAlignment="Center" Height="25" Width="135" />
<Label Grid.Row="2" Grid.Column="2" Grid.ColumnSpan="3" Content="Sample Text: Lorem ipsum no se qué lala land best movie evaj" />
```
![[Pasted image 20240422144629.png]]
# WPF WITH CSHARP
You can create a layout using XAML, that it's a Language like HTML but if you want to make for example, dynamic buttons is better create it using C#

```csharp
// linking our XAML Grid
// FindName returns an Object of its type so its necesary casting it in this case as Grid
Grid myGrid = (Grid)FindName("myGrid");
// Creating a button, setting its position & its content
Button myButton = new Button();
myButton.Content = "B";
Grid.SetRow(myButton, 3);
Grid.SetColumn(myButton, 4);
// Adding our button to our grid
myGrid.Children.Add(myButton);
```
To link a Grid is necessary to set a name to the grid in XAML if you want to display in it


#### Make a todo list app

XAML  *UI Part*
```xml
<Grid>
    <Grid.ColumnDefinitions>
        <ColumnDefinition Width="10" />
        <ColumnDefinition Width="*" />
        <ColumnDefinition Width="*" />
    </Grid.ColumnDefinitions>
    <Grid.RowDefinitions>
        <RowDefinition Height="*" />
        <RowDefinition Height="*" />
        <RowDefinition Height="*" />
        <RowDefinition Height="*" />
        <RowDefinition Height="*" />
    </Grid.RowDefinitions>

    <Rectangle Grid.Row="0" Grid.RowSpan="..." Grid.Column="0" Grid.ColumnSpan="..." Fill="..." />
    <Rectangle Grid.Row="0" Grid.Column="..." Grid.ColumnSpan="..." Fill="..." />
```
```xml
<!-- Boton para agregar elementos -->
<Button Click="AddTodoButton_Click" Grid.Row="1" Grid.Column="1" Content="Add" Background="#FFFFFF" />

<!-- Contenedor de texto para agregar -->
<TextBox x:Name="TodoInput" Grid.Row="1" Grid.Column="1" VerticalScrollBarVisibility="Auto" Foreground="White" />
<StackPanel x:Name="TodoList" Grid.Row="1" Grid.Column="1" VerticalScrollBarVisibility="Auto" />
    <ScrollViewer>
        <StackPanel x:Name="TodoList" />
    </ScrollViewer>
```

C# *Logical part*

```csharp
public partial class MainWindow : Window
{
    public MainWindow()
    {
        InitializeComponent();
        // subscribe the element to the event if u didn't link from XAML
        //TodoInput.KeyDown += EnterEvent;
    }

    private void AddInputToList()
    {
        // Save the input in a string variable
        string todoText = TodoInput.Text;

        // Print a message
        //MessageBox.Show(todoText);
```
```csharp
        // validates if input is not null
        if (!string.IsNullOrEmpty(todoText))
        {
            // Cast the input string in a Textblock object

            // way 1
            //TextBlock todoItem = new TextBlock();
            //todoItem.Text = todoText;

            // way 2
            TextBlock todoItem = new TextBlock
            {
                Text = todoText,
                Margin = new Thickness(4),
                Foreground = new SolidColorBrush(Colors.White),
            };

            // Add it to our StackPanel
            TodoList.Children.Add(todoItem);
        }
        // Clear the TextBox
        TodoInput.Clear();
    }
```
```csharp
    private void EnterEvent (object sender, KeyEventArgs e)
    {
        if(e.Key == Key.Enter)
        {
            AddInputToList();
        }
    }

    private void AddTodoButton_Click(object sender, RoutedEventArgs e)
    {
        AddInputToList();
    }
```

![[Pasted image 20240423090234.png]]

#### Content Control & User Control

We can have multiple content controls depending on the complexity of the app.
You maybe want to have different content controls where each content has, different formatting

What is Content control?
Content control is an object container of User Controls, so you can assign it an user interface to show to the user

You can set a Content Control inside the Grid of MainWindow and assign it an specific row and column or just by default in 0,0
```xml
<Grid>
    <ContentControl x:Name="MainContent" />
</Grid>
```

With this name you can access to it from its c sharp file and set a value, so a ContentControl is just an empty container inside the grid and you must to set it an object to show, in this example, the LoginView

```xml
<Grid>
    <Grid.ColumnDefinitions>
        <ColumnDefinition Width="*" />
        <ColumnDefinition Width="10" />
    </Grid.ColumnDefinitions>
    <Grid.RowDefinitions>
        <RowDefinition Height="10" />
        <RowDefinition Height="25" />
        <RowDefinition Height="25" />
        <RowDefinition Height="*" />
    </Grid.RowDefinitions>

    <Label Grid.Column="1" Grid.Row="1" Content="Please Login" HorizontalAlignment="Center" />
```
LoginView is an User Interface that will show a line "Please Login" and a button `Login`
After designing it, we need to assign it to a Content Control in order to show it to the user
```csharp
public MainWindow()
{
    InitializeComponent();

    MainContent.Content = new LoginView();
}
```
So we create an instance of LoginView and set it to MainContent ContentControl, this way it will show to the user the LoginView panel
![[Pasted image 20240425161504.png]]
Then, we want to add a functionality to the Login button, adding a Clic event and given it a name, in this case `LoginButton_Clicked` in order to able to select it in c sharp file
```xaml
<Label Grid.Column="1" Grid.Row="1" ... />
<Button Click="LoginButton_Clicked" ... />
```
![[Pasted image 20240425161807.png]]
Here we set the event with its name, it's very important to write correctly the name, in other way it will send an error 


###### Data Binding
Data context puede servir para ver y editar los datos de un usuario ya registrado
As its name indicates, data bindings is a powerful tool of WPF to link content with the UI from different sources like, Data bases, Objects or other WPF controllers

In this exercise we are going to show in a little panel some information about a user (an object) so we want to display properties like Name and Age

Create a Class called Person with properties Name and Age
```csharp
class Person
{
    public string Name { get; set; }
    public int Age { get; set; }

    public Person(string name, int age)
    {
        Name = name;
        Age = age;
    }
}
```

Instantiate an object type Person and set the properties, in this case Jordan as Name and his Age, 26
```csharp
Person person1 = new Person("Jordan", 26);

public MainWindow()
{
    InitializeComponent();
    this.DataContext = person1;
}

private void InfoButton_Clicked(object sender, RoutedEventArgs e)
{
    MessageBox.Show($"{person1.Name} is {person1.Age} years old");
}
```
Disclaimer --This is one way to binding, there are some other ways like linking directly in XAML another WPF controller or other ways--

This way, we are going to set the MainWindow DataContext as person1 which is our object Person type, a window can only has ONE 1, Data context, because, is its context badmtsss, if you want to set another data context in this window just change it, but it cannot have 2 DataContext at the same time
![[Pasted image 20240426142126.png]]
Once set DataContext you can access to the properties of the object set, such as the Name and Age properties from MainWindow xaml file

There are some Modes to show the information

- OneWay - allows only show the information from source to the target, but target cannot change this information or send information to the source

- OneWaySource - Same but in reverse, target sends information to source but not the other way around

- TwoWay - Can send and receive information from source to target and from target to source

- OneTime - Just shows the first information set, so when you initialize it just shows what is set but not any other change

How To Margin in XAML
![[Pasted image 20240429102148.png]]
###### ListBox
ListBox is a UI Controller that can store a List, so you can bind the ListBox Controller with a List T>
```xaml
<ListBox x:Name="ListBoxPeople" Grid.Column="1" Grid.Row="1">
```
And binding in cs file
```csharp
public MainWindow()
{
    InitializeComponent();
    ListBoxPeople.ItemsSource = people;
}
```
###### ItemTemplate

If we create an ItemTemplate we can define how the things inside of the ListBox, its elements, start to appear or what is their layout

Inside of ItemTemplate we need to define a DataTemplate, here we can start to using elemets that we already know, for example a StackPanel

```xaml
<ListBox x:Name="ListBoxPeople" Grid.Column="1" Grid.Row="1">
    <!--We can start adding new controlls inside the ListBox (UI Elements)-->
    <ListBox.ItemTemplate>
        <DataTemplate>
            <StackPanel>
                <TextBlock Text="{Binding Path=Name}" />
                <TextBlock Text="{Binding Path=Age}" />
            </StackPanel>
        </DataTemplate>
    </ListBox.ItemTemplate>
</ListBox>
```

As we have bound the ListBox with the List of type Person called people, we can access to the properties of this list as are Name and Age, so we can display it onto the application with Binding it in a TextBlock

![[Pasted image 20240429152636.png]]
So we have our own kind of layout for a single list box entry, so we have a StackPanel that consisting of two items in each entry, each entry has a stackpanel and a stack panel has a Name and an Age from person list

Could say that ItemBox defines the behavior of each item inside the List, is the layout that each item are going to get
```xaml
<ListBox.ItemTemplate>
    <DataTemplate>
        <StackPanel>
            <TextBlock Text="{Binding Path=Name}" />
            <TextBlock Text="{Binding Path=Age}" />
        </StackPanel>
    </DataTemplate>
</ListBox.ItemTemplate>
```
Then each element will respond to the guidelines that are assigned in its ItemTemplate
We can add more information to the user, bc if you just say them 26 could be anything so we have to say them ok, Age of this person is 26
```xaml
<StackPanel>
    <TextBlock Text="{Binding Path=Name, StringFormat='Name: {0}'}" />
    <TextBlock Text="{Binding Path=Age, StringFormat='Age: {0}'}" />
</StackPanel>
```
This way app gonna display Name: and Age: before the actual data

Access to data

ListBox has implicit a property that allows to select one or more items from the list, and you can work with this information
first of all set a SelectionMode
```xaml
<ListBox x:Name="ListBoxPeople" SelectionMode="Multiple" Grid.Column="1" Grid.Row="1">
```
And a button, remember set an evento to the button and give it a name
```xaml
<Button x:Name="InfoButton" Content="Info" Click="Button_Click" Grid.Column="1" Grid.Row="2" Margin="100,0,100,0" />
```
```csharp
private void Button_Click(object sender, RoutedEventArgs e)
{
    var SelectedItems = ListBoxPeople.SelectedItems;

    // just to remember how to cast
    foreach (var item in SelectedItems)
    // because you just simply change the type of var for Person
    // since this is the object type inside SelectedItems
    {
        var castedPerson = (Person)item;
        MessageBox.Show(castedPerson.Name);
    }
}
```
Then in its cs file set what the method will do, make a variable and save in it the property SelectedItem or SelectedItems depends which SelectionMode have you set
You can Display the information (if is multiple panels) with a foreach, so you can do 2 things, first one is make a foreach with Person p in SelectedItems or var item, second one is stupid but is the way the teacher did it, cast and show
###### Login App exercise

- We are going to create an example of Login App window, so we need to create a Content Control to show it
```xaml
Title="MainWindow" Height="300" Width="400">
    <Grid>
        <ContentControl x:Name="MainContent" />
    </Grid>
</Window>
```
- Then we create a User Control to set onto the ContentControl, create the visuals, Interface Controllers and Events
![[Pasted image 20240514121609.png]]

- Create a new instance of LoginView which is our UserControl LoginInterface and set to Content of MainContent which is our ContentControl

```csharp
public MainWindow()
{
    InitializeComponent();
    MainContent.Content = new LoginView();
}
```
- Then Add the logic to the clic button and PasswordBox
*This is in LoginView Class*
```csharp
public void OnLoginClicked(object sender, RoutedEventArgs e)
{
    string passwordEntered = PasswordBox.Password;
    string? envPass = System.Environment.GetEnvironmentVariable("LoginAppDemo");

    if (envPass != null)
    {
        if (passwordEntered == envPass)
        {
            MessageBox.Show("Logged!");
        }
        else
        {
            MessageBox.Show("Incorrect Password");
            PasswordBox.Clear();
        }
    }
    else
    {
        MessageBox.Show("Environment variable not found");
    }
}

private void OnPasswordChanged(object sender, EventArgs e)
{
    LogIn.IsEnabled = !string.IsNullOrEmpty(LogIn.Password);
}
```
- Previously is created an environment variable and it was used in this exercise
- Store in a variable the content of PasswordBox and compare it with our envPass which would be our password
- If it's correct, display a message saying Logged
- If not an incorrect password and clear the Password
- PasswordChanged Event is used to watch changes onto the PasswordBox, propertie IsEnabled is used to allows clic in the button, so if user has not yet introduced any key LogButton will not be available
##### Currency Converter App
We are going to create a static currency converter, lather i'm going to create a currency converter connected to a data base

This app won't have Control or User controls, so first of all let's create the visuals, set the fields, controllers and events

![[Pasted image 20240514133100.png]]
![[Pasted image 20240514133145.png]]
![[Pasted image 20240514133209.png]]

This XAML code contains a lot of things, contains:
- The Grid where our visuals are going to be
- 5 Rows to set the content
- TextBox for input the amount
- ComboBox to select the currency From and To
- Events like Click, PreviewTextInput
- Each item has a name with which we can identify in csharp file

IN CODE:
![[Pasted image 20240514183358.png]]
First of all we are going to create a table to bind it with the ComboBoxes and them can show something

This will contain some 2 Columns: Text and Value, text with the name of the currency and Value with the value compared with a $Dollar value
And 5 Rows which will contain different currencies like USD EURO POUND COP ETC, this is static and local, but later we are going to connect it with a database

ITEM SOURCE PROPERTY - gets or sets a collection used to generate the content of the ItemControl

Convert_Click Event:
```csharp
private void Convert_Click(object sender, RoutedEventArgs e)
{
    double ConvertedValue;

    // Check if the amount textbox is Null or Blank
    if (AmountBox == null || AmountBox.Text.Trim() == "")
    {
        MessageBox.Show("Please Enter Currency", "Information", MessageBoxButton.OK, MessageBoxImage.Information);
        AmountBox.Focus();
        return;
    }
    // Else if currency From is not selected or is default --Select--
    else if (FromCurrency.SelectedValue == null || FromCurrency.SelectedIndex == 0)
    {
        MessageBox.Show("Please select a currency from", "Information", MessageBoxButton.OK, MessageBoxImage.Information);
        FromCurrency.Focus();
    }
    // Else if currency To is not selected or is default --Select--
    else if (ToCurrency.SelectedValue == null || ToCurrency.SelectedIndex == 0)
    {
        MessageBox.Show("Please select a currency to", "Information", MessageBoxButton.OK, MessageBoxImage.Information);
        ToCurrency.Focus();
    }
    else
    {
        if (FromCurrency.SelectedIndex == ToCurrency.SelectedIndex)
        {
            ConvertedValue = double.Parse(AmountBox.Text);
            LabelConvertedValue.Content = ConvertedValue.ToString("N2");
        }
        else
        {
            // Calculation: amount * (ToValue / FromValue)
            ConvertedValue = double.Parse(AmountBox.Text)
                           * double.Parse(ToCurrency.SelectedValue.ToString())
                           / double.Parse(FromCurrency.SelectedValue.ToString());
            LabelConvertedValue.Content = ToCurrency.SelectedValue.ToString() + " " + ConvertedValue.ToString("N2");
        }
    }
}
```
Clear_Click Event, and EnteredAmount Event
```csharp
private void Clear_Click(object sender, RoutedEventArgs e)
{
    AmountBox.Text = "";
    FromCurrency.SelectedIndex = 0;
    ToCurrency.SelectedIndex = 0;
    LabelConvertedValue.Content = "";
}

// Restrict TextBox to only allow numeric input
private void EnterPressed(object sender, TextCompositionEventArgs e)
{
    e.Handled = !int.TryParse(e.Text, out int result);
}
```

HANDLE PROPERTIE
![[Pasted image 20240508131122.png]]
![[Pasted image 20240508131132.png]]
![[Pasted image 20240508131147.png]]

When a image isn't showed Right clic in it > properties > Set Build Action as Resource