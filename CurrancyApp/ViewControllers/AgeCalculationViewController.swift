//
//  AgeCalculationViewController.swift
//  CurrancyApp
//
//  Created by Veysal on 10.04.23.
//

import UIKit

class AgeCalculationViewController: UIViewController {
    
    //Variables
    var buttonSize = CGFloat ()
    let datePicker : UIDatePicker = UIDatePicker()
    var selectedPickerForToday = true
    let labelForView = UILabel()

    private lazy var datOfBirthLbl : UILabel = {
        let label = UILabel()
        self.view.addSubview(label)
        label.text = " Date of birth"
        label.font = UIFont.systemFont(ofSize: 22, weight: .regular)
        label.textColor = .white
        return label
    }()
    
    
    private lazy var todayLbl : UILabel = {
       let label = UILabel()
       self.view.addSubview(label)
       label.text = " Today"
       label.font = UIFont.systemFont(ofSize: 22, weight: .regular)
       label.textColor = .white
       return label
    }()
   
    private lazy var datePickerLbl : UILabel = {
        let label = UILabel()
        self.view.addSubview(label)
        label.text = "18 Apr 2001 ▾  "
        label.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        label.textColor = .orange
        return label
    }()
    
    
    private lazy var todayPickerLbl : UILabel = {
       let label = UILabel()
       self.view.addSubview(label)
       label.text = "13 Apr 2023 ▾  "
       label.font = UIFont.systemFont(ofSize: 22, weight: .bold)
       label.textColor = .white
       return label
    }()
    
    private lazy var dateView : UIView = {
       
        let view = UIView()
        self.view.addSubview(view)
        view.backgroundColor = .white
        // Date Picker
        datePicker.timeZone = NSTimeZone.local
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.datePickerMode = .date
        datePicker.backgroundColor = .black
        datePicker.addTarget(self, action: #selector(datePickerValueChanged), for: .valueChanged)
        view.addSubview(datePicker)
        
        datePicker.snp.makeConstraints { make in
            make.centerX.equalTo(view.snp.centerX)
            make.centerY.equalTo(view.snp.centerY)
            make.bottom.equalTo(view.snp.bottom).offset(-(self.view.frame.size.height*3)/20)
            make.height.equalTo(self.view.frame.size.height/5)
        }
        
        //Done Button
        
        let doneButton = CustomButton()
        view.addSubview(doneButton)
        doneButton.setTitle("Done", for: .normal)
        doneButton.addTarget(self, action: #selector(onTapDoneButton), for: .touchUpInside)
        doneButton.backgroundColor = .systemBlue
        doneButton.snp.makeConstraints { make in
            make.left.equalTo(view.snp.left).offset(self.view.frame.size.width/1.9)
            make.right.equalTo(view.snp.right).offset(-self.view.frame.size.width/27)
            make.bottom.equalTo(view.snp.bottom).offset(-self.view.frame.size.height/30)
            make.height.equalTo(self.view.frame.size.height/12)
        }
        
        //Cancel Button
        
        let cancelButton = CustomButton()
        view.addSubview(cancelButton)
        cancelButton.setTitle("Cancel", for: .normal)
        cancelButton.addTarget(self, action: #selector(onTapCancelButton), for: .touchUpInside)
        cancelButton.backgroundColor = .gray
        cancelButton.snp.makeConstraints { make in
            make.left.equalTo(view.snp.left).offset(self.view.frame.size.width/27)
            make.right.equalTo(view.snp.right).offset(-self.view.frame.size.width/1.9)
            make.bottom.equalTo(view.snp.bottom).offset(-self.view.frame.size.height/30)
            make.height.equalTo(self.view.frame.size.height/12)
        }
        
        // Label
        
        
        view.addSubview(labelForView)
        labelForView.textColor = .black
        labelForView.font = UIFont.systemFont(ofSize: 26,weight: .bold)
        labelForView.snp.makeConstraints { make in
            make.centerX.equalTo(view.snp.centerX)
            make.top.equalTo(view.snp.top)
        }
        
       
     //   datePicker.c
        
      return view
    }()
   

    // Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        dateView.isHidden = true
        buttonSize = view.frame.size.width/4
        view.backgroundColor  = .black
        self.navigationItem.title = "Age Calculation"
        createCancelButton()
        createConstraint()
        createGesture()
       
      //  createDatePicker()
        
    }
    
    
    
    @objc func onTapDoneButton(_ sender: CustomButton) {
        sender.animation(sender, .systemBlue)
        datePicker.endEditing(false)
        dateView.isHidden = true
    }
    
    @objc func onTapCancelButton(_ sender: CustomButton) {
        sender.animation(sender, .gray)
        dateView.isHidden = true
        datePickerLbl.text = "18 Apr 2001 ▾  "
        todayPickerLbl.text = "13 Apr 2023 ▾  "
    }
    
    func createGesture() {
        //gesturerecognizer for today label
        let gestureRecognizerForToday = UITapGestureRecognizer()
        gestureRecognizerForToday.addTarget(self, action: #selector(onTapPickerTodayLbl))
        todayPickerLbl.isUserInteractionEnabled = true
        todayPickerLbl.addGestureRecognizer(gestureRecognizerForToday)
       
        //gesturerecognizer for date of birth label
        let gestureRecognizerForBirth = UITapGestureRecognizer()
        gestureRecognizerForBirth.addTarget(self, action: #selector(onTapPickerBirthLbl))
        datePickerLbl.isUserInteractionEnabled = true
        datePickerLbl.addGestureRecognizer(gestureRecognizerForBirth)
        
        let tapGestureForView = UITapGestureRecognizer(target: self, action: #selector(onTapView))
        self.view.isUserInteractionEnabled = true
        self.view.addGestureRecognizer(tapGestureForView)
    }
    
    @objc func onTapView() {
     //   dateView.isHidden = true
    }
    
    @objc func onTapPickerTodayLbl() {
        selectedPickerForToday = true
        dateView.isHidden = false
        labelForView.text = "Today"
       
        
      //  datePicker.isHidden = false
      
    }
    
    @objc func onTapPickerBirthLbl() {
        selectedPickerForToday = false
        dateView.isHidden = false
        labelForView.text = "Date of birth"
     //   datePicker.isHidden = false
      
    }
    
    
    func createDatePicker() {
        
       
//        datePicker.addSubview(label)
//        label.textColor = .white
//        if selectedPickerForToday {
//            label.text = "Today"
//        }else {
//            label.text = "Date of birth"
//        }
//
    }
    
    

    @objc func datePickerValueChanged(_ sender: UIDatePicker){
        
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM yyyy"
        let selectedDate: String = dateFormatter.string(from: sender.date)
        if selectedPickerForToday {
            todayPickerLbl.text = "\(selectedDate) ▾  "
        }else {
            datePickerLbl.text = "\(selectedDate) ▾  "
        }
       
      
        print("Selected value \(selectedDate)")
        
    }
    
    func createConstraint () {
        dateView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.bottom.equalToSuperview()
            make.height.equalTo(self.view.frame.size.height/2.5)
        }
        datOfBirthLbl.snp.makeConstraints { make in
            make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left)
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
            make.width.equalTo(Int(view.frame.size.width)/3)
            make.height.equalTo(Int(view.frame.size.width)/6)
        }
        todayLbl.snp.makeConstraints { make in
            make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left)
            make.top.equalTo(self.datOfBirthLbl.safeAreaLayoutGuide.snp.bottom)
            make.width.equalTo(Int(view.frame.size.width)/3)
            make.height.equalTo(Int(view.frame.size.width)/6)
        }
        datePickerLbl.snp.makeConstraints { make in
            make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right)
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
            make.height.equalTo(Int(view.frame.size.width)/6)
        }
        todayPickerLbl.snp.makeConstraints { make in
            make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right)
            make.top.equalTo(self.datePickerLbl.safeAreaLayoutGuide.snp.bottom)
            make.height.equalTo(Int(view.frame.size.width)/6)
        }
    }
    
}





