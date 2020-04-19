//
//  BundleDefinable.swift
//  SwensonApp
//
//  Created by Ahmed Abdurrahman on 4/19/20.
//  Copyright © 2020 SwensonHe. All rights reserved.
//

import Foundation

/// Protocol to conform when bundle should be specified
public protocol BundleDefinable {

    static var bundle: Bundle { get }
}

extension BundleDefinable {

    public static var bundle: Bundle {
        return Bundle.main
    }
}
