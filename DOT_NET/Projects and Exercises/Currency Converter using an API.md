In this exercise i'm going to create a currency converter
Credits to Denis Panjuta, my instructor for his course
You can find the source code in my repo: https://github.com/jtokz/currency-converter-with-wpf-csharp-and-api

A little view how looks like the program once you open
![[Pasted image 20240817170553.png]]
And how looks like working
![[Pasted image 20240817170701.png]]

I´m going to skip the most part of xaml code, I'll leave only events and names part of the elements in the UI

This converter is made using Labels, TextBoxes, ComboBoxes and Buttons all inside StackPanels

To know the elements that we are gonna create, classes, properties and more is necessary to know what information api bring us, so check a look it, I'm using openexchangerates.org api, but we can use any other api to get information, when you sign up api provides you a key in order to can get info through a url with this key, the information that it return us is something like this:
![[Pasted image 20240819132045.png]]
And a large list of currencies with base 1USD, so with these data we now know what objects we need to create, classes, etc

1. Create a Root Main Class with the necessary properties and objects
![[Pasted image 20240819211759.png]]
In this case we need a secondary class Rate with the rates that we are going to use and some variables which we are going to store things like the license of use, etc

2. Then we are going to need add some rates in its class, these variables MUST HAVE THE SAME NAME as the on given us by the API
![[Pasted image 20240819212130.png]]
3. Now we are going to create the logic to call the api
![[Pasted image 20240819212701.png]]
more info about async tasks in [[Api & JSON]] section

Here we pass to the method the api url as an async task and we say to the method that we want to use the information as a Root object
This method has some interesting things:
- First, the api is called inside a try catch in order to manage errors
- Is created a variable to store an HttpClient object
- A timeout is created in case the API is not responding
- The API is called and stored its response in an HttpResponseMessage object, this call should be made with the `await` keyword because we are using an asynchronous method `GetAsync` this would be its sintaxis: Task -HttpResponseMessage- HttpClient.GetAsync(string url), so this GetAsync is a methot of our `client` because remember this is an HttpClient object
- Api returns some information, among they a StatusCode, it says if the call was successful, if it was not found, among other things, so if the StatusCode is OK the rest of code will be executed
