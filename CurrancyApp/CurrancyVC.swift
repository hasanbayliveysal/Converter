//
//  CurrancyVC.swift
//  CurrancyApp
//
//  Created by Veysal on 10.04.23.
//

import UIKit


class CurrancyVC: UIViewController , UITableViewDelegate, UITableViewDataSource{

    var currencyList = [String]()
    let request = WebServices()
    var input = "100"
    var base = "USD"
    var keyboardHeight = Int()
    
  
    let amountLabel = UITextField()
    let baseLabel = UITextField()
    let button = CustomButton()
   
    
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        self.view.addSubview(label)
        label.font = UIFont.systemFont(ofSize: 28, weight: .regular)
        return label
    }()
    
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        self.view.addSubview(tableView)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        createCancelButton()
        self.navigationItem.title = "Currancy"
        self.tableView.delegate = self
        self.tableView.dataSource = self
        makeRequest(showAll: true)
        makeConstrate()
        
     
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
    }
//
//    @objc func onTapInput() {
//        print("shjkfasjdhfga")
//        createView().snp.makeConstraints { make in
//            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).offset(-keyboardHeight)
//        }
//    }
    
    @objc func keyboardWillShow(_ notification: Notification) {
        if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRecangle = keyboardFrame.cgRectValue
            let keyboardHeight = keyboardRecangle.height
            self.keyboardHeight = Int(keyboardHeight)
            print(keyboardHeight)
          //  whiteView.removeFromSuperview()
            whiteView.snp.makeConstraints { make in
                make.bottom.equalTo(self.view.snp.bottom).offset(-keyboardHeight)
                make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left)
                make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right)
                make.height.equalTo(self.view.frame.size.height/4)
          }
        }
    }
  
    
    func makeRequest(showAll : Bool, currencies: [String] = ["USD", "GBP", "EUR"]) {
        request.apiRequest(url: "https://api.exchangerate.host/latest?base=\(base)&amount=\(input)") { currency in
            var tempList = [String]()
            let date = currency.date
            for currency in currency.rates {
                if showAll {
                    tempList.append("\(currency.key) \(String(format: "%0.2f", currency.value))")
                }
          
                tempList.sort()
            }
            self.currencyList = tempList
            self.tableView.reloadData()
            self.dateLabel.text = date
            print(self.currencyList.count)
           // print(date)
        }
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currencyList.count
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        cell.textLabel?.text = currencyList[indexPath.row]
        cell.textLabel?.textAlignment = .justified
        return cell
    }
    
    @objc func onTapConvert(_ sender: CustomButton) {
        sender.animation(sender, .blue)
        self.base = baseLabel.text!
        self.input = amountLabel.text!
        makeRequest(showAll: true)
        tableView.reloadData()
        whiteView.removeFromSuperview()
        self.view.addSubview(whiteView)
        makeConstrate()
        view.endEditing(true)
    }
    
    func makeConstrate() {
        dateLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
        }
        tableView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(dateLabel.snp.bottom)
            make.bottom.equalTo(self.view.snp.bottom).offset(-view.frame.size.height/4)
        }
        whiteView.snp.makeConstraints { make in
            make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left)
            make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom)
            make.height.equalTo(self.view.frame.size.height/4)
        }
    }
    
    
    
    
    private lazy var whiteView: UIView = {
        let view = UIView()
        self.view.addSubview(view)
        view.backgroundColor = .white
       // view.isUserInteractionEnabled = true
        
        view.addSubview(amountLabel)
        amountLabel.placeholder = " write amount here"
        amountLabel.font = UIFont.systemFont(ofSize: 28, weight: .regular)
        amountLabel.clipsToBounds = true
        amountLabel.backgroundColor = .systemGray
        amountLabel.layer.cornerRadius = 8
        amountLabel.isUserInteractionEnabled = true
        amountLabel.keyboardType = .numberPad
       // amountLabel.addTarget(self, action: #selector(onTapInput), for: .touchUpInside)
        
        view.addSubview(baseLabel)
        baseLabel.placeholder = " write base here"
        baseLabel.font = UIFont.systemFont(ofSize: 28, weight: .regular)
        baseLabel.clipsToBounds = true
        baseLabel.backgroundColor = .systemGray
        baseLabel.layer.cornerRadius = 8
        
       
        view.addSubview(button)
        button.addTarget(self, action: #selector(onTapConvert), for: .touchUpInside)
       
        amountLabel.snp.makeConstraints { make in
            make.left.equalTo(view.snp.left).offset(16)
            make.right.equalTo(view.snp.right).offset(-16)
            make.bottom.equalTo(baseLabel.snp.top).offset(-self.view.frame.size.height/45)
        }
        
        baseLabel.snp.makeConstraints { make in
            make.left.equalTo(view.snp.left).offset(16)
            make.right.equalTo(view.snp.right).offset(-16)
            make.bottom.equalTo(button.snp.top).offset(-self.view.frame.size.height/45)
        }
        
        button.snp.makeConstraints { make in
            make.left.equalTo(view.snp.left).offset(16)
            make.right.equalTo(view.snp.right).offset(-16)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-self.view.frame.size.height/45)
            make.height.equalTo(self.view.frame.size.height/16)
        }
        
        return view
    }()
}
