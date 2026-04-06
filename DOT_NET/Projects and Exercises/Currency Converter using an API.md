---
tags: [lang/csharp, area/ui, type/project]
---

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
```json
{
  "disclaimer": "Usage subject to terms: https://openexchangerates.org/terms",
  "license": "https://openexchangerates.org/license",
  "timestamp": 1724065200,
  "base": "USD",
  "rates": {
    "AED": 3.67296,
    "AFN": 70.865147,
    "ALL": 90.466325,
    "AMD": 387.098013,
    "ANG": 1.795478,
    "AOA": 887.684667,
    "ARS": 941.504325,
    "AUD": 1.494816,
    "AWG": 1.8,
    "AZN": 1.7,
    "BAM": 1.77228,
    "BBD": 2,
    "BDT": 117.058584,
    "BGN": 1.77293,
    "BHD": 0.376929,
    "BIF": 2873.902698,
    "BMD": 1,
    "BND": 1.313941,
    "BOB": 6.884147,
    "BRL": 5.4715,
    "BSD": 1,
    "BTC": 0.00001722141,
    "BTN": 83.630738,
    "BWP": 13.336958,
    "BYN": 3.260296,
    "BZD": 2.008156,
    "CAD": 1.368348,
    "CDF": 2853.88933,
    "CHF": 0.865251,
    "CLF": 0.033675,
    ...
  }
}
```
And a large list of currencies with base 1USD, so with these data we now know what objects we need to create, classes, etc

1. Create a Root Main Class with the necessary properties and objects
```csharp
public class Root
{
    public Rate rates { get; set; } // get All record in rates and Set in Rate Class as Currency Name
    public long timestamp;
    public string license;
    public string disclaimer;
}
```
In this case we need a secondary class Rate with the rates that we are going to use and some variables which we are going to store things like the license of use, etc

2. Then we are going to need add some rates in its class, these variables MUST HAVE THE SAME NAME as the on given us by the API
```csharp
public class Rate
{
    public double MXN { get; set; }
    public double AUD { get; set; }
    public double ARS { get; set; }
    public double PEN { get; set; }
    public double KRW { get; set; }
    public double CAD { get; set; }
    public double CLF { get; set; }
    public double GBP { get; set; }
    public double BTC { get; set; }
    public double INR { get; set; }
}
```
3. Now we are going to create the logic to call the api
```csharp
public static async Task<Root> GetData<T>(string url)
{
    var myRoot = new Root();
    try
    {
        using (var client = new HttpClient()) // HttpClient class provides a base class for sending/receiving the HTTP requests/responses from a URL
        {
            client.Timeout = TimeSpan.FromSeconds(30); // The timespan to wait before the request times out
            HttpResponseMessage response = await client.GetAsync(url); // HttpResponseMessage is a way of returning a message/data from your action
            if (response.StatusCode == System.Net.HttpStatusCode.OK) // Check API response status code OK
            {
                // Convert the received information from byte to string in order that our program can read it, so to speak
                var responseString = await response.Content.ReadAsStringAsync(); // Serialize the HTTP content to a string as an asynchronous operation
                // Convert from Json from string
                var responseObject = JsonConvert.DeserializeObject<Root>(responseString); // JsonConvert.DeserializeObject to deserialize Json to a C#
                MessageBox.Show("License: " + responseObject.license + "\n" + responseObject.disclaimer, "Information", MessageBoxButton.OK, MessageBoxImage.Information);
                return responseObject; // return
            }
        }
    }
    catch (TaskCanceledException)
    {
        MessageBox.Show("The request timed out. Please check your connection and try again.", "Timeout", MessageBoxButton.OK, MessageBoxImage.Warning);
        return myRoot;
    }
    catch
    {
        MessageBox.Show("An unexpected error occurred. Please try again later or contact support.", "System Error", MessageBoxButton.OK, MessageBoxImage.Error);
        return myRoot;
    }
}
```
more info about async tasks in [[Api & JSON]] section

Here we pass to the method the api url as an async task and we say to the method that we want to use the information as a Root object
This method has some interesting things:
- First, the api is called inside a try catch in order to manage errors
- Is created a variable to store an HttpClient object
- A timeout is created in case the API is not responding
- The API is called and stored its response in an HttpResponseMessage object, this call should be made with the `await` keyword because we are using an asynchronous method `GetAsync` this would be its sintaxis: Task -HttpResponseMessage- HttpClient.GetAsync(string url), so this GetAsync is a methot of our `client` because remember this is an HttpClient object
- Api returns some information, among they a StatusCode, it says if the call was successful, if it was not found, among other things, so if the StatusCode is OK the rest of code will be executed
