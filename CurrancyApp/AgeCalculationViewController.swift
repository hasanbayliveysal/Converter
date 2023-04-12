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
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: " ‹ Back", style: .plain, target: nil, action: #selector(goMainVC))
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
    
    
    
    @objc func makeNumbers () {
        let buttonSize : CGFloat = view.frame.size.width/4
        
        let zeroButton = CustomButton(frame: CGRect(x: buttonSize/8, y: view.frame.size.height - buttonSize, width: buttonSize * 1.9, height: buttonSize * 0.9))
        zeroButton.backgroundColor = .darkGray
        zeroButton.setTitle("0", for: .normal)
        self.view.addSubview(zeroButton)
        zeroButton.layer.cornerRadius = buttonSize*0.9/2
        zeroButton.tag = 1
        zeroButton.addTarget(self, action: #selector(numberTapped), for: .touchUpInside)
        
        
        let dotButton = CustomButton(frame: CGRect(x: buttonSize * 2 + buttonSize/8, y: view.frame.size.height - buttonSize, width: buttonSize * 0.9, height: buttonSize * 0.9))
        dotButton.backgroundColor = .darkGray
        dotButton.setTitle(".", for: .normal)
        dotButton.layer.cornerRadius = buttonSize*0.9/2
        self.view.addSubview(dotButton)
        dotButton.addTarget(self, action: #selector(dotBtnTapped), for: .touchUpInside)
        
        
        for x in 0..<3 {
            let button1 = CustomButton(frame: CGRect(x: buttonSize * CGFloat(x) + buttonSize / 8, y: view.frame.size.height - (buttonSize * 2), width: buttonSize * 0.9, height: buttonSize * 0.9))
            button1.backgroundColor = .darkGray
            button1.setTitle("\(x+1)", for: .normal)
            button1.layer.cornerRadius = buttonSize*0.9/2
            self.view.addSubview(button1)
            button1.tag = x + 2
            button1.addTarget(self, action: #selector(numberTapped), for: .touchUpInside)
        }
        for x in 0..<3 {
            let button2 = CustomButton(frame: CGRect(x: buttonSize * CGFloat(x) + buttonSize / 8 , y: view.frame.size.height - (buttonSize * 3), width: buttonSize * 0.9, height: buttonSize * 0.9))
            button2.backgroundColor = .darkGray
            button2.setTitle("\(x+4)", for: .normal)
            button2.layer.cornerRadius = buttonSize*0.9/2
            self.view.addSubview(button2)
            button2.tag = x + 5
            button2.addTarget(self, action: #selector(numberTapped), for: .touchUpInside)
        }
        for x in 0..<3 {
            let button3 = CustomButton(frame: CGRect(x: buttonSize * CGFloat(x) + buttonSize / 8 , y: view.frame.size.height - (buttonSize * 4), width: buttonSize * 0.9, height: buttonSize * 0.9))
            button3.backgroundColor = .darkGray
            button3.setTitle("\(x+7)", for: .normal)
            button3.layer.cornerRadius = buttonSize*0.9/2
            self.view.addSubview(button3)
            button3.tag = x + 8
            button3.addTarget(self, action: #selector(numberTapped), for: .touchUpInside)
        }
        
        let deleteBtn = CustomButton(frame: CGRect(x: buttonSize * 3 + buttonSize / 8, y: view.frame.size.height - buttonSize * 2 , width: (buttonSize/2)*1.5, height: buttonSize * 1.9))
        deleteBtn.backgroundColor = .orange
        deleteBtn.setTitle("⌫", for: .normal)
        deleteBtn.titleLabel?.font = UIFont.systemFont(ofSize: 24)
        deleteBtn.layer.cornerRadius = (buttonSize/4)*1.5
        self.view.addSubview(deleteBtn)
        deleteBtn.addTarget(self, action: #selector(deleteBtnTapped), for: .touchUpInside)
        
        let clearAllButton = CustomButton(frame: CGRect(x: buttonSize * 3 + buttonSize / 8, y: view.frame.size.height - buttonSize * 4, width: (buttonSize/2)*1.5 , height: buttonSize * 1.9))
        clearAllButton.backgroundColor = .orange
        clearAllButton.setTitle("AC", for: .normal)
        clearAllButton.layer.cornerRadius = (buttonSize/4)*1.5
        self.view.addSubview(clearAllButton)
        clearAllButton.addTarget(self, action: #selector(clearAllBtnTapped), for: .touchUpInside)
        
        
    }
    
    @objc func numberTapped(_ sender: CustomButton) {
        
    }
    
    @objc func clearAllBtnTapped(_ sender : CustomButton) {
        
    }
    
    @objc func dotBtnTapped(_ sender: CustomButton) {
       // var isEnabled = sender.isEnabled
    }
    
    @objc func deleteBtnTapped(_ sender: CustomButton) {
       
    }
    
    
    
    
}
    

