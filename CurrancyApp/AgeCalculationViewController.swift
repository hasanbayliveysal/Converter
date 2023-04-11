//
//  AgeCalculationViewController.swift
//  CurrancyApp
//
//  Created by Veysal on 10.04.23.
//

import UIKit

class AgeCalculationViewController: UIViewController {
    


    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor  = .black
        self.navigationItem.title = "Age Calculation"
        makeNumbers()
        createCancelButton()
    }

    
}

extension UIViewController {
    
    func createCancelButton() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "< Back", style: .plain, target: nil, action: #selector(goMainVC))
        let clr = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = clr
        self.navigationController?.navigationItem.hidesBackButton = false
    }
    
    @objc func goMainVC() {
        let vc = UINavigationController(rootViewController: TabBarViewController())
        vc.modalPresentationStyle = .fullScreen // if you want to present it in full screen mode
        vc.modalTransitionStyle = .crossDissolve
        self.present(vc, animated: true, completion: nil)
    }
    
    public func makeNumbers () {
        let buttonSize : CGFloat = view.frame.size.width/4
        
        let zeroButton = UIButton(frame: CGRect(x: buttonSize/8, y: view.frame.size.height - buttonSize, width: buttonSize * 1.9, height: buttonSize * 0.9))
        zeroButton.backgroundColor = .darkGray
        zeroButton.setTitle("0", for: .normal)
        self.view.addSubview(zeroButton)
        zeroButton.layer.cornerRadius = buttonSize*0.9/2
        
        let dotButton = UIButton(frame: CGRect(x: buttonSize * 2 + buttonSize/8, y: view.frame.size.height - buttonSize, width: buttonSize * 0.9, height: buttonSize * 0.9))
        dotButton.backgroundColor = .darkGray
        dotButton.setTitle(",", for: .normal)
        dotButton.layer.cornerRadius = buttonSize*0.9/2
        self.view.addSubview(dotButton)
        
        for x in 0..<3 {
            let button1 = UIButton(frame: CGRect(x: buttonSize * CGFloat(x) + buttonSize / 8, y: view.frame.size.height - (buttonSize * 2), width: buttonSize * 0.9, height: buttonSize * 0.9))
            button1.backgroundColor = .darkGray
            button1.setTitle("\(x+1)", for: .normal)
            button1.layer.cornerRadius = buttonSize*0.9/2
            self.view.addSubview(button1)
        }
        for x in 0..<3 {
            let button2 = UIButton(frame: CGRect(x: buttonSize * CGFloat(x) + buttonSize / 8 , y: view.frame.size.height - (buttonSize * 3), width: buttonSize * 0.9, height: buttonSize * 0.9))
            button2.backgroundColor = .darkGray
            button2.setTitle("\(x+4)", for: .normal)
            button2.layer.cornerRadius = buttonSize*0.9/2
            self.view.addSubview(button2)
        }
        for x in 0..<3 {
            let button3 = UIButton(frame: CGRect(x: buttonSize * CGFloat(x) + buttonSize / 8 , y: view.frame.size.height - (buttonSize * 4), width: buttonSize * 0.9, height: buttonSize * 0.9))
            button3.backgroundColor = .darkGray
            button3.setTitle("\(x+7)", for: .normal)
            button3.layer.cornerRadius = buttonSize*0.9/2
            self.view.addSubview(button3)
        }
        
        let deleteButton = UIButton(frame: CGRect(x: buttonSize * 3 + buttonSize / 8, y: view.frame.size.height - buttonSize * 2 , width: (buttonSize/2)*1.5, height: buttonSize * 1.9))
        deleteButton.backgroundColor = .orange
        deleteButton.setTitle("x", for: .normal)
        deleteButton.layer.cornerRadius = (buttonSize/4)*1.5
        self.view.addSubview(deleteButton)
        
        let clearAllButton = UIButton(frame: CGRect(x: buttonSize * 3 + buttonSize / 8, y: view.frame.size.height - buttonSize * 4, width: (buttonSize/2)*1.5 , height: buttonSize * 1.9))
        clearAllButton.backgroundColor = .orange
        clearAllButton.setTitle("AC", for: .normal)
        clearAllButton.layer.cornerRadius = (buttonSize/4)*1.5
        self.view.addSubview(clearAllButton)
        
    }
    

    
}
    

