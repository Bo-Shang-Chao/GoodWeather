//
//  WeatherResponse.swift
//  GoodWeather
//
//  Created by ChaoBo-Shang on 2022/5/15.
//

import Foundation

struct WeatherResponse: Decodable {
    let name: String
    let main: Weather
}

struct Weather: Decodable {
    let temp: Double
    let humidity: Double
}
