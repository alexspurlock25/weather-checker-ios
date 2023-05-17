//
//  ContentView.swift
//  WeatherChecker
//
//  Created by Alexander Spurlock on 5/17/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = WeatherViewModel()
    
    var body: some View {
        VStack {
            HStack {
                TextField("Enter a city", text: $viewModel.location)
                    .padding()
                    .border(.secondary)
                
                Button(action: {
                    viewModel.fetchWeather()
                }, label: {
                    Text("Get Weather")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                })
            }
            Spacer()
            if viewModel.weather != nil {
                HStack {
                    Spacer()
                    Text("\(viewModel.weather?.location.name ?? ""), \(viewModel.weather?.location.region ?? "")")
                    Spacer()
                    Text("\(viewModel.weather?.current.condition.text ?? ""), \(String(format: "%.1f", viewModel.weather?.current.temp_f ?? 0.0)) F")
                    Spacer()
                }
            }
            Spacer()
            
        }
        .padding()
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
