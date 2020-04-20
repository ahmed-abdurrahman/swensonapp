//
//  DateExtensions.swift
//  SwensonApp
//
//  Created by Ahmed Abdurrahman on 4/20/20.
//  Copyright © 2020 SwensonHe. All rights reserved.
//

import Foundation

extension Date {

    func string(format: String = "yyyy-MM-dd") -> String {

        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
}
