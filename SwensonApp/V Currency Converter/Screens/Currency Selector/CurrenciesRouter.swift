//
//  CurrenciesRouter.swift
//  SwensonApp
//
//  Created by Ahmed Abdurrahman on 4/19/20.
//  Copyright © 2020 SwensonHe. All rights reserved.
//

import Foundation
import UIKit

protocol CurrenciesRouter: Router {

    static func routeToCurrenciesList(
        from context: UIViewController,
        delegate: CurrenciesDelegate
    )
}

extension CurrenciesRouter {

    static func routeToCurrenciesList(
        from context: UIViewController,
        delegate: CurrenciesDelegate
    ) {

        let controller = CurrenciesViewController.instantiate()
        controller.delegate = delegate
        present(controller, from: context, animated: true)
    }
}

extension AppRouter: CurrenciesRouter {}
