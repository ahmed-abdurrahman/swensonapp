//
//  CurrencyTableViewCell.swift
//  SwensonApp
//
//  Created by Ahmed Abdurrahman on 4/19/20.
//  Copyright © 2020 SwensonHe. All rights reserved.
//

import Foundation
import UIKit

struct CurrencyCellPresentation: Presentation {

    let country: String
    let currency: String
}

class CurrencyTableViewCell: UITableViewCell, NibLoadable {

    @IBOutlet weak var currencyCodeLabel: UILabel!
    @IBOutlet weak var countryCodeLabel: UILabel!

    var presentation: CurrencyCellPresentation? {
        didSet {
            updateUI()
        }
    }

    func updateUI() {

        currencyCodeLabel.text = presentation?.currency
        countryCodeLabel.text = presentation?.country
    }
}
