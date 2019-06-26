//
//  ViewController.swift
//  testInterview
//
//  Created by Asanka on 6/17/19.
//  Copyright © 2019 Asanka. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var baseLbl: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet var viewModel: ViewModel!
    @IBOutlet var tableView: UITableView!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberofItemsInSection(section: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! currencyTableViewCell
        configureCell(cell: cell, forRawAtIndexPath: indexPath )
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.fetchCurrancy {
            DispatchQueue.main.async {
                self.tableView.reloadData()
                self.setBaseAndDate()
            }
        }
    }

    func configureCell(cell: currencyTableViewCell, forRawAtIndexPath indexPath:IndexPath){
        cell.typeLbl.text = viewModel.typeForItemAtIndexPath(indexPath: indexPath)
        cell.currencyLbl.text = viewModel.currncyForItemAtIndexPath(indexPath: indexPath)
    }
    
    func setBaseAndDate() {
        baseLbl.text = "Base Currancy : " + viewModel.getBaseType()
        dateLbl.text = viewModel.getDate()
    }
}

