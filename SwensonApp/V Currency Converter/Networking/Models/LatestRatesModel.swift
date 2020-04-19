//
//  LatestRatesModel.swift
//  SwensonApp
//
//  Created by Ahmed Abdurrahman on 4/19/20.
//  Copyright © 2020 SwensonHe. All rights reserved.
//

import Foundation

struct LatestRatesModel: Codable {

    var base: String?
    var date: String?
    var rates: [String: Double]?
}

