//
//  WeatherParameterView.swift
//  WeatherAston
//
//  Created by Mac on 05.12.2023.
//

import UIKit

struct WeatherParameterViewModel{
    
    let parameter: String
    let title: String
}


final class WeatherParameterView: UIView {
    
    private let parameterLabel = UILabel()
    private let titleLabel = UILabel()
    private let hStack = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupConstraints()
    }
    
    func configure(with viewModel: WeatherParameterViewModel) {
        
        parameterLabel.text = viewModel.parameter
        titleLabel.text = viewModel.title
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupUI() {
        parameterLabel.textAlignment = .center
        titleLabel.textAlignment = .center
        addSubview(hStack)
        hStack.addArrangedSubview(parameterLabel)
        hStack.addArrangedSubview(titleLabel)
        hStack.axis = .horizontal
        hStack.distribution = .fillEqually
        layer.cornerRadius = 10
        layer.borderWidth = 3
        layer.borderColor = UIColor.systemCyan.cgColor
        parameterLabel.font = UIFont.systemFont(ofSize: 28)
        titleLabel.font = UIFont.systemFont(ofSize: 28)
    }
    private func setupConstraints(){

        hStack.translatesAutoresizingMaskIntoConstraints = false
        hStack.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        hStack.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        hStack.heightAnchor.constraint(equalToConstant: 50).isActive = true
        hStack.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        hStack.rightAnchor.constraint(equalTo: rightAnchor).isActive = true

    }
}
