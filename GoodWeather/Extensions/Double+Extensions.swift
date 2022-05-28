//
//  Double+Extensions.swift
//  GoodWeather
//
//  Created by ChaoBo-Shang on 2022/5/15.
//

import Foundation


extension Double {
    
    func formatAsDegree() -> String {
        
        let userDefaults = UserDefaults.standard
        if let unitValue = userDefaults.value(forKey: "unit") as? String {
            let unit = Unit(rawValue: unitValue)!
            
            switch (unit) {
            case .celsius:
                return String(format: "%.0f°C", self)
            case .fahrenheit:
                return String(format: "%.0f°F", self)
            }
            
        } else {
            return String(format: "%.0f°", self)
        }
    }
    
}
