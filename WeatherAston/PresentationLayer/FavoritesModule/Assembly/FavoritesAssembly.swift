//
//  FavoritesAssembly.swift
//  WeatherAston
//
//  Created by Mac on 10.11.2023.
//

import UIKit

final class FavoritesModuleAssembly {
    
    static func buildModule() -> UIViewController {
        let viewModel = FavoritesViewModel(storageService: ApplicationAssembly.storageService)
        let view = FavoritesViewController(viewModel: viewModel)
        viewModel.view = view
        return view
    }
}
