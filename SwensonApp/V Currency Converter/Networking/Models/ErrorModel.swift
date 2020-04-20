//
//  ErrorModel.swift
//  SwensonApp
//
//  Created by Ahmed Abdurrahman on 4/20/20.
//  Copyright © 2020 SwensonHe. All rights reserved.
//

import Foundation

struct ErrorModel: Codable {

    let code: Int?
    let info: String?
    let type: String?
}
