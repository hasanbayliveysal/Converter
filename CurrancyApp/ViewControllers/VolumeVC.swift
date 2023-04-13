//
//  VolumeVC.swift
//  CurrancyApp
//
//  Created by Veysal on 10.04.23.
//

import UIKit

class VolumeVC: UIViewController {
    var title_ = ""
    var data: CustomData? {
        didSet {
            guard let data = data else { return }
            title_ = data.title
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor  = .black
        self.navigationItem.title = "Volume"
        makeNumbers()
        createCancelButton()
    }
    

    
}
