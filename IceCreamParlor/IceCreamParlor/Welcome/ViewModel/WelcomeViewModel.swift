//
//  WelcomeViewModel.swift
//  IceCreamParlor
//
//  Created by Roy Quesada on 3/23/20.
//  Copyright © 2020 Roy Quesada. All rights reserved.
//

import RxSwift

class WelcomeViewModel {
    
    public let products : PublishSubject<[Product]> = PublishSubject()
    
    func getProducts(){
        Network.requestData(url: Network.products, completion: { result in
            if let products = result{
                print("count = \(products.count)")
                self.products.onNext(products)
            }
        } )
    }
}
