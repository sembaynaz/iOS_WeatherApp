# iOS_WeatherApp
<img width = "245" height = "500" src = "https://github.com/sembaynaz/iOS_WeatherApp/assets/96616194/7d64ca6f-3cfd-411b-858e-d8ff1731d27d">
<img width = "245" height = "500" src = "https://github.com/sembaynaz/iOS_WeatherApp/assets/96616194/651dc5a0-22ad-4d1c-9b05-f5de4c3743aa">

## Project Description
The iOS_WeatherApp project is a simple stopwatch and timer app built for iOS using SnapKit. The weather app is designed so that users can 
get up-to-date information about the weather in the selected city. The app provides a detailed forecast for 5 days, including temperature, pressure, 
humidity, visibility and wind speed. Also, you can find out the current weather conditions in the selected city.

## Installation
Libraries are used here: **UIKit**,**SnapKit**, **Alamofire**, **SVProgressHUD**, **SwiftyJSON**, **SDWebImage**, . You can download the project from GitHub as a zip file and then open it in the **xCode** application.

## Usage
Home Screen: On the main screen of the app you will see the current weather conditions for your city, including temperature, pressure, humidity, visibility and wind speed. 
An icon showing the current weather conditions is also displayed here.
City search: Click on the "Search" button and enter the name of the city whose weather you want to know about. 
After entering, click "Search" and you will see the weather for the selected city for 5 days and the current weather conditions.

func configureUI()

Configures the layout constraints and appearance for all UI elements on the main screen.

func loadData()

Sends a network request to the OpenWeatherMap API to fetch weather data for the specified city. Parses the JSON response and updates the UI accordingly.

func setResults()

Updates the UI elements with weather data obtained from the API response.

func setFormattedDate(date: String) -> String

Formats the input date string into a human-readable date format (e.g., "Today, May 7th, 2021").

@objc func openSearchScreen()

Presents the search screen allowing the user to input a new city for weather information.

func updateUIWithData()

Updates the UI elements and collection view with the fetched weather data.

Protocols:
CityNameProtocol

func setCityName(_ cityName: String): Updates the city property with the specified city name and triggers a data refresh.

func setConstraints()

Sets up the layout constraints for all UI elements on the search screen.

@objc func exitButtonTouched()

Dismisses the search screen when the exit button is tapped.

@objc func searchButtonTapped()

Triggers the city search action when the search button is tapped. Calls the someFunction() to handle the search action and then dismisses the search screen.

func someFunction()

Extracts the city name from the text field and passes it back to the main screen through the delegate.

func buttonTapped()

Assigns actions to the exit button and search button. When tapped, the exit button dismisses the screen, and the search button triggers the search action.


## Contribution
Contributions to this project are welcome!
You can organize my code, add a new functionalities, user interface improvments,testing, error handling. 

## Author
git: sembaynaz

mail: nazerke.sembay11@gmail.com 

telegram: @sembaynaz
