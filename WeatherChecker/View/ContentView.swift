//
//  ContentView.swift
//  WeatherChecker
//
//  Created by Alexander Spurlock on 5/17/23.
//

import SwiftUI

struct ContentView: View {
    @State private var city: String = "Batavia"
    @State private var weather: String = ""
    
    var body: some View {
        VStack {
            HStack {
                TextField("Enter a city", text: $city)
                    .padding()
                    .border(.secondary)
                
                Button(action: {
                    fetchWeather()
                }, label: {
                    Text("Get Weather")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                })
            }
            Spacer()
            Text(weather)
            Spacer()
            
        }
        .padding()
    }
    
    func fetchWeather() {
        guard let encodedCity = city.trimmingCharacters(in: .whitespacesAndNewlines).addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {
            return
        }
        
        guard let url = URL(string: "https://api.weatherapi.com/v1/current.json?key=\(Secrets.weatherApiApiKey)&q=\(encodedCity)&aqi=no") else {
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
                let decoder = JSONDecoder()
                let decodedJson = try decoder.decode(WeatherApiResponse.self, from: data)
                weather = "The weather in \(city) is \(decodedJson.current.condition.text) (\(decodedJson.current.temp_f) F)"
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