//
//  TabBarFactory.swift
//  WeatherAston
//
//  Created by Mac on 04.12.2023.
//

import UIKit

struct TabBarFactory {
    enum TabBar {
        case today
        case favorites
    }
    
    func makeTabBar(_ tab: TabBar) -> UIViewController {
        switch tab {
        case .today:
            let controller = TodayModuleAssembly.buildModule()
            let navBar = UINavigationController(rootViewController: controller)
            navBar.tabBarItem = UITabBarItem(title: "Today", image: UIImage(systemName: "sun.max.fill"), tag: 1)
            navBar.navigationBar.prefersLargeTitles = true
            return navBar
        case .favorites:
            let controller = FavoritesModuleAssembly.buildModule()
            let navBar = UINavigationController(rootViewController: controller)
            navBar.tabBarItem = UITabBarItem(title: "Favorites", image: UIImage(systemName: "heart.fill"), tag: 2)
            navBar.navigationBar.prefersLargeTitles = true
            return navBar
        }
    }
}
