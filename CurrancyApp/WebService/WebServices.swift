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
              //   print(currencies)
                 completion(currencies)
            case .failure(let error):
                print(error)
                
            }
            
        }
        
    }

   
}
