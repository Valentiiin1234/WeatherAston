//
//  TodayModuleAssembly.swift
//  WeatherAston
//
//  Created by Mac on 03.11.2023.
//

import UIKit

final class TodayModuleAssembly {
    
    static func buildModule() -> UIViewController {
        let viewModel = TodayViewModel()
        let view = TodayViewController(viewModel: viewModel)
        viewModel.view = view
        return view
    }
}
