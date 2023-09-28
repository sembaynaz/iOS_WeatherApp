//
//  Forecast.swift
//  WheaterApp
//
//  Created by Nazerke Sembay on 28.09.2023.
//

import Foundation
import SwiftyJSON

struct Forecast {
    var temp = ""
    var pressure = ""
    var humidity = ""
    var visibility = "1000 miles"
    var windSpeed = ""
    var date = ""
    var image = ""
    
    init(json: JSON) {
        if let main = json["main"].dictionary {
            if let tempValue = main["temp"]?.stringValue {
                var temperature = String(
                    format: "%.1f",
                    (Double(tempValue) ?? 0.0) - 273.15
                )
                
                if temperature.hasSuffix(".0") {
                    temperature.removeLast(2)
                    temp = temperature
                } else {
                    temp = temperature
                }
            }
            if let pressureValue = main["pressure"]?.stringValue {
                pressure = pressureValue + " mb"
            }
            if let humidityValue = main["humidity"]?.stringValue {
                humidity = humidityValue + "%"
            }
        }
        
        if let visibilityValue = json["visibility"].string {
            visibility = visibilityValue + " miles"
        }
        
        if let wind = json["wind"].dictionary {
            if let speedValue = wind["speed"]?.stringValue {
                windSpeed = speedValue + " mph"
            }
        }
        
        if let dateValue = json["dt_txt"].string {
            date = dateValue
        }
        
        if let weather = json["weather"].array?.first {
            if let iconValue = weather["icon"].string {
                image = iconValue
            }
        }
    }
}

struct Weather {
    var cityName = ""
    var countryName = ""
    var forecastArray: [Forecast] = []
    
    init(json: JSON) {
        if let city = json["city"].dictionary {
            if let name = city["name"]?.string {
                cityName = name
            }
        }
        if let country = json["city"].dictionary {
            if let name = country["country"]?.string {
                countryName = name
            }
        }
        if let list = json["list"].array {
            for item in list {
                let forecast = Forecast(json: item)
                forecastArray.append(forecast)
            }
        }
    }
}
