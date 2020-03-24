//
//  ReceiptViewController.swift
//  IceCreamParlor
//
//  Created by Roy Quesada on 3/23/20.
//  Copyright © 2020 Roy Quesada. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class ReceiptViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var startBtn: UIButton!
    var viewModel  = ReceiptViewModel()
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupBinding()
    }
    
    func setupUI(){
        startBtn.layer.borderWidth = 2
        startBtn.layer.borderColor = UIColor.white.cgColor
    }
    
    @IBAction func startHandler(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    private func setupBinding(){
        tableView.register(UINib(nibName: "ReceiptTableViewCell", bundle: nil), forCellReuseIdentifier: String(describing: ReceiptTableViewCell.self))
        viewModel
            .cart
            .observeOn(MainScheduler.instance)
            .bind(to: tableView.rx.items(cellIdentifier: "ReceiptTableViewCell", cellType: ReceiptTableViewCell.self)) {  (row,cartItem,cell) in
            cell.textLabel?.text = cartItem.name1
        }.disposed(by: disposeBag)
    }

}
