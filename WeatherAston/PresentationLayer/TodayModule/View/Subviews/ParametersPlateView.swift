//
//  ParametersPlateView.swift
//  WeatherAston
//
//  Created by Mac on 05.12.2023.
//

import UIKit

final class ParametersPlateView: UIView {
    private let labelWind = WeatherParameterView()
    private let labelClouds = WeatherParameterView()
    private let labelHumidity = WeatherParameterView()
    private let vStack = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupUI()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI(){
        addSubview(vStack)
        vStack.addArrangedSubview(labelWind)
        vStack.addArrangedSubview(labelClouds)
        vStack.addArrangedSubview(labelHumidity)
        vStack.axis = .vertical
        vStack.distribution = .fillProportionally
    }
    
    private func setupConstraints() {
        vStack.translatesAutoresizingMaskIntoConstraints = false
        vStack.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        vStack.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
       
    }
}
