//
//  Constants.swift
//  GoodWeather
//
//  Created by ChaoBo-Shang on 2022/5/15.
//

import Foundation


struct Constants {
    
    struct Urls {
        
        static func urlForWeatherByCity(city: String) -> URL {
            //get the default settings for temperature
            let userDefaults = UserDefaults.standard
            let unit = (userDefaults.value(forKey: "unit") as? String) ?? "imperial"
            return URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city.escaped())&appid=bb8ffbbfc0973f324ca2a2dbe072a2b1&units=\(unit)")!
        }
    }
    
}
