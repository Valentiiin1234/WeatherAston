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
        let todayVC = TodayModuleAssembly.buildModule()
        let nav1 = UINavigationController(rootViewController: todayVC)
        nav1.tabBarItem = UITabBarItem(title: "Today", image: UIImage(systemName: "sun.max.fill"), tag: 1)
        
        nav1.navigationBar.prefersLargeTitles = true
        
        let favoritesVC = FavoritesModuleAssembly.buildModule()
        let nav2 = UINavigationController(rootViewController: favoritesVC)
        nav2.tabBarItem = UITabBarItem(title: "Favorites", image: UIImage(systemName: "heart.fill"), tag: 2)
        nav2.navigationBar.prefersLargeTitles = true

        setViewControllers([nav1, nav2], animated: true)
    }
}
