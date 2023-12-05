//
//  ApplicationAssembly.swift
//  WeatherAston
//
//  Created by Mac on 21.11.2023.
//

import Foundation

final class ApplicationAssembly {
    static var locationService: LocationService = {
        return LocationServiceImpl()
    }() 
    
    static var storageService: StorageService = {
        return StorageServiceImpl()
    }()
}
