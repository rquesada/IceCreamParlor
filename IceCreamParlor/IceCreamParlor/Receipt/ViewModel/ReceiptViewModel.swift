//
//  ReceiptViewModel.swift
//  IceCreamParlor
//
//  Created by Roy Quesada on 3/23/20.
//  Copyright © 2020 Roy Quesada. All rights reserved.
//

import Foundation
import RxSwift
import  RxCocoa

class ReceiptViewModel {
    var total:Double?
    public var cart = PublishSubject<[CartItem]>()
}
