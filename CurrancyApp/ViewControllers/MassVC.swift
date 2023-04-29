//
//  MassVC.swift
//  CurrancyApp
//
//  Created by Veysal on 10.04.23.
//

import UIKit

class MassVC: UIViewController {
   
    var firstButtonTapped = true
    
    private lazy var firstButton : UIButton = {
        let button = UIButton()
        self.view.addSubview(button)
        button.setTitle("kg  ▼", for: .normal)
        button.addTarget(self, action: #selector(onTapFirstButton), for: .touchUpInside)
        return button
    }()
    
    private lazy var secondButton : UIButton = {
        let button = UIButton()
        self.view.addSubview(button)
        button.setTitle("kg  ▼", for: .normal)
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
        label.text = "kilogram"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 12, weight: .thin)
        return label
    }()
    
    private lazy var fourthLabel : UILabel = {
        let label = UILabel()
        self.view.addSubview(label)
        label.text = "kilogram"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 12, weight: .thin)
        return label
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor  = .black
        self.navigationItem.title = "Mass"
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
        let tone = UIAlertAction(title: "Tone t", style: .default) {_ in
            
            if self.firstButtonTapped {
                self.thirdLabel.text = "tone"
                self.firstButton.setTitle("t  ▼", for: .normal)
            } else {
                self.fourthLabel.text = "tone"
                self.secondButton.setTitle("t  ▼", for: .normal)
            }
            self.operation()
        }
        let kg = UIAlertAction(title: "Kilogram k", style: .default) {_ in
           
            if self.firstButtonTapped {
                self.thirdLabel.text = "kilogram"
                self.firstButton.setTitle("kg  ▼", for: .normal)
            } else {
                self.fourthLabel.text = "kilogram"
                self.secondButton.setTitle("kg  ▼", for: .normal)
            }
            self.operation()
        }
        let gram = UIAlertAction(title: "Gram g", style: .default){_ in
            self.operation()
            if self.firstButtonTapped {
                self.thirdLabel.text = "gram"
                self.firstButton.setTitle("g  ▼", for: .normal)
            } else {
                self.fourthLabel.text = "gram"
                self.secondButton.setTitle("g  ▼", for: .normal)
            }
            self.operation()
        }
        let milligrams = UIAlertAction(title: "Milligrams mg", style: .default){_ in
            self.operation()
            if self.firstButtonTapped {
                self.thirdLabel.text = "milligram"
                self.firstButton.setTitle("mg  ▼", for: .normal)
            } else {
                self.fourthLabel.text = "milligram"
                self.secondButton.setTitle("mg  ▼", for: .normal)
            }
            self.operation()
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
        alert.addAction(tone)
        alert.addAction(kg)
        alert.addAction(gram)
        alert.addAction(milligrams)
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
        if thirdLabel.text == "kilogram" {
            if fourthLabel.text == "kilogram" {
                secondLabel.text = firstLabel.text
            } else if fourthLabel.text == "tone" {
                secondLabel.text = "\(Double(firstLabel.text!)!/1000)"
            } else if fourthLabel.text == "gram" {
                secondLabel.text = "\(Double(firstLabel.text!)!*1000)"
            } else if fourthLabel.text == "milligram" {
                secondLabel.text = "\(Double(firstLabel.text!)!*1000000)"
            }
            
        }else if thirdLabel.text == "tone" {
            if fourthLabel.text == "tone" {
                secondLabel.text = firstLabel.text
            } else if fourthLabel.text == "kilogram" {
                secondLabel.text = "\(Double(firstLabel.text!)!*1000)"
            } else if fourthLabel.text == "gram" {
                secondLabel.text = "\(Double(firstLabel.text!)!*1000000)"
            } else if fourthLabel.text == "milligram" {
                secondLabel.text = "\(Double(firstLabel.text!)!*1000000000)"
            }
            
        }
        else if thirdLabel.text == "gram" {
            if fourthLabel.text == "gram" {
                secondLabel.text = firstLabel.text
            } else if fourthLabel.text == "kilogram" {
                secondLabel.text = "\(Double(firstLabel.text!)!/1000)"
            } else if fourthLabel.text == "tone" {
                secondLabel.text = "\(Double(firstLabel.text!)!/1000000)"
            } else if fourthLabel.text == "milligram" {
                secondLabel.text = "\(Double(firstLabel.text!)!*1000)"
            }
            
        }else if thirdLabel.text == "milligram" {
            if fourthLabel.text == "milligram" {
                secondLabel.text = firstLabel.text
            } else if fourthLabel.text == "kilogram" {
                secondLabel.text = "\(Double(firstLabel.text!)!/1000000)"
            } else if fourthLabel.text == "gram" {
                secondLabel.text = "\(Double(firstLabel.text!)!/1000)"
            } else if fourthLabel.text == "tone" {
                secondLabel.text = "\(Double(firstLabel.text!)!/1000000000)"
            }
            
        }
        
        if (Double(secondLabel.text!)!.truncatingRemainder(dividingBy: 1) == 0) {
            secondLabel.text = "\(Int(Double(secondLabel.text!)!))"
        }
    }
    
   

}

extension String {
       var length: Int {
           return count
       }

       subscript (i: Int) -> String {
           return self[i ..< i + 1]
       }

       subscript (r: Range<Int>) -> String {
           let range = Range(uncheckedBounds: (lower: max(0, min(length, r.lowerBound)),
                                               upper: min(length, max(0, r.upperBound))))
           let start = index(startIndex, offsetBy: range.lowerBound)
           let end = index(start, offsetBy: range.upperBound - range.lowerBound)
           return String(self[start ..< end])
       }
    
    var isSymbol : Bool {
        for i in 0..<count {
            if self[i] == "." {
                return true
            }
        }
        return false
    }
    
    
}
