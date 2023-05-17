//
//  ContentView.swift
//  WeatherChecker
//
//  Created by Alexander Spurlock on 5/17/23.
//

import SwiftUI

struct ContentView: View {
    @State private var city: String = ""
    @State private var weather: String = ""
    
    var body: some View {
        VStack {
            Text("WeatherChecker!")
            TextField("Enter a city...", text: $city)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            Button(action: {
                fetchWeather()
            }, label: {
                Text("Get Weather")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            })
            
            Text(weather)
            
        }
    }
    
    func fetchWeather() {
        guard let url = URL(string: "https://api.weatherapi.com/v1/current.json?key=\(Secrets.weatherApiApiKey)&q=\(city.trimmingCharacters(in: .whitespacesAndNewlines))&aqi=no") else {
            print("Invlaid URL")
            return
        }

        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("There was an error: \(error)")
                return
            }
            
            guard let data = data, error == nil else {
                print("There was an error setting the data.")
                return
            }

            do {
                if let json = try JSONSerialization.jsonObject(with: data) as? [String: Any],
                let current = json["current"] as? [String: Any],
                   let condition = current["condition"] as? [String: Any],
                   let conditionText = condition["text"] as? String {
                    weather = "The weather in \(city) is \(conditionText)"
                }
                
            } catch {
                print("JSON decoding error: \(error.localizedDescription)")
            }

        }
        
        task.resume()
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
