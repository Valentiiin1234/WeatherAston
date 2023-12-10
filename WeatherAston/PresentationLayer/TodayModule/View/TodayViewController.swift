//
//  TodayViewController.swift
//  WeatherAston
//
//  Created by Mac on 03.11.2023.
//

import UIKit

final class TodayViewController: UIViewController, UISearchBarDelegate, UISearchControllerDelegate {
    
    private let searchController = UISearchController()
    
    private let forecastView = ForecastView()
    private let errorView = ErrorView()
    private let activityIndicator = UIActivityIndicatorView()

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
        setupConstraints()
        setupActions()
        viewModel.getCurrentLocation()

 
    }
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        guard let city = searchBar.text, !city.isEmpty else {
            return
        }
        viewModel.searchCity(city: city)
    }
}

//MARK: - TodayViewInput
extension TodayViewController: TodayViewInput {
    func loading() {
        activityIndicator.startAnimating()
        forecastView.isHidden = true
        errorView.isHidden = true
    }
    
    func showForecast(with viewModel: ForecastViewModel) {
        activityIndicator.stopAnimating()
        forecastView.isHidden = false
        errorView.isHidden = true
        forecastView.configure(with: viewModel)
    }
    
    func showError() {
        activityIndicator.stopAnimating()
        forecastView.isHidden = true
        errorView.isHidden = false
    }
}
//MARK: - setupUI
private extension TodayViewController {

    
    func setupUI(){
        view.addSubview(activityIndicator)
        view.addSubview(forecastView)
        view.addSubview(errorView)
        view.backgroundColor = .systemBackground
        title = "Forecast"
        activityIndicator.hidesWhenStopped = true
        
        navigationItem.searchController = searchController
        searchController.searchBar.delegate = self
        searchController.hidesNavigationBarDuringPresentation = false
        
        activityIndicator.isHidden = true
        forecastView.isHidden = true
        errorView.isHidden = true
        
    }
    //MARK: - setupConstraints
    func setupConstraints(){
        
        forecastView.translatesAutoresizingMaskIntoConstraints = false
        forecastView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor).isActive = true
        forecastView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor).isActive = true
        forecastView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        forecastView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        errorView.translatesAutoresizingMaskIntoConstraints = false
        errorView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor).isActive = true
        errorView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor).isActive = true
        errorView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        errorView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    func setupActions(){
        errorView.onTapReload = {[weak self] in
            self?.viewModel.getCurrentLocation()
        }
    }
}
