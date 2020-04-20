//
//  LatestRatesModel.swift
//  SwensonApp
//
//  Created by Ahmed Abdurrahman on 4/19/20.
//  Copyright © 2020 SwensonHe. All rights reserved.
//

import Foundation

struct LatestRatesModel: BaseModel {

    var base: String?
    var date: String?
    var rates: [String: Double]?
    var error: ErrorModel?
}

