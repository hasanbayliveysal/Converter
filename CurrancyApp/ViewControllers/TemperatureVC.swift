//
//  TemperatureVC.swift
//  CurrancyApp
//
//  Created by Veysal on 10.04.23.
//

import UIKit

class TemperatureVC: UIViewController {


    
    var firstButtonTapped = true
    
    private lazy var firstButton : UIButton = {
        let button = UIButton()
        self.view.addSubview(button)
        button.setTitle("m  ▼", for: .normal)
        button.addTarget(self, action: #selector(onTapFirstButton), for: .touchUpInside)
        return button
    }()
    
    private lazy var secondButton : UIButton = {
        let button = UIButton()
        self.view.addSubview(button)
        button.setTitle("m  ▼", for: .normal)
        button.addTarget(self, action: #selector(onTapSecondButton), for: .touchUpInside)
        return button
    }()

    private lazy var firstLabel : UILabel = {
        let label = UILabel()
        self.view.addSubview(label)
        label.text = "0"
        label.textColor = .orange
        label.font = UIFont.systemFont(ofSize: 24, weight: .regular)
        return label
    }()
    
    private lazy var secondLabel : UILabel = {
        let label = UILabel()
        self.view.addSubview(label)
        label.text = "0"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 24, weight: .regular)
        return label
    }()
    
    
    private lazy var thirdLabel : UILabel = {
        let label = UILabel()
        self.view.addSubview(label)
        label.text = "meter"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 12, weight: .thin)
        return label
    }()
    
    private lazy var fourthLabel : UILabel = {
        let label = UILabel()
        self.view.addSubview(label)
        label.text = "meter"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 12, weight: .thin)
        return label
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor  = .black
        self.navigationItem.title = "Temperature"
        makeNumbers()
        createCancelButton()
      
        
        let buttonSize = view.frame.size.width/5
        firstButton.snp.makeConstraints { make in
            make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left)
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
            make.height.width.equalTo(buttonSize)
        }
        secondButton.snp.makeConstraints { make in
            make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left)
            make.top.equalTo(self.firstButton.snp.bottom).offset(buttonSize/2)
            make.height.width.equalTo(buttonSize)
        }
        
        firstLabel.snp.makeConstraints { make in
            make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right).offset(-buttonSize/8)
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(buttonSize/2)
        
        }
        secondLabel.snp.makeConstraints { make in
            make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right).offset(-buttonSize/8)
            make.top.equalTo(self.firstLabel.snp.bottom).offset(buttonSize)
         
        }
        thirdLabel.snp.makeConstraints { make in
            make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right).offset(-buttonSize/8)
            make.top.equalTo(self.firstLabel.safeAreaLayoutGuide.snp.bottom)
     
        }
        fourthLabel.snp.makeConstraints { make in
            make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right).offset(-buttonSize/8)
            make.top.equalTo(self.secondLabel.snp.bottom)
       
        }
    }
    
    
    

    @objc func onTapFirstButton() {
        firstButtonTapped = true
        makeAlert()
     
    }
    
    @objc func  onTapSecondButton() {
        firstButtonTapped = false
        makeAlert()
    }
    
    
    func makeAlert() {
        let alert = UIAlertController(title: "Select Unit", message: nil, preferredStyle: .actionSheet)
        let km = UIAlertAction(title: "Kilometer km", style: .default) {_ in
            
            if self.firstButtonTapped {
                self.thirdLabel.text = "kilometer"
                self.firstButton.setTitle("km  ▼", for: .normal)
            } else {
                self.fourthLabel.text = "kilometer"
                self.secondButton.setTitle("km  ▼", for: .normal)
            }
            self.operation()
        }
        let m = UIAlertAction(title: "Meter m", style: .default) {_ in
           
            if self.firstButtonTapped {
                self.thirdLabel.text = "meter"
                self.firstButton.setTitle("m  ▼", for: .normal)
            } else {
                self.fourthLabel.text = "meter"
                self.secondButton.setTitle("m  ▼", for: .normal)
            }
            self.operation()
        }
        let dm = UIAlertAction(title: "Desimeter dm", style: .default){_ in
            self.operation()
            if self.firstButtonTapped {
                self.thirdLabel.text = "desimeter"
                self.firstButton.setTitle("dm  ▼", for: .normal)
            } else {
                self.fourthLabel.text = "desimeter"
                self.secondButton.setTitle("dm  ▼", for: .normal)
            }
            self.operation()
        }
        let sm = UIAlertAction(title: "Santimeter sm", style: .default){_ in
            self.operation()
            if self.firstButtonTapped {
                self.thirdLabel.text = "santimeter"
                self.firstButton.setTitle("sm  ▼", for: .normal)
            } else {
                self.fourthLabel.text = "santimeter"
                self.secondButton.setTitle("sm  ▼", for: .normal)
            }
            self.operation()
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
        alert.addAction(km)
        alert.addAction(m)
        alert.addAction(dm)
        alert.addAction(sm)
        alert.addAction(cancel)
        self.present(alert, animated: true)
        
    }
    
   
    var dotBtnTap = true
    
    override func numberTapped(_ sender: CustomButton) {
        
        
        sender.animation(sender, .darkGray)
        let tag = sender.tag - 1
        
        if firstLabel.text == "0" {
            firstLabel.text = "\(tag)"
        } else
        if let text = firstLabel.text {
            firstLabel.text = "\(text)\(tag)"
        }
        operation()
        
    }
    
    override func clearAllBtnTapped(_  sender: CustomButton) {
       
        sender.animation(sender, .orange)
        firstLabel.text = "0"
        secondLabel.text = "0"
       
        
    }
    
    override func deleteBtnTapped(_ sender: CustomButton) {
        sender.animation(sender, .orange)
        if firstLabel.text != "0" {
            if firstLabel.text?.count == 1 {
                firstLabel.text = "0"
            } else {
                firstLabel.text?.remove(at:  firstLabel.text!.index(before: firstLabel.text!.endIndex))
            }
          
        }
        
       operation()
    }
    
    override func dotBtnTapped(_ sender: CustomButton) {
      
        sender.animation(sender, .darkGray)
        if let text =  firstLabel.text {
            if !firstLabel.text!.isSymbol {
                firstLabel.text = "\(text)."
               
              
            } else {
                firstLabel.text = "\(text)"
            }
            
        }
       
        operation()
    }
    
    func operation() {
        if thirdLabel.text == "meter" {
            if fourthLabel.text == "meter" {
                secondLabel.text = firstLabel.text
            } else if fourthLabel.text == "kilometer" {
                secondLabel.text = "\(Double(firstLabel.text!)!/1000)"
            } else if fourthLabel.text == "desimeter" {
                secondLabel.text = "\(Double(firstLabel.text!)!*10)"
            } else if fourthLabel.text == "santimeter" {
                secondLabel.text = "\(Double(firstLabel.text!)!*100)"
            }
            
        }else if thirdLabel.text == "kilometer" {
            if fourthLabel.text == "kilometer" {
                secondLabel.text = firstLabel.text
            } else if fourthLabel.text == "meter" {
                secondLabel.text = "\(Double(firstLabel.text!)!*1000)"
            } else if fourthLabel.text == "desimeter" {
                secondLabel.text = "\(Double(firstLabel.text!)!*10000)"
            } else if fourthLabel.text == "santimeter" {
                secondLabel.text = "\(Double(firstLabel.text!)!*100000)"
            }
            
        }
        else if thirdLabel.text == "desimeter" {
            if fourthLabel.text == "desimeter" {
                secondLabel.text = firstLabel.text
            } else if fourthLabel.text == "meter" {
                secondLabel.text = "\(Double(firstLabel.text!)!/10)"
            } else if fourthLabel.text == "kilometer" {
                secondLabel.text = "\(Double(firstLabel.text!)!/10000)"
            } else if fourthLabel.text == "santimeter" {
                secondLabel.text = "\(Double(firstLabel.text!)!*10)"
            }
            
        }else if thirdLabel.text == "santimeter" {
            if fourthLabel.text == "santimeter" {
                secondLabel.text = firstLabel.text
            } else if fourthLabel.text == "meter" {
                secondLabel.text = "\(Double(firstLabel.text!)!/100)"
            } else if fourthLabel.text == "desimeter" {
                secondLabel.text = "\(Double(firstLabel.text!)!/10)"
            } else if fourthLabel.text == "kilometer" {
                secondLabel.text = "\(Double(firstLabel.text!)!/100000)"
            }
            
        }
        
        if (Double(secondLabel.text!)!.truncatingRemainder(dividingBy: 1) == 0) {
            secondLabel.text = "\(Int(Double(secondLabel.text!)!))"
        }
    }
    
   


}
