//
//  Forecast.swift
//  WheaterApp
//
//  Created by Nazerke Sembay on 28.09.2023.
//

import Foundation

struct Forecast {
    var cityName = ""
    var temp = "12345"
    var pressure = ""
    var humadity = ""
    var visibility = ""
    var windSpeed = ""
    var date = "qwerty"
    var image = ""
    
    init(cityName: String = "", temp: String = "12345", pressure: String = "", humadity: String = "", visibility: String = "", windSpeed: String = "", date: String = "qwerty", image: String = "") {
        self.cityName = cityName
        self.temp = temp
        self.pressure = pressure
        self.humadity = humadity
        self.visibility = visibility
        self.windSpeed = windSpeed
        self.date = date
        self.image = image
    }
}
