//
//  WeatherTabBarViewController.swift
//  WeatherAston
//
//  Created by Mac on 03.11.2023.
//

import UIKit

final class WeatherTabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    //MARK: - setupUI
    private func setupUI(){
        let factory = TabBarFactory()
        let tabs = [factory.makeTabBar(.forecast), factory.makeTabBar(.cities)]
        setViewControllers(tabs, animated: false)
    }
}


