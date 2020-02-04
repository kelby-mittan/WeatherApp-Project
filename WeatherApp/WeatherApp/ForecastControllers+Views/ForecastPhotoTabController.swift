//
//  ForecastPhotoTabController.swift
//  WeatherApp
//
//  Created by Kelby Mittan on 1/31/20.
//  Copyright © 2020 David Rifkin. All rights reserved.
//

import UIKit
import DataPersistence

class ForecastPhotoTabController: UITabBarController {
    
    public var persistence = DataPersistence<PixImage>(filename: "images.plist")
    
    public lazy var forecastVC: UINavigationController = {
        let viewController = UINavigationController(rootViewController: ForecastController())
        viewController.tabBarItem = UITabBarItem(title: "Weather", image: UIImage(systemName: "cloud.sun.rain.fill"), tag: 0)
        return viewController
    }()
    
    public lazy var pixabayCollectionVC: PixabayCollectionController = {
        let viewController = PixabayCollectionController()
        viewController.tabBarItem = UITabBarItem(title: "Favorites", image: UIImage(systemName: "star.fill"), tag: 1)
        viewController.tabBarController?.tabBar.backgroundColor = .black
        return viewController
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //        let forecastVC = UINavigationController(rootViewController: ForecastController())
        //        forecastVC.tabBarItem = UITabBarItem(title: "Weather", image: UIImage(systemName: "cloud.sun.rain.fill"), tag: 0)
        //
        //        let pixController = PixabayCollectionController()
        //        pixController.tabBarItem = UITabBarItem(title: "Favorites", image: UIImage(systemName: "star.fill"), tag: 1)
        
        //        self.tabBarController?.tabBar.backgroundColor = .black
        
        
        pixabayCollectionVC.dataPersistence = persistence
        viewControllers = [forecastVC, pixabayCollectionVC]
        
    }
    
    
    
    
}
