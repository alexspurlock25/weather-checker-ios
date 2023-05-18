# A Weather checker written in SwiftUI

I made this app so that I can practive making API calls using SwiftUI's native APIs. 
In this case I used WeatherAPI, using the "current" rest endpoints.

If you're curious about the API and its endpoints, take a look at my model file that models the response (WeatherApiResponse.swift).

## Note
If you plan to clone this project, please know that you will have to create an account with WeatherAPI and add the api key as a variable in your xcode project settings. 

The key should be: WEATHER_API_API_KEY, and value is just your api key.
Sign up here: https://www.weatherapi.com

After cloning the project and setting up the env variable, the project should work because I have a swift file that handles the api key exchange in the project. It's called Secrets.swift

## Images

![Image of home screen](https://github.com/alexspurlock25/weather-checker-swftui/ProjectScreenshots/homeview.png)
