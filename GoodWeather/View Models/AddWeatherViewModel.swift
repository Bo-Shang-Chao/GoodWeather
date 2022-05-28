//
//  AddWeatherViewModel.swift
//  GoodWeather
//
//  Created by ChaoBo-Shang on 2022/5/15.
//

import Foundation

class AddWeatherViewModel {
    func addWeather(for city: String, completion: @escaping (WeatherViewModel) -> Void) {
        let weatherURL = Constants.Urls.urlForWeatherByCity(city: city)
        
        let weatherResource = Resource<WeatherResponse>(url: weatherURL) { data in
            let weatherResponse = try? JSONDecoder().decode(WeatherResponse.self, from: data)
            return weatherResponse
        }
        
        Webservice().load(resource: weatherResource) { result in
            
            if let weatherResource = result {
                let vm = WeatherViewModel(weather: weatherResource)
                completion(vm)
                let userDefault = UserDefaults.standard
                userDefault.set(city, forKey: "city")
            }
        }
    }
}
