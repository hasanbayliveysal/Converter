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
            
        }
        let kg = UIAlertAction(title: "Kilogram k", style: .default) {_ in
            if self.firstButtonTapped {
                self.thirdLabel.text = "kilogram"
                self.firstButton.setTitle("kg  ▼", for: .normal)
            } else {
                self.fourthLabel.text = "kilogram"
                self.secondButton.setTitle("kg  ▼", for: .normal)
            }
        }
        let gram = UIAlertAction(title: "Gram g", style: .default){_ in
            if self.firstButtonTapped {
                self.thirdLabel.text = "gram"
                self.firstButton.setTitle("g  ▼", for: .normal)
            } else {
                self.fourthLabel.text = "gram"
                self.secondButton.setTitle("g  ▼", for: .normal)
            }
        }
        let milligrams = UIAlertAction(title: "Milligrams mg", style: .default){_ in
            if self.firstButtonTapped {
                self.thirdLabel.text = "milligram"
                self.firstButton.setTitle("mg  ▼", for: .normal)
            } else {
                self.fourthLabel.text = "milligram"
                self.secondButton.setTitle("mg  ▼", for: .normal)
            }
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
    
    override func numberTapped(_ sender: UIButton) {
        let tag = sender.tag - 1
        
        if firstLabel.text == "0" {
            firstLabel.text = "\(tag)"
        } else
        if let text = firstLabel.text {
            firstLabel.text = "\(text)\(tag)"
        }
    }
    
    override func clearAllBtnTapped(_  sender: UIButton) {
        firstLabel.text = "0"
        dotBtnTap = false
        
    }
    
    override func dotBtnTapped(_ sender: UIButton) {
        
        if let text =  firstLabel.text {
            firstLabel.text = "\(text),"
            sender.isEnabled = false
            dotBtnTap = true
        }
        if !dotBtnTap {
            sender.isEnabled = true
        }
        
       
    }

}
