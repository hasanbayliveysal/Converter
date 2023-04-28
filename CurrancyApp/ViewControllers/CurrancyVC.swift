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
    var input = ""
    var base = ""
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
       
        self.amountLabel.textAlignment = .center
        self.baseLabel.textAlignment = .center
        makeRequest(showAll: true)
        tableView.reloadData()
        makeConstraint()
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
    }
    
    @objc func keyboardWillShow(_ notification: Notification) {
        if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRecangle = keyboardFrame.cgRectValue
            let keyboardHeight = keyboardRecangle.height
            self.keyboardHeight = Int(keyboardHeight)
           // print(keyboardHeight)

            whiteView.snp.makeConstraints { make in
                make.bottom.equalTo(self.view.snp.bottom).offset(-keyboardHeight)
                make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left)
                make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right)
                make.height.equalTo(self.view.frame.size.height/4)
          }
        }
    }
  
    
    func makeRequest(showAll : Bool, currencies: [String] = ["USD", "GBP", "EUR"]) {
        request.apiRequest(url: "https://api.exchangerate.host/latest?base=\(base)&amount=\(input)"){ currency in
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
            print(date)
         
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
        sender.animation(sender, .orange)
        self.base = baseLabel.text!
        self.input = amountLabel.text!
        makeRequest(showAll: true)
        tableView.reloadData()
        whiteView.removeFromSuperview()
        self.view.addSubview(whiteView)
        makeConstraint()
        view.endEditing(true)
       
    }
    
    func makeConstraint() {
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
            make.height.equalTo(self.view.frame.size.height/5)
        }
    }
    
    
    
    
    private lazy var whiteView: UIView = {
        let view = UIView()
        self.view.addSubview(view)
        view.backgroundColor = .black
        
        view.addSubview(amountLabel)
        amountLabel.backgroundColor = .white
        amountLabel.layer.borderColor = UIColor.orange.cgColor
        amountLabel.layer.borderWidth = 2
        amountLabel.attributedPlaceholder = NSAttributedString(string: "Amount", attributes: [NSAttributedString.Key.foregroundColor: UIColor.systemGray]
        )
        amountLabel.font = UIFont.systemFont(ofSize: 28, weight: .regular)
        amountLabel.clipsToBounds = true
        amountLabel.textColor = .black
        amountLabel.layer.cornerRadius = 25
        amountLabel.isUserInteractionEnabled = true
        amountLabel.keyboardType = .numberPad
       
        
        view.addSubview(baseLabel)
        baseLabel.attributedPlaceholder = NSAttributedString(string: "Base", attributes: [NSAttributedString.Key.foregroundColor: UIColor.systemGray]
        )
        baseLabel.textColor = .black
        baseLabel.backgroundColor = .white
        baseLabel.layer.borderColor = UIColor.orange.cgColor
        baseLabel.layer.borderWidth = 2
        baseLabel.font = UIFont.systemFont(ofSize: 28, weight: .regular)
        baseLabel.clipsToBounds = true
        baseLabel.layer.cornerRadius = 25
        
       
        view.addSubview(button)
        button.addTarget(self, action: #selector(onTapConvert), for: .touchUpInside)
        button.setTitle("Convert", for: .normal)
        button.backgroundColor = .orange
        
        
       
        amountLabel.snp.makeConstraints { make in
            make.left.equalTo(view.snp.left).offset(16)
            make.right.equalTo(baseLabel.snp.left).offset(-16)
            make.bottom.equalTo(button.snp.top).offset(-self.view.frame.size.height/45)
            make.width.equalTo(self.view.frame.size.width*0.43)
            make.height.equalTo(50)
        }
        
        baseLabel.snp.makeConstraints { make in
            make.left.equalTo(amountLabel.snp.right).offset(16)
            make.right.equalTo(view.snp.right).offset(-16)
            make.bottom.equalTo(button.snp.top).offset(-self.view.frame.size.height/45)
            make.width.equalTo(self.view.frame.size.width*0.43)
            make.height.equalTo(50)
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
