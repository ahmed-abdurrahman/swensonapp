//
//  Reusable.swift
//  SwensonApp
//
//  Created by Ahmed Abdurrahman on 4/19/20.
//  Copyright © 2020 SwensonHe. All rights reserved.
//

import Foundation
import UIKit

/// Protocol to conform when supplying a reuse identifier
public protocol Reusable {

    static var reuseIdentifier: String { get }
    var reuseIdentifier: String { get }
}

public extension Reusable {

    static var reuseIdentifier: String {

        return String(describing: self)
    }

    var reuseIdentifier: String {

        return type(of: self).reuseIdentifier
    }
}
