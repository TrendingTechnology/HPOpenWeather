//
//  Enums.swift
//  HPOpenWeather
//
//  Created by Henrik Panhans on 26.04.19.
//  Copyright © 2019 Henrik Panhans. All rights reserved.
//

import Foundation

/// Declares which forecast endpoint should be used
public enum ForecastType: String {
    
    /// Returns hourly forecast for the next 96 hours. Available for Developer, Professional and Enterprise accounts
    case hourly = "http://api.openweathermap.org/data/2.5/forecast/hourly?"
    
    /// Returns the forecast for the next 5 days in a 3 hour interval. Available for all accounts
    case threeHourly = "http://api.openweathermap.org/data/2.5/forecast?"
    
    /// Returns the daily forecast for the next 16 days. Available for all paid accounts
    case daily = "http://api.openweathermap.org/data/2.5/forecast/daily?"
}

/// Declares which temperature unit is uses in API response
public enum TemperatureUnit: String {
    case celsius = "metric"
    case fahrenheit = "imperial"
    case kelvin
}

/// Declares which language is uses in API response
public enum Language : String {
    case english = "en",
    russian = "ru",
    italian = "it",
    spanish = "es",
    ukrainian = "uk",
    german = "de",
    portuguese = "pt",
    romanian = "ro",
    polish = "pl",
    finnish = "fi",
    dutch = "nl",
    french = "fr",
    bulgarian = "bg",
    swedish = "sv",
    chineseTraditional = "zh_tw",
    chineseSimplified = "zh_cn",
    turkish = "tr",
    croatian = "hr",
    catalan = "ca"
}