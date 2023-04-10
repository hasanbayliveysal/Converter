//
//  AgeCalculationViewController.swift
//  CurrancyApp
//
//  Created by Veysal on 10.04.23.
//

import UIKit

class AgeCalculationViewController: UIViewController {
    

    var data : CustomData? {
        didSet {
            guard let data = data else {return}
            navigationItem.title = data.title
        }
    }
   

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor  = .white
      //  self.navigationItem.title = "Age Calculation"
        let font = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 32, weight: .medium)]
        let clr = [NSAttributedString.Key.foregroundColor: UIColor.red]
        navigationController?.navigationBar.titleTextAttributes = clr
      //  navigationController?.navigationBar.titleTextAttributes = font
    }
    
    

}
