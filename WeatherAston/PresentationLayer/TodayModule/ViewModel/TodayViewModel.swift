//
//  TodayViewModel.swift
//  WeatherAston
//
//  Created by Mac on 03.11.2023.
//

import UIKit

final class TodayViewModel: TodayViewOutput {
    private var citty : City?
    weak var view: TodayViewInput?
    
    func display(for city: String) {
        let endpoint = CityAPIEndpoint(city: "\(city)")
        NetworkManager.shared.fetch(City.self, from: endpoint) {[weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let data):
                    self?.citty = data
                    print("\(String(describing: self?.citty?.name))")
                    print("\(String(describing: self?.citty?.coord.lat))")
                    print("\(String(describing: self?.citty?.coord.lon))")
                    print("\(String(describing: self?.citty?.weather.description))")
                    
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
}
