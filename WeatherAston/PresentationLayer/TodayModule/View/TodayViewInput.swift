//
//  TodayViewInput.swift
//  WeatherAston
//
//  Created by Mac on 03.11.2023.
//

import Foundation


protocol TodayViewInput: AnyObject {

    func displayLabels(city: String, temp: String, speed: String, clouds: String, humidity: String, description: String)
}
