//
//  ViewController.swift
//  CurrancyApp
//
//  Created by Veysal on 09.04.23.
//

import UIKit
import SnapKit

class ViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    let myList =
        [
            CustomData(title: "Currancy", backImage: UIImage(systemName: "dollarsign.circle")!,vc: CurrancyVC()),
            CustomData(title: "Age", backImage: UIImage(systemName: "birthday.cake")!,vc: AgeCalculationViewController()),
            CustomData(title: "Mass", backImage: UIImage(systemName: "scalemass")!, vc: MassVC()),
            CustomData(title: "Length", backImage: UIImage(systemName: "ruler")!, vc: LengthVC()),
            CustomData(title: "Time", backImage: UIImage(systemName: "stopwatch")!, vc: TimeVC()),
            CustomData(title: "Speed", backImage: UIImage(systemName: "speedometer")!, vc: SpeedVC()),
            CustomData(title: "Temperature", backImage: UIImage(systemName: "thermometer.transmission")!, vc: TemperatureVC()),
            CustomData(title: "Numerical system", backImage: UIImage(systemName: "number")!, vc: NumericalVC()),
            CustomData(title: "Volume", backImage: UIImage(systemName: "volume")!, vc: VolumeVC())
         ]

    private lazy var collectionView : UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 20, left: 15, bottom: 10, right: 15)
                //layout.itemSize = CGSize(width: screenWidth/3, height: screenWidth/3)
        layout.minimumInteritemSpacing = 1
        layout.minimumLineSpacing = 30
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(CollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        return cv
        
    }()
 
   
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .black
        collectionView.snp.makeConstraints { make in
            make.left.right.top.bottom.equalToSuperview()
        }
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return myList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        cell.data = myList[indexPath.item]
        return cell
    }
  
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath ) -> CGSize {
        return CGSize(width: collectionView.frame.width/4, height: collectionView.frame.width/4)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = UINavigationController(rootViewController: myList[indexPath.item].vc)
        vc.modalPresentationStyle = .fullScreen // if you want to present it in full screen mode
        vc.modalTransitionStyle = .crossDissolve
        self.present(vc, animated: true, completion: nil)
        vc.navigationItem.title = myList[indexPath.item].title
        
    }
 
}



extension UIViewController {
    
    
    func createCancelButton() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: " ‹ Back", style: .plain, target: nil, action: #selector(goMainVC))
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
      
    }
    
    @objc func deleteBtnTapped(_ sender: CustomButton) {
       
    }
    
    
    
    
}
    

