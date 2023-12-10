//
//  ErrorView.swift
//  WeatherAston
//
//  Created by Mac on 06.12.2023.
//

import UIKit

final class ErrorView: UIView {
    
    private let textError = UILabel()
    private let buttonError = UIButton()
    
    var onTapReload: (() -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupConstraints()
        setupActions()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI(){
        addSubview(textError)
        addSubview(buttonError)
        textError.text = "Couldn't get the weather"
        textError.textAlignment = .center
        textError.font = UIFont.systemFont(ofSize: 25)
        buttonError.backgroundColor = .blue
        buttonError.layer.cornerRadius = 15
        buttonError.setTitle("RELOAD", for: .normal)
        buttonError.setTitleColor(.systemBackground, for: .normal)
    }
    
    private func setupConstraints(){
        textError.translatesAutoresizingMaskIntoConstraints = false
        textError.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        textError.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        textError.heightAnchor.constraint(equalToConstant: 100).isActive = true
        textError.leftAnchor.constraint(equalTo: leftAnchor,constant: 15).isActive = true
        textError.rightAnchor.constraint(equalTo: rightAnchor, constant: -15).isActive = true
        
        buttonError.translatesAutoresizingMaskIntoConstraints = false
        buttonError.topAnchor.constraint(equalTo: textError.bottomAnchor, constant: 25).isActive = true
        buttonError.heightAnchor.constraint(equalToConstant: 45).isActive = true
        buttonError.leftAnchor.constraint(equalTo: leftAnchor,constant: 75).isActive = true
        buttonError.rightAnchor.constraint(equalTo: rightAnchor, constant: -75).isActive = true
        
    }
    
    private func setupActions() {
        buttonError.addTarget(self, action: #selector(pressErrorButton), for: .touchUpInside)
    }
    
    @objc private func pressErrorButton(){
        onTapReload?()
    }
}
