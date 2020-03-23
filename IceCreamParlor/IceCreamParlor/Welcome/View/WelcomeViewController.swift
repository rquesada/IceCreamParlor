//
//  ViewController.swift
//  IceCreamParlor
//
//  Created by Roy Quesada on 3/23/20.
//  Copyright © 2020 Roy Quesada. All rights reserved.
//

import UIKit
import RxSwift

class WelcomeViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    var viewModel = WelcomeViewModel()
    let disposable = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: false)
        setupBindings()
        viewModel.getProducts()
    }
    
    private func setupBindings(){
        /*viewModel
            .products
            .observeOn(MainScheduler.instance)
            .bind(to:)*/
    }

    @IBAction func goHandler(_ sender: Any) {
        self.performSegue(withIdentifier: "receiptSegue", sender: nil)
    }
    
}

