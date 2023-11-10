//
//  TodayViewController.swift
//  WeatherAston
//
//  Created by Mac on 03.11.2023.
//

import UIKit


final class TodayViewController: UIViewController {
    
    private let searchController = UISearchController()
    
    private let viewModel: TodayViewOutput
    
    init(viewModel: TodayViewOutput) {
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
    private func setupUI(){
        view.backgroundColor = .systemBackground
        title = "Today"
        navigationItem.searchController = searchController
    }
}


extension TodayViewController: TodayViewInput {
    
}


