//
//  CollectionViewCell.swift
//  CurrancyApp
//
//  Created by Veysal on 10.04.23.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    var data: CustomData? {
        didSet {
            guard let data = data else { return }
            label.text = data.title
            icon.image = data.backImage
        }
    }
    
    lazy var label : UILabel = {
        
        let label = UILabel()
        contentView.addSubview(label)
        label.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        return label
        
    }()
    lazy var icon : UIImageView = {
        
        let icon = UIImageView()
        contentView.addSubview(icon)
        icon.backgroundColor = UIColor(white: 1, alpha: 0.15)
        icon.clipsToBounds = true
        icon.layer.cornerRadius = 10
        icon.tintColor = .orange
        return icon
        
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        self.contentView.isUserInteractionEnabled = true
        label.snp.makeConstraints { make in
            make.top.equalTo(self.contentView.snp.bottom).offset(2)
            make.centerX.equalTo(self.contentView.snp.centerX)
        }
        icon.snp.makeConstraints { make in
            make.left.right.bottom.top.equalToSuperview()
           // make.height.width.equalTo(20)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    
}
