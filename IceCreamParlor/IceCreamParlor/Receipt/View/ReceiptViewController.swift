//
//  ReceiptViewController.swift
//  IceCreamParlor
//
//  Created by Roy Quesada on 3/23/20.
//  Copyright © 2020 Roy Quesada. All rights reserved.
//

import UIKit

class ReceiptViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var startBtn: UIButton!
    var viewModel  = ReceiptViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "ReceiptTableViewCell", bundle: nil), forCellReuseIdentifier: String(describing: ReceiptTableViewCell.self))
        setupUI()
    }
    
    func setupUI(){
        startBtn.layer.borderWidth = 2
        startBtn.layer.borderColor = UIColor.white.cgColor
    }
    
    @IBAction func startHandler(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    // MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.cart.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReceiptTableViewCell", for: indexPath) as! ReceiptTableViewCell
        let item = viewModel.cart[indexPath.row]
        cell.nameLbl.text = "\(item.name1) \(item.name2)"
        cell.priceLabel.text = item.price
        return cell
    }
}
