//
//  TimeVC.swift
//  CurrancyApp
//
//  Created by Veysal on 10.04.23.
//

import UIKit

class TimeVC: UIViewController {

    var firstButtonTapped = true
    
    private lazy var firstButton : UIButton = {
        let button = UIButton()
        self.view.addSubview(button)
        button.setTitle("h  ▼", for: .normal)
        button.addTarget(self, action: #selector(onTapFirstButton), for: .touchUpInside)
        return button
    }()
    
    private lazy var secondButton : UIButton = {
        let button = UIButton()
        self.view.addSubview(button)
        button.setTitle("h  ▼", for: .normal)
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
        label.text = "hour"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 12, weight: .thin)
        return label
    }()
    
    private lazy var fourthLabel : UILabel = {
        let label = UILabel()
        self.view.addSubview(label)
        label.text = "hour"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 12, weight: .thin)
        return label
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor  = .black
        self.navigationItem.title = "Time"
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
        let day = UIAlertAction(title: "Day d", style: .default) {_ in
            
            if self.firstButtonTapped {
                self.thirdLabel.text = "day"
                self.firstButton.setTitle("d  ▼", for: .normal)
            } else {
                self.fourthLabel.text = "day"
                self.secondButton.setTitle("d  ▼", for: .normal)
            }
            self.operation()
        }
        let h = UIAlertAction(title: "Hour h", style: .default) {_ in
           
            if self.firstButtonTapped {
                self.thirdLabel.text = "hour"
                self.firstButton.setTitle("h  ▼", for: .normal)
            } else {
                self.fourthLabel.text = "hour"
                self.secondButton.setTitle("h  ▼", for: .normal)
            }
            self.operation()
        }
        let m = UIAlertAction(title: "Minute m", style: .default){_ in
            self.operation()
            if self.firstButtonTapped {
                self.thirdLabel.text = "minute"
                self.firstButton.setTitle("m  ▼", for: .normal)
            } else {
                self.fourthLabel.text = "minute"
                self.secondButton.setTitle("m  ▼", for: .normal)
            }
            self.operation()
        }
        let s = UIAlertAction(title: "Second s", style: .default){_ in
            self.operation()
            if self.firstButtonTapped {
                self.thirdLabel.text = "second"
                self.firstButton.setTitle("s  ▼", for: .normal)
            } else {
                self.fourthLabel.text = "second"
                self.secondButton.setTitle("s  ▼", for: .normal)
            }
            self.operation()
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
        alert.addAction(day)
        alert.addAction(h)
        alert.addAction(m)
        alert.addAction(s)
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
        if thirdLabel.text == "hour" {
            if fourthLabel.text == "hour" {
                secondLabel.text = firstLabel.text
            } else if fourthLabel.text == "day" {
                secondLabel.text = "\(Double(firstLabel.text!)!/24)"
            } else if fourthLabel.text == "minute" {
                secondLabel.text = "\(Double(firstLabel.text!)!*60)"
            } else if fourthLabel.text == "second" {
                secondLabel.text = "\(Double(firstLabel.text!)!*3600)"
            }
            
        }else if thirdLabel.text == "day" {
            if fourthLabel.text == "day" {
                secondLabel.text = firstLabel.text
            } else if fourthLabel.text == "hour" {
                secondLabel.text = "\(Double(firstLabel.text!)!*24)"
            } else if fourthLabel.text == "minute" {
                secondLabel.text = "\(Double(firstLabel.text!)!*24*60)"
            } else if fourthLabel.text == "second" {
                secondLabel.text = "\(Double(firstLabel.text!)!*24*3600)"
            }
            
        }
        else if thirdLabel.text == "minute" {
            if fourthLabel.text == "minute" {
                secondLabel.text = firstLabel.text
            } else if fourthLabel.text == "hour" {
                secondLabel.text = "\(Double(firstLabel.text!)!/60)"
            } else if fourthLabel.text == "day" {
                secondLabel.text = "\(Double(firstLabel.text!)!/(24*60))"
            } else if fourthLabel.text == "second" {
                secondLabel.text = "\(Double(firstLabel.text!)!*60)"
            }
            
        }else if thirdLabel.text == "second" {
            if fourthLabel.text == "second" {
                secondLabel.text = firstLabel.text
            } else if fourthLabel.text == "hour" {
                secondLabel.text = "\(Double(firstLabel.text!)!/3600)"
            } else if fourthLabel.text == "minute" {
                secondLabel.text = "\(Double(firstLabel.text!)!/60)"
            } else if fourthLabel.text == "day" {
                secondLabel.text = "\(Double(firstLabel.text!)!/(24*3600))"
            }
            
        }
        
        if (Double(secondLabel.text!)!.truncatingRemainder(dividingBy: 1) == 0) {
            secondLabel.text = "\(Int(Double(secondLabel.text!)!))"
        }
    }
    
   

}
