//
//  Product.swift
//  IceCreamParlor
//
//  Created by Roy Quesada on 3/23/20.
//  Copyright © 2020 Roy Quesada. All rights reserved.
//

import Foundation

struct Product: Decodable{
    let uuid, name1, name2, price, bgColor, type :String
    
    enum CodingKeys:String, CodingKey {
        case name1 = "name1"
        case name2
        case price
        case bgColor = "bg_color"
        case type
    }
}

extension Product {
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name1 = try values.decode(String.self, forKey: .name1)
        name2 = try values.decode(String.self, forKey: .name2)
        price = try values.decode(String.self, forKey: .price)
        bgColor = try values.decode(String.self, forKey: .bgColor)
        type = try values.decode(String.self, forKey: .type)
        uuid = UUID().uuidString
    }
}
