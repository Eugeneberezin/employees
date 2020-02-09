## Employees app. 

# Architecture.
I used MVC pattern for this app.
App has four screens: 
Main screen where user can select a list of emoloyees to view: Employee list, Empty employee list, and Malformated Employee list.
EmployeeList screen - displayes a healthy end point that returns the list of employees.
Empty employee list displays an alert letting a user know that there's no list of employees. 
Malformated employee list displays the alert letting user know that something went wrong. 

Each list screen will display hud indicating a loading state.

# Networking. 
For network layer I ustilize newly provided API by apple where I utilize Result<> generic where I handle success and failure cases. 
Service is a singleton where I handle the network layer. 

# Error messages

I utilize custum error messages in ErrorMessage enum. A custom error messages provide better and more clear user experience vs error localized description. 

# Third party libraries

I utilize SDWebImage to load the images in the add and JGProgressHUD to indicate a loading state. 

# Accessibility. 

I handle basic accessibility for dynamic types as well as Voice Over. 
When a user selects a larger size cell will increase in size. With cell re-sizing I am handling just a basic resizing. It will handle large text, but it can't quite handle a super large text size. 

# Dark mode. 
App supports dark mode. 
I utilize API provided by Apple for the colors as well as custom color assets. 



