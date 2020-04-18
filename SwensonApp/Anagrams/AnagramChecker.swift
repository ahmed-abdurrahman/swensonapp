//
//  AnagramChecker.swift
//  SwensonApp
//
//  Created by Ahmed Abdurrahman on 4/18/20.
//  Copyright © 2020 SwensonHe. All rights reserved.
//

import Foundation

class AnagramChecker {

    static func isAnagrams(_ string1: String, _ string2: String) -> Bool {

        let sorted1 = string1.replacingOccurrences(of: " ", with: "") .sorted()
        let sorted2 = string2.replacingOccurrences(of: " ", with: "") .sorted()

        return sorted1 == sorted2
    }
}
