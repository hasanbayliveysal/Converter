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
    
    private lazy var convertButton : CustomButton = {
       let button = CustomButton()
       self.view.addSubview(button)
        button.addTarget(self, action: #selector(onTapConvert), for: .touchUpInside)
       return button
    }()
    
    private lazy var baseInput: UITextField = {
        let label = UITextField()
        self.view.addSubview(label)
        label.placeholder = " write base here"
        label.font = UIFont.systemFont(ofSize: 28, weight: .regular)
        label.clipsToBounds = true
        label.backgroundColor = .systemGray
        label.layer.cornerRadius = 8
        return label
    }()
    
    private lazy var amountInput: UITextField = {
        let label = UITextField()
        self.view.addSubview(label)
        label.placeholder = " write amount here"
        label.keyboardType = .numberPad
        label.font = UIFont.systemFont(ofSize: 28, weight: .regular)
        label.clipsToBounds = true
        label.backgroundColor = .systemGray
        label.layer.cornerRadius = 8
        return label
    }()
    
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
    }
  
    
    func makeRequest(showAll : Bool, currencies: [String] = ["USD", "GBP", "EUR"]) {
        request.apiRequest(url: "https://api.exchangerate.host/latest?base=\(base)&amount=\(input)") { currency in
            var tempList = [String]()

            var date = currency.date
            for currency in currency.rates {
                if showAll {
                    tempList.append("\(currency.key) \(String(format: "%0.2f", currency.value))")
                }
          
                tempList.sort()
            }
            self.currencyList = tempList
            self.tableView.reloadData()
            self.dateLabel.text = date
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
        self.base = baseInput.text!
        self.input = amountInput.text!
        makeRequest(showAll: true)
        tableView.reloadData()
    }
    
    func makeConstrate() {
        dateLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
        }
        tableView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(dateLabel.snp.bottom)
            make.bottom.equalTo(self.amountInput.snp.top).offset(-16)
        }
        baseInput.snp.makeConstraints { make in
            make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).offset(16)
            make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right).offset(-16)
            make.bottom.equalTo(self.convertButton.safeAreaLayoutGuide.snp.top).offset(-16)
            make.width.equalTo(self.view.frame.size.width)
            make.height.equalTo(40)
        }
        amountInput.snp.makeConstraints { make in
            make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).offset(16)
            make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right).offset(-16)
            make.bottom.equalTo(self.baseInput.safeAreaLayoutGuide.snp.top).offset(-16)
            make.width.equalTo(self.view.frame.size.width)
            make.height.equalTo(40)
        }
        convertButton.snp.makeConstraints { make in
            make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).offset(16)
            make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right).offset(-16)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom)
            make.width.equalTo(self.view.frame.size.width)
            make.height.equalTo(60)
        }
    }
}
