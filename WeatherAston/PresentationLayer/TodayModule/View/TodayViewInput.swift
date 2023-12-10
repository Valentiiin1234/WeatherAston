//
//  TodayViewInput.swift
//  WeatherAston
//
//  Created by Mac on 03.11.2023.
//

import Foundation


protocol TodayViewInput: AnyObject {
    func loading()
    func showForecast(with viewModel: ForecastViewModel)
    func showError()
}
