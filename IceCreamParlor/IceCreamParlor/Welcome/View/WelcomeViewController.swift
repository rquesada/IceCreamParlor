//
//  ViewController.swift
//  IceCreamParlor
//
//  Created by Roy Quesada on 3/23/20.
//  Copyright © 2020 Roy Quesada. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {

    var viewModel = WelcomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: false)
        
        viewModel.getProducts()
    }

    @IBAction func goHandler(_ sender: Any) {
        self.performSegue(withIdentifier: "receiptSegue", sender: nil)
    }
    
}

