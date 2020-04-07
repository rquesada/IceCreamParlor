//
//  CartItem.swift
//  IceCreamParlor
//
//  Created by Roy Quesada on 3/23/20.
//  Copyright © 2020 Roy Quesada. All rights reserved.
//

import Foundation

struct CartItem{
    let uuid, name1, name2, price :String
    var count: Int
    
    init(uuid: String, name1:String, name2: String ,price:String, count:Int) {
        self.uuid = uuid
        self.name1 = name1
        self.name2 = name2
        self.price = price
        self.count = count
    }
}
