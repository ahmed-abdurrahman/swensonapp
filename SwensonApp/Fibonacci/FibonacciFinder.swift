//
//  FibonacciFinder.swift
//  SwensonApp
//
//  Created by Ahmed Abdurrahman on 4/18/20.
//  Copyright © 2020 SwensonHe. All rights reserved.
//

import Foundation

class FibonacciFinder {

    static func findNthFibonacciNumberIterative(n: Int) -> Int {

        guard n >= 0 else { return -1 }
        guard n > 1 else { return n }

        var nMinus2 = 0
        var nMinus1 = 1
        for _ in 2..<n {

            let newNMinus2 = nMinus1
            nMinus1 = nMinus2 + nMinus1
            nMinus2 = newNMinus2
        }

        return nMinus1 + nMinus2
    }

    static func findNthFibonacciNumberRecursive(n: Int) -> Int {

        guard n >= 0 else { return -1 }
        guard n > 1 else { return n }

        return 0
    }
}
