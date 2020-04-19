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

    // MARK: - Iterative Tests

    func testIterativeInitialsFibonacciValues() {

        let nZero = FibonacciFinder.findNthFibonacciNumberIterative(n: 0)
        let nOne = FibonacciFinder.findNthFibonacciNumberIterative(n: 1)

        XCTAssertEqual(nZero, 0, "First Fibonacci number must equal 0")
        XCTAssertEqual(nOne, 1, "Second Fibonacci number must equal 1")
    }

    func testIterativeFibonacciValues() {

        let nNine = FibonacciFinder.findNthFibonacciNumberIterative(n: 9)
        let nFive = FibonacciFinder.findNthFibonacciNumberIterative(n: 5)

        XCTAssertEqual(nNine, 34, "9th Fibonacci number must equal 34")
        XCTAssertEqual(nFive, 5, "5th Fibonacci number must equal 5")
    }

    // MARK: - Recursive Tests

    func testRecursiveInitialsFibonacciValues() {

        let nZero = FibonacciFinder.findNthFibonacciNumberRecursive(n: 0)
        let nOne = FibonacciFinder.findNthFibonacciNumberRecursive(n: 1)

        XCTAssertEqual(nZero, 0, "First Fibonacci number must equal 0")
        XCTAssertEqual(nOne, 1, "Second Fibonacci number must equal 1")
    }
}
