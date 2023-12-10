//
//  ElementTempView.swift
//  WeatherAston
//
//  Created by Mac on 07.12.2023.
//

import UIKit
struct ElementTempViewModel{
    let textLabel: String
    let tempValue: String
}

final class ElementTempView: UIView {
    private let textTemp = UILabel()
    private let tempValue = UILabel()
    private let hStack = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with viewModel: ElementTempViewModel){
        self.textTemp.text = viewModel.textLabel
        self.tempValue.text = viewModel.tempValue
    }
    
    private func setupUI(){
        hStack.addArrangedSubview(textTemp)
        hStack.addArrangedSubview(tempValue)

        tempValue.textAlignment = .left
        tempValue.font = UIFont.boldSystemFont(ofSize: 40)
        
        textTemp.font = UIFont.boldSystemFont(ofSize: 23)
        addSubview(hStack)
        hStack.distribution = .fillEqually
        hStack.axis = .horizontal
        hStack.spacing = 15
        
    }
    private func setupConstraints(){
        hStack.translatesAutoresizingMaskIntoConstraints = false
        hStack.topAnchor.constraint(equalTo: topAnchor).isActive = true
        hStack.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        hStack.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        hStack.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
    
    }
}
