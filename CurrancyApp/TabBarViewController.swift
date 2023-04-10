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
        view.backgroundColor = .black
        tabBar.tintColor = .black
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
               createNavController(for: ViewController(), title: NSLocalizedString("", comment: ""), image: UIImage(systemName: "magnifyingglass")!),
               createNavController(for: ViewController(), title: NSLocalizedString("", comment: ""), image: UIImage.init(named: "currancy_icon")!),
               createNavController(for: ProfileViewController(), title: NSLocalizedString("", comment: ""), image: UIImage(systemName: "person")!),
             
           ]
       }
}
