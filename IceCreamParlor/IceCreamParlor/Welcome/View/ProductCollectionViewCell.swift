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
    @IBOutlet weak var badgeContainer: UIView!
    @IBOutlet weak var badgeLabel: UILabel!
    
    public var product:Product!{
        didSet{
            circleView.backgroundColor = UIColor(hex: "\(product.bgColor)FF")
            imageView.image = UIImage(named: product.type)
            nameLabel.text = "\(product.name1) \(product.name2)"
            priceLabel.text = product.price
        }
    }
    
    override func prepareForReuse() {
        badgeContainer.isHidden = true
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    func setHigh(_ highlight:Bool, count:Int){
        if highlight {
            borderView.layer.borderWidth = 3
            borderView.layer.borderColor = UIColor(displayP3Red: 129/255, green: 212/255, blue: 214/255, alpha: 1).cgColor
        } else {
            borderView.layer.borderWidth = 1
            borderView.layer.borderColor = UIColor.gray.cgColor
        }
        
        //Badge
        if count == 0{
            badgeContainer.isHidden = true
        }else{
            badgeContainer.isHidden = false
            badgeLabel.text = "\(count)"
        }
    }
    
    func setupUI(){
        //Border
        borderView.layer.borderWidth = 1
        borderView.layer.borderColor = UIColor.gray.cgColor
        
        //Circle
        circleView.layer.cornerRadius = 65
        
        //Badge
        badgeContainer.layer.cornerRadius = 10
    }

}
