//
//  ProductCollectionViewCell.swift
//  IceCreamParlor
//
//  Created by Roy Quesada on 3/23/20.
//  Copyright © 2020 Roy Quesada. All rights reserved.
//

import UIKit

class ProductCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var borderView: UIView!
    @IBOutlet weak var circleView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    public var product:Product!{
        didSet{
            circleView.backgroundColor = UIColor(hex: "\(product.bg_color)FF")
            imageView.image = UIImage(named: product.type)
            nameLabel.text = "\(product.name1) \(product.name2)"
            priceLabel.text = product.price
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    func setupUI(){
        //Border
        borderView.layer.borderWidth = 1
        borderView.layer.borderColor = UIColor.gray.cgColor
        
        //UI
        //circleView.backgroundColor = .red
        circleView.layer.cornerRadius = 65
    }

}
