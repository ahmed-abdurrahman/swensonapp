//
//  RateTableViewCell.swift
//  SwensonApp
//
//  Created by Ahmed Abdurrahman on 4/19/20.
//  Copyright © 2020 SwensonHe. All rights reserved.
//

import Foundation
import UIKit

struct RateCellPresentation: Presentation {

    let currencyCode: String
    let rate: String
}

class RateTableViewCell: UITableViewCell, NibLoadable {

    @IBOutlet weak var currencyCodeLabel: UILabel!
    @IBOutlet weak var rateLabel: UILabel!

    var presentation: RateCellPresentation? {
        didSet {
            updateUI()
        }
    }

    func updateUI() {

        currencyCodeLabel.text = presentation?.currencyCode
        rateLabel.text = presentation?.rate
    }
}
