//
//  WeatherParameterView.swift
//  WeatherAston
//
//  Created by Mac on 05.12.2023.
//

import UIKit

final class WeatherParameterView: UIView {
    
    private let iconLabel = UILabel()
    private let titleLabel = UILabel()
    private let hStack = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupUI()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        iconLabel.textAlignment = .right
        titleLabel.textAlignment = .left
        addSubview(hStack)
        hStack.addArrangedSubview(iconLabel)
        hStack.addArrangedSubview(titleLabel)
        hStack.axis = .horizontal
        hStack.distribution = .fillProportionally
        setupConstraints()
    }
    private func setupConstraints(){
        
        hStack.translatesAutoresizingMaskIntoConstraints = false
        hStack.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        hStack.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        hStack.heightAnchor.constraint(equalToConstant: 100).isActive = true
    
    }
}
