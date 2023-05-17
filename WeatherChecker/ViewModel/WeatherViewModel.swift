//
//  WeatherViewModel.swift
//  WeatherChecker
//
//  Created by Alexander Spurlock on 5/17/23.
//

import Foundation

class WeatherViewModel: ObservableObject {
    @Published var weather: WeatherApiResponse?
    @Published var location: String = ""
    
    func fetchWeather() {
        guard let encodedLocation = location.trimmingCharacters(in: .whitespacesAndNewlines).addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {
            return
        }
        
        guard let url = URL(string: "https://api.weatherapi.com/v1/current.json?key=\(Secrets.weatherApiApiKey)&q=\(encodedLocation)&aqi=no") else {
            print("Invlaid URL")
            return
        }

        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("There was an error: \(error)")
                return
            }
            
            guard let data = data, error == nil else {
                print("There was an error setting the data.")
                return
            }

            do {
                let decoder = JSONDecoder()
                self.weather = try decoder.decode(WeatherApiResponse.self, from: data)
            } catch {
                print("JSON decoding error: \(error.localizedDescription)")
            }
        }.resume()
    }
}
