//
//  FavoritesViewModel.swift
//  WeatherAston
//
//  Created by Mac on 10.11.2023.
//

import Foundation

class FavoritesViewModel: FavoritesViewOutput {
    
    weak var view: FavoritesViewInput?
    
    private let storageService: StorageService
    
    init(storageService: StorageService) {
        self.storageService = storageService
    }
    
    func showCities() {
                storageService.retriveData { result in
                    switch result {
                    case .success(let data):
                        view?.setupCities(cities: data)
                    case .failure(let error):
                        print(error)
                    }
                }
    }
    
    func clear() {
        storageService.deleteData()
    }

}
