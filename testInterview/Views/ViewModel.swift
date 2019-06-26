//
//  ViewModel.swift
//  testInterview
//
//  Created by Asanka on 6/18/19.
//  Copyright © 2019 Asanka. All rights reserved.
//

import UIKit

class ViewModel: NSObject {

    @IBOutlet var currencyClient: CurrencyClient!
    var movies: [NSDictionary] = []
    var currenies: currencyObj!
    var rates: NSDictionary = [:]
    
    func fetchCurrancy(completion:@escaping () -> ()) {
        currencyClient.fatchLatestCurrencies { currenies in
            self.currenies = currenies!
            self.rates = self.currenies.rates
            completion()
        }
    }
    
    func numberofItemsInSection(section: Int) -> Int {
        return rates.count
    }
    
    func typeForItemAtIndexPath(indexPath: IndexPath) -> String {
        let keys = self.rates.allKeys
        print(keys)
        return keys[indexPath.row] as! String
    }
    
    func currncyForItemAtIndexPath(indexPath: IndexPath) -> String {
        let values = self.rates.allValues
        print(values)
        return String(format: "%@", values[indexPath.row] as! CVarArg)
    }
    func getBaseType() -> String {
        return self.currenies!.base
    }
    func getDate() -> String {
        return self.currenies!.date
    }
}



