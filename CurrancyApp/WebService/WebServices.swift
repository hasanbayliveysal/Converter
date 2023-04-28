//
//  WebServices.swift
//  CurrancyApp
//
//  Created by Veysal on 12.04.23.
//

import Foundation
import Alamofire

class WebServices {

    
    func apiRequest(url: String, completion: @escaping (CurrancyModel) -> () ) {
        
        
        Session.default.request(url).responseDecodable(of: CurrancyModel.self) { response in
            
        switch response.result {
            case .success(let currencies):
                 completion(currencies)
                 print(currencies.date)
            case .failure(let error):
                 print(error)
                
            }
            
        }
        
    }

   
}
