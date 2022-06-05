//
//  WeatherListViewModelTest.swift
//  GoodWeatherTests
//
//  Created by ChaoBo-Shang on 2022/6/5.
//

import XCTest
@testable import GoodWeather

class WeatherListViewModelTest: XCTestCase {

    private var weatherListVM: WeatherListViewModel!
    
    override func setUp() {
        super.setUp()
        self.weatherListVM = WeatherListViewModel()
        
        self.weatherListVM.addWeatherViewModel(WeatherViewModel(weather: WeatherResponse(name: "Houston", main: Weather(temp: 32, humidity: 0))))
        
        self.weatherListVM.addWeatherViewModel(WeatherViewModel(weather: WeatherResponse(name: "Boston", main: Weather(temp: 72, humidity: 0))))
    }
    
    func test_should_be_able_to_convert_to_celsius_successfully() {
        
        let celsiusTemperatures = [0,22.2222]
        self.weatherListVM.updateUnit(to: .celsius)
        
        for (index, vm) in self.weatherListVM.weatherViewModels.enumerated() {
            XCTAssertEqual(round(vm.temperature), round(celsiusTemperatures[index]))
        }
    }
    
    func test_should_return_correct_display_city_name() {
        
        let cityNames = ["Houston","Boston"]
        
        for (index, vm) in self.weatherListVM.weatherViewModels.enumerated() {
            XCTAssertEqual(vm.city, cityNames[index])
        }
    }
    
    
    
    override func tearDown() {
        super.tearDown()
    }

}
