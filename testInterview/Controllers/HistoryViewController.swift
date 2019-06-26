//
//  HistoryViewController.swift
//  testInterview
//
//  Created by Asanka Gankewala on 6/26/19.
//  Copyright © 2019 Asanka. All rights reserved.
//

import UIKit

class HistoryViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet var historyViewModel: HistoryViewModel!
    @IBOutlet weak var dateText: UITextField!
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func searchActionButton(_ sender: Any) {
        historyViewModel.fetchCurrancy(dateTxt: dateText.text!) {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return historyViewModel.numberofItemsInSection(section: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "historyCell", for: indexPath)  as! historyTableViewCell
        configureCell(cell: cell, forRawAtIndexPath: indexPath )
        return cell
    }
    
    func configureCell(cell: historyTableViewCell, forRawAtIndexPath indexPath:IndexPath){
        cell.typeLbl.text = historyViewModel.typeForItemAtIndexPath(indexPath: indexPath)
        cell.currencyLbl.text = historyViewModel.currncyForItemAtIndexPath(indexPath: indexPath)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
