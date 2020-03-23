//
//  Network.swift
//  IceCreamParlor
//
//  Created by Roy Quesada on 3/23/20.
//  Copyright © 2020 Roy Quesada. All rights reserved.
//

import Alamofire

class Network {
    
    //Server
    static let baseUrl = "https://gl-endpoint.herokuapp.com"
    
    //Services
    static let products = "/products"
    
    static func requestData(url:String, completion:@escaping(([Product]?) ->Void)){
        let completeUrl = "\(baseUrl)\(products)"
        AF.request(completeUrl, method: .get).responseDecodable(of: Array<Product>.self) { (response) in
            if let products = response.value {
                completion(products)
            }else{
                completion(nil)
            }
        }
    }
}
