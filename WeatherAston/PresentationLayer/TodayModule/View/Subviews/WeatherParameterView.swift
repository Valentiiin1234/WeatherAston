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
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        iconLabel.textAlignment = .right
        titleLabel.textAlignment = .left
        addSubview(iconLabel)
        addSubview(titleLabel)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints(){
    
        iconLabel.translatesAutoresizingMaskIntoConstraints = false
        iconLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        iconLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        iconLabel.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        iconLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: centerXAnchor).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        
    }
}
