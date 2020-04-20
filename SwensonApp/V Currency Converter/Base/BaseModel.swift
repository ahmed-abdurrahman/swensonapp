//
//  BaseModel.swift
//  SwensonApp
//
//  Created by Ahmed Abdurrahman on 4/20/20.
//  Copyright © 2020 SwensonHe. All rights reserved.
//

import Foundation

protocol BaseModel: Codable {

    var error: ErrorModel? { get }
}
