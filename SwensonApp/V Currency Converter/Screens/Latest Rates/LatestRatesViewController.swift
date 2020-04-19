//
//  LatestRatesViewController.swift
//  SwensonApp
//
//  Created by Ahmed Abdurrahman on 4/19/20.
//  Copyright © 2020 SwensonHe. All rights reserved.
//

import Foundation
import UIKit

class LatestRatesViewController: UIViewController {

    let viewModel = LatestRatesViewModel()

    override func viewDidLoad() {

        super.viewDidLoad()
        addChangeHandlers()
        viewModel.loadLatestRates()
    }

    private func addChangeHandlers() {

        viewModel.addChangeHandler { [weak self] change in

            guard let self = self else { return }

            switch change {
            case .loading:
                break
            case .loaded:
                print(self.viewModel.state.rates)
            case .failed:
                break
            }
        }
    }
}
