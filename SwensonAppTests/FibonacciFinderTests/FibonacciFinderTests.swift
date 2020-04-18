//
//  FibonacciFinderTests.swift
//  SwensonAppTests
//
//  Created by Ahmed Abdurrahman on 4/18/20.
//  Copyright © 2020 SwensonHe. All rights reserved.
//

import XCTest
@testable import SwensonApp

class FibonacciFinderTests: XCTestCase {

    func testIterativeInitialsFibonacciValues() {

        let nZero = FibonacciFinder.findNthFibonacciNumberIterative(n: 0)
        let nOne = FibonacciFinder.findNthFibonacciNumberIterative(n: 1)

        XCTAssertEqual(nZero, 0, "First Fibonacci number must equal 0")
        XCTAssertEqual(nOne, 1, "Second Fibonacci number must equal 1")
    }
}
