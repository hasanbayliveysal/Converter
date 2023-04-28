//
//  AgeCalculationViewController.swift
//  CurrancyApp
//
//  Created by Veysal on 10.04.23.
//

import UIKit

class AgeCalculationViewController: UIViewController {
    
    //Variables
    
    let dateFormatter: DateFormatter = DateFormatter()
    var date = ""
    var buttonSize = CGFloat ()
    let datePicker : UIDatePicker = UIDatePicker()
    var selectedPickerForToday = true
    var summary = [String : String]()
    
    // Labels
    
    let ageLbl = UILabel()
    let monthLbl = UILabel()
    let labelForView = UILabel()

    
    var selectedDateForToday = Date()
    var selectedDateForBirthday = Date()
    
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
        dateFormatter.dateFormat = "dd MMM yyyy"
        date = dateFormatter.string(from: Date())
        label.text = "\(date) ▾  "
        label.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        label.textColor = .orange
        return label
    }()
    
    
    private lazy var todayPickerLbl : UILabel = {
       let label = UILabel()
       self.view.addSubview(label)
        dateFormatter.dateFormat = "dd MMM yyyy"
        date = dateFormatter.string(from: Date())
       label.text = "\(date) ▾  "
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
            make.centerY.equalTo(view.snp.centerY).offset(-self.view.frame.size.height/22)
            make.height.equalTo(self.view.frame.size.height/5)
        }

        //Done Button
        
        let doneButton = CustomButton()
        view.addSubview(doneButton)
        doneButton.setTitle("Done", for: .normal)
        doneButton.addTarget(self, action: #selector(onTapDoneButton), for: .touchUpInside)
        doneButton.backgroundColor = .orange
        doneButton.snp.makeConstraints { make in
            make.left.equalTo(view.snp.left).offset(self.view.frame.size.width/1.9)
            make.right.equalTo(view.snp.right).offset(-self.view.frame.size.width/27)
            make.bottom.equalTo(view.snp.bottom).offset(-self.view.frame.size.height/30)
            make.height.equalTo(self.view.frame.size.height/15)
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
            make.height.equalTo(self.view.frame.size.height/15)
        }
        
        // Label
        
        
        view.addSubview(labelForView)
        labelForView.textColor = .black
        labelForView.font = UIFont.systemFont(ofSize: 26,weight: .bold)
        labelForView.snp.makeConstraints { make in
            make.centerX.equalTo(view.snp.centerX)
            make.top.equalTo(view.snp.top)
        }
        
      return view
    }()
   
    
    private lazy var calculationView : UIView = {
       let view = UIView()
        self.view.addSubview(view)
        view.layer.cornerRadius = 20
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.borderWidth = 2
        
        let lineVertical = UIView()
        view.addSubview(lineVertical)
        lineVertical.layer.borderColor = UIColor.white.cgColor
        lineVertical.layer.borderWidth = 1
        lineVertical.snp.makeConstraints { make in
            make.centerX.equalTo(view.snp.centerX)
            make.centerY.equalTo(view.snp.centerY)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(6)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-(self.view.frame.size.height/3.4 + 6))
            make.width.equalTo(1)
        }
        
        let lineHorizontal = UIView()
        view.addSubview(lineHorizontal)
        lineHorizontal.layer.borderColor = UIColor.white.cgColor
        lineHorizontal.layer.borderWidth = 1
        lineHorizontal.snp.makeConstraints { make in
            make.centerX.equalTo(view.snp.centerX)
            make.centerY.equalTo(view.snp.centerY)
            make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).offset(6)
            make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right).offset(-6)
            make.height.equalTo(1)
        }
        
        
        let ageTextLbl = UILabel()
        view.addSubview(ageTextLbl)
        ageTextLbl.text = "Age"
        ageTextLbl.font = UIFont.systemFont(ofSize: 42, weight: .bold)
        ageTextLbl.snp.makeConstraints { make in
            make.left.equalTo(view.snp.left).offset(self.view.frame.size.width/15)
            make.top.equalTo(view.snp.top).offset(self.view.frame.size.width/15)
           // make.height.equalTo(view.frame.size.width/6)
        }
        
    
        view.addSubview(ageLbl)
        ageLbl.text = "0 years"
        ageLbl.font = UIFont.systemFont(ofSize: 42, weight: .bold)
        ageLbl.textColor = .orange
        ageLbl.snp.makeConstraints { make in
            make.left.equalTo(view.snp.left).offset(self.view.frame.size.width/15)
            make.top.equalTo(view.snp.top).offset(self.view.frame.size.width/3.8)
        }
        
       
        view.addSubview(monthLbl)
        monthLbl.text = "0 month | 0 days"
        monthLbl.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        monthLbl.snp.makeConstraints { make in
            make.left.equalTo(view.snp.left).offset(self.view.frame.size.width/15)
            make.top.equalTo(view.snp.top).offset(self.view.frame.size.width/2)
        }
        
        let summaryLlb = UILabel()
        view.addSubview(summaryLlb)
        summaryLlb.text = "Summary"
        summaryLlb.textColor = .orange
        summaryLlb.font = UIFont.systemFont(ofSize: 26, weight: .bold)
        summaryLlb.snp.makeConstraints { make in
            make.centerX.equalTo(view.snp.centerX)
            make.top.equalTo(lineHorizontal.snp.top).offset(self.view.frame.size.width/30)
        }
        
        let nextBdLbl = UILabel()
        view.addSubview(nextBdLbl)
        nextBdLbl.text = "Next Birthday"
        nextBdLbl.textColor = .orange
        nextBdLbl.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        nextBdLbl.snp.makeConstraints { make in
            make.right.equalTo(view.snp.right).offset(-self.view.frame.size.width/15)
            make.top.equalTo(view.snp.top).offset(self.view.frame.size.width/10)
        }
        
        let cakeIcon = UIImageView()
        view.addSubview(cakeIcon)
        cakeIcon.image = UIImage(named: "cake_icon")
        cakeIcon.snp.makeConstraints { make in
            make.centerX.equalTo(nextBdLbl.snp.centerX)
            make.top.equalTo(nextBdLbl.snp.bottom).offset(self.view.frame.size.width/20)
          //  make.height.width.equalTo(20)
        }
        
        let stackView = UIStackView()
        
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
      
        self.view.bringSubviewToFront(dateView)
       
      //  createDatePicker()
        
//        var date = Date(time: (1477593000000 / 1000.0))
//        print("date - \(date)")
        
    }
    
    
    
    @objc func onTapDoneButton(_ sender: CustomButton) {
        sender.animation(sender, .orange)
        datePicker.endEditing(true)
        dateView.isHidden = true
        if let years = daysBetween(start: selectedDateForBirthday, end: selectedDateForToday).year {
            self.ageLbl.text = "\(years) years"
        }
        if let months = daysBetween(start: selectedDateForBirthday, end: selectedDateForToday).month {
            if let days = daysBetween(start: selectedDateForBirthday, end: selectedDateForToday).day {
                self.monthLbl.text = "\(months) months | \(days) days"
            }
        }
       
   
        
    }
    
    @objc func onTapCancelButton(_ sender: CustomButton) {
        sender.animation(sender, .gray)
        dateView.isHidden = true
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
       //dateView.isHidden = true
    }
    
    @objc func onTapPickerTodayLbl() {
        selectedPickerForToday = true
        dateView.isHidden = false
        labelForView.text = "Today"
       
      
    }
    
    @objc func onTapPickerBirthLbl() {
        selectedPickerForToday = false
        dateView.isHidden = false
        labelForView.text = "Date of birth"
     
    }
    
    func daysBetween(start: Date, end: Date) -> DateComponents {
        let dateComponents = Calendar.current.dateComponents([.year, .month, .day], from: start, to: end)
        return dateComponents
       }
    
  
    

    @objc func datePickerValueChanged(_ sender: UIDatePicker){
        
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM yyyy"
        let selectedDate: String = dateFormatter.string(from: sender.date)
        
        
        if selectedPickerForToday {
            todayPickerLbl.text = "\(selectedDate) ▾  "
            self.selectedDateForToday = sender.date
        }else {
            datePickerLbl.text = "\(selectedDate) ▾  "
            self.selectedDateForBirthday = sender.date
        }
       
              
       // print("Selected value \(selectedDateForToday)  \(selectedDateForBirthday)")
        
    }
    
    func createConstraint () {
        calculationView.snp.makeConstraints { make in
            make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).offset(6)
            make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right).offset(-6)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).offset(-self.view.frame.size.height/10)
            make.top.equalTo(self.todayLbl.safeAreaLayoutGuide.snp.bottom)
        }
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





