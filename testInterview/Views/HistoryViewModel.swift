//
//  HistoryViewModel.swift
//  testInterview
//
//  Created by Asanka Gankewala on 6/26/19.
//  Copyright © 2019 Asanka. All rights reserved.
//

import UIKit

class HistoryViewModel: NSObject {

    @IBOutlet var currencyClient: CurrencyClient!
    var rates: NSDictionary = [:]
    
    func fetchCurrancy(dateTxt : String, completion:@escaping () -> ()) {
        currencyClient.fatchCurrenciesByDate(dateTxt: dateTxt) { currenies in
            self.rates = currenies
            completion()
        }
    }
    
    func numberofItemsInSection(section: Int) -> Int{
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
}
