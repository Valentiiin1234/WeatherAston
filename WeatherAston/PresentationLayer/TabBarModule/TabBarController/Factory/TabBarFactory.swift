//
//  TabBarFactory.swift
//  WeatherAston
//
//  Created by Mac on 04.12.2023.
//

import UIKit

struct TabBarFactory {
    enum TabBar {
        case forecast
        case cities
    }
    
    func makeTabBar(_ tab: TabBar) -> UIViewController {
        switch tab {
        case .forecast:
            let controller = TodayModuleAssembly.buildModule()
            let navBar = UINavigationController(rootViewController: controller)
            navBar.tabBarItem = UITabBarItem(title: "Forecast", image: UIImage(systemName: "sun.max.fill"), tag: 1)
            navBar.navigationBar.prefersLargeTitles = true
            return navBar
        case .cities:
            let controller = FavoritesModuleAssembly.buildModule()
            let navBar = UINavigationController(rootViewController: controller)
            navBar.tabBarItem = UITabBarItem(title: "Cities", image: UIImage(systemName: "book.fill"), tag: 2)
            navBar.navigationBar.prefersLargeTitles = true
            return navBar
        }
    }
}
