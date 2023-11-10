//
//  FavoritesViewController.swift
//  WeatherAston
//
//  Created by Mac on 10.11.2023.
//

import UIKit

final class FavoritesViewController: UIViewController {
    
    
    private let viewModel: FavoritesViewOutput
    
    init(viewModel: FavoritesViewOutput) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    //MARK: - setupUI
    private func setupUI() {
        view.backgroundColor = .systemBackground
        
    }
}


extension FavoritesViewController: FavoritesViewInput {
    
}
