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
       // cell.backgroundColor = .black
        return cell
    }
  
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath ) -> CGSize {
        return CGSize(width: collectionView.frame.width/4, height: collectionView.frame.width/4)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       // let vc = myList[indexPath.item].vc
//        vc.title = myList[indexPath.item].title
//        self.present(vc, animated: true)
        
        let vc = UINavigationController(rootViewController: myList[indexPath.item].vc)
       // vc.modalPresentationStyle = .fullScreen // if you want to present it in full screen mode
        self.present(vc, animated: true, completion: nil)
        vc.navigationItem.title = myList[indexPath.item].title
        
    }
    
    @objc func function() {
        
    }
}


