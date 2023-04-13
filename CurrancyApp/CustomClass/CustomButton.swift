//
//  CustomButton.swift
//  CurrancyApp
//
//  Created by Veysal on 12.04.23.
//

import UIKit

class CustomButton: UIButton {
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    required init?(coder : NSCoder) {
        super.init(coder: coder)
        setupButton()
    }
    
    func setupButton() {
        styleButton()
    }
    
    func styleButton() {
        
        setTitle("Button", for: .normal)
        setTitleColor(.white, for: .normal)
        
        backgroundColor    = .blue
        titleLabel?.font   = UIFont(name: "AvenirNext-DemiBold", size: 18)
        layer.cornerRadius = 25
        layer.borderColor  = UIColor.darkGray.cgColor
        
    }
    
    func animation(_ viewToAnimate : UIView, _ backGraundClr : UIColor) {
        // viewToAnimate.transform = CGAffineTransform(scaleX: 0.92, y: 0.92)
        
        UIView.animate(withDuration: 0.1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseIn) {
            //  viewToAnimate.transform = CGAffineTransform(scaleX: 0.92, y: 0.92)
            viewToAnimate.backgroundColor = .systemGray
        } completion: { _ in
            UIView.animate(withDuration: 0.1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 2, options: .curveEaseIn, animations: {
                //  viewToAnimate.transform = CGAffineTransform(scaleX: 1, y: 1)
                viewToAnimate.backgroundColor = backGraundClr
            }, completion: nil)
        }
        
        
        
    }
    
 
}
