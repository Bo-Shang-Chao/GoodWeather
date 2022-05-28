//
//  WeatherCell.swift
//  GoodWeather
//
//  Created by ChaoBo-Shang on 2022/5/15.
//

import Foundation
import UIKit

class WeatherCell: UITableViewCell {
    @IBOutlet var cityNameLabel: UILabel!
    @IBOutlet var temperaturelLabel: UILabel!

    func configure(_ vm: WeatherViewModel) {
        self.cityNameLabel?.text = vm.city
        self.temperaturelLabel?.text = "\(vm.temperature.formatAsDegree())"
    }
}
