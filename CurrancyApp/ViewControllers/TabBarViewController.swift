//
//  TabBarViewController.swift
//  CurrancyApp
//
//  Created by Veysal on 10.04.23.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        tabBar.backgroundColor = .white
       // view.backgroundColor = .black
        tabBar.unselectedItemTintColor = .darkGray
        tabBar.tintColor = .orange
        setupVCs()
     
       
       
    }
    
    fileprivate func createNavController(for rootViewController: UIViewController,
                                                     title: String,
                                                     image: UIImage) -> UIViewController {
           let navController = UINavigationController(rootViewController: rootViewController)
           navController.tabBarItem.title = title
           navController.tabBarItem.image = image
           navController.navigationBar.prefersLargeTitles = true
           rootViewController.navigationItem.title = title
           return navController
       }
    
    func setupVCs() {
           viewControllers = [
               createNavController(for: ViewController(), title: NSLocalizedString("Converter", comment: ""), image: UIImage.init(named: "converter_icon")!),
               createNavController(for: ProfileViewController(), title: NSLocalizedString("Calculator", comment: ""), image: UIImage.init(named: "profile_icon")!),
           ]
       }
}
