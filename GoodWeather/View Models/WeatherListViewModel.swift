//
//  WeatherViewModel.swift
//  GoodWeather
//
//  Created by ChaoBo-Shang on 2022/5/15.
//

import Foundation


class WeatherListViewModel {
    
    private var weatherViewModels = [WeatherViewModel]()
    
    func loadDefaultCity(completion: @escaping (Bool) -> Void) {
        let userDefault = UserDefaults.standard
        if let city = userDefault.value(forKey: "city") as? String {
            let addWeatherVM = AddWeatherViewModel()
            addWeatherVM.addWeather(for: city) { vm in
                self.weatherViewModels.append(vm)
                completion(true)
            }
        } else {
            completion(false)
        }
    }
    
    func addWeatherViewModel(_ vm: WeatherViewModel) {
        weatherViewModels.append(vm)
    }

    func numberOfRows(_ section: Int) -> Int {
        return weatherViewModels.count
    }
    
    func modelAt(_ index: Int) -> WeatherViewModel {
        return weatherViewModels[index]
    }
    
    private func toCelcius() {
        
        weatherViewModels = weatherViewModels.map { vm in
            let weatherModel = vm
            weatherModel.temperature = (weatherModel.temperature - 32) * 5/9
            return weatherModel
        }
        
    }
    
    private func toFahrenheit() {
        weatherViewModels = weatherViewModels.map { vm in
            let weatherModel = vm
            weatherModel.temperature = (weatherModel.temperature * 9/5 ) + 32
            return weatherModel
        }
    }
    
    func updateUnit(to unit: Unit){
        switch unit{
        case .celsius:
            toCelcius()
        case .fahrenheit:
            toFahrenheit()
        }
    }
}

class WeatherViewModel {
    
    let weather: WeatherResponse
    var temperature: Double
    init(weather: WeatherResponse) {
        self.weather = weather
        temperature = weather.main.temp
    }
    
    var city: String {
        return weather.name
    }
    
}
