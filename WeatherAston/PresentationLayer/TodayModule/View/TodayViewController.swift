//
//  TodayViewController.swift
//  WeatherAston
//
//  Created by Mac on 03.11.2023.
//

import UIKit

final class TodayViewController: UIViewController, UISearchBarDelegate {
    private let labelCity = UILabel()
    private let labelTemp = UILabel()
    private let labelWind = UILabel()
    private let labelClouds = UILabel()
    private let labelHumidity = UILabel()
    private let labelDescription = UILabel()
    private let stackView = UIStackView()
    private let imageLocation = UIImageView()
    private let searchController = UISearchController()
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
        viewModel.getCurrentLocation()
    }
    
    //MARK: - MethodsDelegate
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        hideForecast()
        activityIndicator.startAnimating()
        guard let city = searchBar.text else {return}
        viewModel.searchCity(for: city)
    }
}

//MARK: - TodayViewInput
extension TodayViewController: TodayViewInput {
    func displayLabels(city: String, temp: String, speed: String, clouds: String, humidity: String, description: String) {
        labelCity.text = city
        labelTemp.text = temp + "°"
        labelWind.text = "wind: " + speed + " m/s"
        labelClouds.text = "cloudy: " + clouds + "%"
        labelHumidity.text = "humidity: " + humidity + "%"
        labelDescription.text = description
        showForecast()
        activityIndicator.stopAnimating()
    }
}
//MARK: - setupUI
private extension TodayViewController {
    func settingsLabels(labels: UILabel...) {
        labels.forEach { label in
            label.textAlignment = .center
            label.backgroundColor = .systemBackground
            label.layer.masksToBounds = true
            label.layer.borderWidth = 5
            label.layer.cornerRadius = 15
            label.layer.borderColor = UIColor.systemCyan.cgColor
        }
    }
    
    func showForecast(){
        stackView.isHidden = false
        labelCity.isHidden = false
        labelTemp.isHidden = false
        imageLocation.isHidden = false
        labelDescription.isHidden = false
    }
    func hideForecast(){
        labelCity.isHidden = true
        labelTemp.isHidden = true
        imageLocation.isHidden = true
        stackView.isHidden = true
        labelDescription.isHidden = true
    }

    func setupUI(){
        view.addSubview(imageLocation)
        view.addSubview(labelCity)
        view.addSubview(labelTemp)
        view.addSubview(labelDescription)
        view.addSubview(stackView)
        view.addSubview(activityIndicator)
        
        view.backgroundColor = .systemBackground
        
        title = "Forecast today"
        navigationItem.searchController = searchController
        searchController.searchBar.placeholder = "Enter city"
        searchController.searchBar.delegate = self
        searchController.hidesNavigationBarDuringPresentation = false
        
        stackView.addArrangedSubview(labelWind)
        stackView.addArrangedSubview(labelClouds)
        stackView.addArrangedSubview(labelHumidity)
        
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        settingsLabels(labels: labelWind, labelClouds, labelHumidity)
        
        imageLocation.image = UIImage(systemName: "location.fill")
        labelCity.font = .boldSystemFont(ofSize: 35)
        labelTemp.font = .boldSystemFont(ofSize: 65)
        labelDescription.font = .boldSystemFont(ofSize: 35)
        
        labelTemp.textAlignment = .center
        labelDescription.textAlignment = .center
        activityIndicator.hidesWhenStopped = true
        
        hideForecast()
        activityIndicator.startAnimating()
    }
    //MARK: - setupConstraints
    func setupConstraints(){
        imageLocation.translatesAutoresizingMaskIntoConstraints = false
        imageLocation.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15).isActive = true
        imageLocation.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15).isActive = true
        imageLocation.widthAnchor.constraint(equalToConstant: 40).isActive = true
        imageLocation.heightAnchor.constraint(equalTo: imageLocation.widthAnchor, multiplier: 1 / 1).isActive = true
        
        labelCity.translatesAutoresizingMaskIntoConstraints = false
        labelCity.leftAnchor.constraint(equalTo: imageLocation.rightAnchor,constant: 2).isActive = true
        labelCity.heightAnchor.constraint(equalToConstant: 40).isActive = true
        labelCity.rightAnchor.constraint(equalTo: view.rightAnchor,constant: -15).isActive = true
        labelCity.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15).isActive = true
        
        labelTemp.translatesAutoresizingMaskIntoConstraints = false
        labelTemp.topAnchor.constraint(equalTo: labelCity.bottomAnchor).isActive = true
        labelTemp.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 75).isActive = true
        labelTemp.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -75).isActive = true
        labelTemp.heightAnchor.constraint(equalTo: labelTemp.widthAnchor, multiplier: 1 / 1).isActive = true
        
        
        labelDescription.translatesAutoresizingMaskIntoConstraints = false
        labelDescription.topAnchor.constraint(equalTo: labelTemp.bottomAnchor).isActive = true
        labelDescription.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        labelDescription.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        stackView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        stackView.topAnchor.constraint(equalTo: labelDescription.bottomAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
}
