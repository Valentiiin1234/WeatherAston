//
//  CityCell.swift
//  WeatherAston
//
//  Created by Mac on 27.11.2023.
//

import Foundation
import UIKit
class CityCell: UICollectionViewCell {
    static let cellIdentifier = "CityCell"
    
    private var labelTemp = UILabel()
    private var labelCity = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func congifure(with city: EntityCity) {
        self.labelCity.text = city.name
       
    }
    
    private func setupUI(){
        contentView.addSubview(labelTemp)
        contentView.addSubview(labelCity)
        layer.borderColor = UIColor.systemCyan.cgColor 
        layer.cornerRadius = 20
        layer.borderWidth = 5
        layer.masksToBounds = true
        labelCity.textAlignment = .center
        labelTemp.textAlignment = .center
        labelCity.font = .boldSystemFont(ofSize: 18)
        labelTemp.font = .boldSystemFont(ofSize: 15)
        labelCity.clipsToBounds = true
    }
    
    private func setupConstraints(){
        let sizeHeight = contentView.frame.height / 2
        labelCity.translatesAutoresizingMaskIntoConstraints = false
        labelCity.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        labelCity.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        labelCity.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        labelCity.heightAnchor.constraint(equalToConstant: sizeHeight + 10).isActive = true
        
        labelTemp.translatesAutoresizingMaskIntoConstraints = false
        labelTemp.topAnchor.constraint(equalTo: labelCity.bottomAnchor).isActive = true
        labelTemp.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        labelTemp.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        labelTemp.heightAnchor.constraint(equalToConstant: sizeHeight - 10).isActive = true
    }
    
    
}
