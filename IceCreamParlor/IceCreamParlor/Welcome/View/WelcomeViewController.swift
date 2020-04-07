//
//  ViewController.swift
//  IceCreamParlor
//
//  Created by Roy Quesada on 3/23/20.
//  Copyright © 2020 Roy Quesada. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class WelcomeViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    var viewModel = WelcomeViewModel()
    let disposable = DisposeBag()
    
    @IBOutlet weak var orderBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: false)
        
        collectionView.register(UINib(nibName: "ProductCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: String(describing: ProductCollectionViewCell.self))
        collectionView.allowsMultipleSelection = true
        setupBindings()
        viewModel.getProducts()
    }
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if (segue.identifier == "receiptSegue") {
            //Wire data
            let vc = segue.destination as? ReceiptViewController
            vc?.viewModel.cart = viewModel.cartModel
        }
    }
    
    private func setupBindings(){
        viewModel
            .products
            .observeOn(MainScheduler.instance)
            .bind(to: collectionView.rx.items(cellIdentifier: "ProductCollectionViewCell", cellType: ProductCollectionViewCell.self)){ [unowned self] (row,product,cell) in
                cell.product = product
                let count = self.getCountby(model: product)
                let high = count == 0 ? false : true
                cell.setHigh(high, count: count)
        }.disposed(by: disposable)
        
        Observable.zip(collectionView.rx.itemSelected, collectionView.rx.modelSelected(Product.self))
            .bind{ [unowned self] indexpath, model in
                self.touchCell(indexPath: indexpath, model: model)
            }.disposed(by: disposable)
        
        
        Observable.zip(collectionView.rx.itemDeselected, collectionView.rx.modelDeselected(Product.self))
            .bind{ [unowned self] indexpath, model in
                self.touchCell(indexPath: indexpath, model: model)
        }.disposed(by: disposable)
    }
    
    func touchCell(indexPath:IndexPath, model:Product){
        print("click in cell")
        
        let productIndex = viewModel.cartModel.firstIndex(where: { $0.uuid == model.uuid})
        
        if productIndex == nil{
            viewModel.cartModel.append(CartItem(uuid: model.uuid, name1: model.name1, name2: model.name2,  price: model.price, count: 1))
            self.setBadge(index: indexPath, count: 1)
        }else{
            guard let index = productIndex else{ return }
            var productModel = viewModel.cartModel[index]
            
            if productModel.count == 1{
               productModel.count = 2
                viewModel.cartModel[index] = productModel
                self.setBadge(index: indexPath, count: 2)
            }else{
                viewModel.cartModel.remove(at: index)
                self.setBadge(index: indexPath, count: 0)
            }
        }
    }
    
    func getCountby(model:Product) -> Int{
        let productIndex = viewModel.cartModel.firstIndex(where: { $0.name1 == model.name1})
        if productIndex == nil{
            return 0
        }else{
            guard let index = productIndex else{ return 0}
            let productModel = viewModel.cartModel[index]
            return productModel.count
        }
    }
    
    func setBadge(index:IndexPath, count:Int){
        let cell = (self.collectionView.cellForItem(at: index) as! ProductCollectionViewCell)
        let high = count == 0 ? false : true
        cell.setHigh(high, count: count)
    }
    
    
    @IBAction func orderHandler(_ sender: Any) {
        self.performSegue(withIdentifier: "receiptSegue", sender: nil)
    }
}

