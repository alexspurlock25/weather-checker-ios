//
//  Secrets.swift
//  WeatherChecker
//
//  Created by Alexander Spurlock on 5/17/23.
//

import Foundation

struct Secrets {
    static let weatherApiApiKey = ProcessInfo.processInfo.environment["WEATHER_API_API_KEY"] ?? ""
}
