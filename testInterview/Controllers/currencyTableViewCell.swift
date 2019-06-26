//
//  currencyTableViewCell.swift
//  testInterview
//
//  Created by Asanka Gankewala on 6/28/19.
//  Copyright © 2019 Asanka. All rights reserved.
//

import Foundation
import UIKit

class currencyTableViewCell: UITableViewCell {
    @IBOutlet weak var typeLbl: UILabel!
    @IBOutlet weak var currencyLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
