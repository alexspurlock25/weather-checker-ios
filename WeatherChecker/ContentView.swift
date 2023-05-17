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
                .padding()
            
        }
    }
    
    func fetchWeather() {
        weather = "Current weather in \(city): "
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
