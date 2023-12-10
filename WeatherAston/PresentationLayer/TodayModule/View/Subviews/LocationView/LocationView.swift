//
//  LocationView.swift
//  WeatherAston
//
//  Created by Mac on 07.12.2023.
//

import UIKit

struct LocationViewParamViewModel {
    let cityName: String
}

final class LocationView: UIView {
    
    private let iconLocation = UIImageView()
    private let city = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configure(with viewModel: LocationViewParamViewModel){
        self.city.text = viewModel.cityName
    }
    
    private func setupUI(){
        addSubview(iconLocation)
        addSubview(city)
        iconLocation.image = UIImage(systemName: "location.fill")
        city.font = UIFont.boldSystemFont(ofSize: 30)
    }
    
    private func setupConstraints(){
        iconLocation.translatesAutoresizingMaskIntoConstraints = false
        iconLocation.widthAnchor.constraint(equalToConstant: 50).isActive = translatesAutoresizingMaskIntoConstraints
        iconLocation.heightAnchor.constraint(equalTo: iconLocation.widthAnchor, multiplier: 1 / 1).isActive = true
        iconLocation.topAnchor.constraint(equalTo: topAnchor).isActive = true
        iconLocation.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        iconLocation.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        city.translatesAutoresizingMaskIntoConstraints = false
        city.heightAnchor.constraint(equalTo: iconLocation.heightAnchor).isActive = true
        city.leftAnchor.constraint(equalTo: iconLocation.rightAnchor, constant: 5).isActive = true
        city.topAnchor.constraint(equalTo: topAnchor).isActive = true
        city.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        city.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
    }
    
}
