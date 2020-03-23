//
//  CartItem.swift
//  IceCreamParlor
//
//  Created by Roy Quesada on 3/23/20.
//  Copyright © 2020 Roy Quesada. All rights reserved.
//

import Foundation

struct CartItem{
    let name, price :String
    var count: Int
    
    init(name:String, price:String, count:Int) {
        self.name = name
        self.price = price
        self.count = count
    }
}
