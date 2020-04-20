//
//  SymbolsModel.swift
//  SwensonApp
//
//  Created by Ahmed Abdurrahman on 4/19/20.
//  Copyright © 2020 SwensonHe. All rights reserved.
//

import Foundation

struct SymbolsModel: BaseModel {

    var symbols: [String: String]?
    var error: ErrorModel?
}
