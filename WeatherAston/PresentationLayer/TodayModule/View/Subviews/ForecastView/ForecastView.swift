//
//  ParametersPlateView.swift
//  WeatherAston
//
//  Created by Mac on 05.12.2023.
//

import UIKit

struct ForecastViewModel {
    let city: LocationViewParamViewModel
    let wind: WeatherParameterViewModel
    let clouds: WeatherParameterViewModel
    let labelHumidity: WeatherParameterViewModel
    let description: String
    let currenrTemp: ElementTempViewModel
    let tempMax: ElementTempViewModel
    let tempMin: ElementTempViewModel
}

final class ForecastView: UIView {
    
    private let city = LocationView()
    private let labelCurentTemp = ElementTempView()
    private let labelMaxTemp = ElementTempView()
    private let labelMinTemp = ElementTempView()
    private let labelDescription = UILabel()
    private let labelWind = WeatherParameterView()
    private let labelClouds = WeatherParameterView()
    private let labelHumidity = WeatherParameterView()
    private let vStack = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with viewModel: ForecastViewModel) {
        labelWind.configure(with: viewModel.wind)
        labelClouds.configure(with: viewModel.clouds)
        labelHumidity.configure(with: viewModel.labelHumidity)
        labelDescription.text = viewModel.description
        city.configure(with: viewModel.city)
        labelCurentTemp.configure(with: viewModel.currenrTemp)
        labelMaxTemp.configure(with: viewModel.tempMax)
        labelMinTemp.configure(with: viewModel.tempMin)
    }
    
    private func setupUI(){
        addSubview(vStack)
        vStack.addArrangedSubview(labelWind)
        vStack.addArrangedSubview(labelClouds)
        vStack.addArrangedSubview(labelHumidity)
        vStack.axis = .vertical
        vStack.distribution = .fillProportionally
        vStack.spacing = 2
        labelDescription.textAlignment = .center
        labelDescription.font = UIFont.italicSystemFont(ofSize: 40)
        
        addSubview(city)
        addSubview(labelMaxTemp)
        addSubview(labelCurentTemp)
        addSubview(labelMinTemp)
        addSubview(labelDescription)

    }
    
    private func setupConstraints() {
        
        city.translatesAutoresizingMaskIntoConstraints = false
        city.leftAnchor.constraint(equalTo: leftAnchor, constant: 15).isActive = true
        city.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 15).isActive = true
        city.rightAnchor.constraint(equalTo: rightAnchor,constant: -15).isActive = true
        
        labelCurentTemp.translatesAutoresizingMaskIntoConstraints = false
        labelCurentTemp.leftAnchor.constraint(equalTo: leftAnchor,constant: 15).isActive = true
        labelCurentTemp.rightAnchor.constraint(equalTo: rightAnchor, constant: -15).isActive = true
        labelCurentTemp.topAnchor.constraint(equalTo: city.bottomAnchor).isActive = true
        labelCurentTemp.heightAnchor.constraint(equalToConstant: 150).isActive = true

        labelMaxTemp.translatesAutoresizingMaskIntoConstraints = false
        labelMaxTemp.leftAnchor.constraint(equalTo: leftAnchor,constant: 15).isActive = true
        labelMaxTemp.topAnchor.constraint(equalTo: labelCurentTemp.bottomAnchor,constant: 10).isActive = true
        labelMaxTemp.rightAnchor.constraint(equalTo: rightAnchor,constant: -15).isActive = true
        labelMaxTemp.heightAnchor.constraint(equalToConstant: 65).isActive = true

        labelMinTemp.translatesAutoresizingMaskIntoConstraints = false
        labelMinTemp.leftAnchor.constraint(equalTo: leftAnchor,constant: 15).isActive = true
        labelMinTemp.topAnchor.constraint(equalTo: labelMaxTemp.bottomAnchor).isActive = true
        labelMinTemp.rightAnchor.constraint(equalTo: rightAnchor, constant: -15).isActive = true
        labelMinTemp.heightAnchor.constraint(equalToConstant: 65).isActive = true
    
        labelDescription.translatesAutoresizingMaskIntoConstraints = false
        labelDescription.topAnchor.constraint(equalTo: labelMinTemp.bottomAnchor).isActive = true
        labelDescription.leftAnchor.constraint(equalTo: leftAnchor,constant: 15).isActive = true
        labelDescription.rightAnchor.constraint(equalTo: rightAnchor,constant: -15).isActive = true
        labelDescription.heightAnchor.constraint(equalToConstant: 70).isActive = true
        
        vStack.translatesAutoresizingMaskIntoConstraints = false
        vStack.heightAnchor.constraint(equalToConstant: 200).isActive = true
        vStack.topAnchor.constraint(equalTo: labelDescription.bottomAnchor).isActive = true
        vStack.leftAnchor.constraint(equalTo: leftAnchor,constant: 15).isActive = true
        vStack.rightAnchor.constraint(equalTo: rightAnchor,constant: -15).isActive = true
    }
}
