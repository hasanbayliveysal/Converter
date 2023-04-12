//
//  Model.swift
//  CurrancyApp
//
//  Created by Veysal on 10.04.23.
//

import Foundation
import UIKit

struct CustomData {
    var title : String
    var backImage : UIImage
    var vc : UIViewController
}


struct CurrancyModel : Codable {
    
    var success: Bool
    var base: String
    var date: String
    var rates = [String:Double]()
    
}
