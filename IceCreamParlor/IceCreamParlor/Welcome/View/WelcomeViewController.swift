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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: false)
        
        collectionView.register(UINib(nibName: "ProductCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: String(describing: ProductCollectionViewCell.self))
        
        setupBindings()
        viewModel.getProducts()
    }
    
    private func setupBindings(){
        viewModel
            .products
            .observeOn(MainScheduler.instance)
            .bind(to: collectionView.rx.items(cellIdentifier: "ProductCollectionViewCell", cellType: ProductCollectionViewCell.self)){ (row,product,cell) in
                print("new cell")
                cell.product = product
        }.disposed(by: disposable)
    }

    @IBAction func goHandler(_ sender: Any) {
        self.performSegue(withIdentifier: "receiptSegue", sender: nil)
    }
    
}

