//
//  ConverterRouter.swift
//  SwensonApp
//
//  Created by Ahmed Abdurrahman on 4/19/20.
//  Copyright © 2020 SwensonHe. All rights reserved.
//

import Foundation
import UIKit

protocol ConverterRouter: Router {

    static func routeToConverter(
        from context: UIViewController,
        fromCurrency: String,
        toCurrency: String
    )
}

extension ConverterRouter {

    static func routeToConverter(
        from context: UIViewController,
        fromCurrency: String,
        toCurrency: String
    ) {

        let controller = ConverterViewController.instantiate()
        controller.viewModel = ConverterViewModel(
            fromCurrency: fromCurrency,
            toCurrency: toCurrency
        )
        present(controller, from: context, animated: true)
    }
}

extension AppRouter: ConverterRouter {}
