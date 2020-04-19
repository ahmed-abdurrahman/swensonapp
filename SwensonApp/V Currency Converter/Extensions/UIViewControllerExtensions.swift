//
//  UIViewControllerExtensions.swift
//  SwensonApp
//
//  Created by Ahmed Abdurrahman on 4/19/20.
//  Copyright © 2020 SwensonHe. All rights reserved.
//

import Foundation
import UIKit

public extension UIViewController {

    func isModal() -> Bool {

        if let navigationController = navigationController {
            if navigationController.viewControllers.first != self {
                return false
            }
        }

        if presentingViewController != nil {
            return true
        }

        if navigationController?.presentingViewController?.presentedViewController == navigationController {
            return true
        }

        if tabBarController?.presentingViewController is UITabBarController {
            return true
        }

        return false
    }
}
