//
//  AnagramCheckerTests.swift
//  SwensonAppTests
//
//  Created by Ahmed Abdurrahman on 4/18/20.
//  Copyright © 2020 SwensonHe. All rights reserved.
//

import XCTest
@testable import SwensonApp

class AnagramCheckerTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testIsEmptyStringsAnagrams() {

       XCTAssert(AnagramChecker.isAnagrams("", ""), "Empty strings are anagrams")
    }

    func testAnagrams() {

        XCTAssert(AnagramChecker.isAnagrams("123", "123"), "Equal strings should be anagrams anagrams")

        XCTAssert(AnagramChecker.isAnagrams("debit card", "bad credit"), "Equal strings should be anagrams anagrams")
    }

}
