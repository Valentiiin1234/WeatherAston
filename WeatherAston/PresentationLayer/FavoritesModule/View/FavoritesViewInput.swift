//
//  FavoritesViewInput.swift
//  WeatherAston
//
//  Created by Mac on 10.11.2023.
//

import Foundation

protocol FavoritesViewInput: AnyObject {
    
    func setupCities(cities: [EntityCity])
}
