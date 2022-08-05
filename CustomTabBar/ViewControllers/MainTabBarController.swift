//
//  ViewController.swift
//  CustomTabBar
//
//  Created by Felix Titov on 8/6/22.
//  Copyright © 2022 by Felix Titov. All rights reserved.
//


import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        generateTabBar()
        setTabBarAppearance()
    }

    private func generateTabBar() {
        viewControllers = [
            generateVC(HomeViewController(), title: "Home", image: UIImage(systemName: "house.fill")),
            generateVC(PersonViewController(), title: "Personal info", image: UIImage(systemName: "person.fill")),
            generateVC(SettingsViewController(), title: "Settings", image: UIImage(systemName: "slider.horizontal.3"))
        ]
    }
    
    private func generateVC(_ viewController: UIViewController,
                            title: String,
                            image: UIImage?
    ) -> UIViewController {
        viewController.tabBarItem.title = title
        viewController.tabBarItem.image = image
        return viewController
    }
    
    private func setTabBarAppearance() {
        let xPosition: CGFloat = 10
        let yPosition: CGFloat = 14
        
        let width = tabBar.bounds.width - xPosition * 2
        let height = tabBar.bounds.height + yPosition * 2
        
        let roundLayer = CAShapeLayer()
        let bezierPath = UIBezierPath(
            roundedRect: CGRect(x: xPosition, y: tabBar.bounds.minY - yPosition, width: width, height: height),
            cornerRadius: height / 2)
        
        roundLayer.path = bezierPath.cgPath
        
        tabBar.layer.insertSublayer(roundLayer, at: 0)
        tabBar.itemWidth = width / 2
        tabBar.itemPositioning = .centered
        
        roundLayer.fillColor = UIColor.mainWhite.cgColor
        
        setupColors()
        
    }
    
    private func setupColors() {
        
        
        tabBar.tintColor = .tabBarItemAccent
        tabBar.unselectedItemTintColor = .tabBarItemLight
    }
}


