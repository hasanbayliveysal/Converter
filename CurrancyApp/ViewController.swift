//
//  ViewController.swift
//  CurrancyApp
//
//  Created by Veysal on 09.04.23.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    private lazy var label : UILabel = {
        
        let label = UILabel()
        view.addSubview(label)
        label.text = "Hello"
        label.font = UIFont.systemFont(ofSize: 59, weight: .medium)
        return label
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        
        label.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
    }

    
    
    

}

