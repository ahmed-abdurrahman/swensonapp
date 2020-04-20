//
//  ConverterViewController.swift
//  SwensonApp
//
//  Created by Ahmed Abdurrahman on 4/19/20.
//  Copyright © 2020 SwensonHe. All rights reserved.
//

import Foundation
import UIKit

struct ConverterPresentation: Presentation {

    var fromCurrency: String = ""
    var toCurrency: String = ""
    var convertedAmount: String = ""

    mutating func update(with state: ConverterState) {

        fromCurrency = state.fromCurrency
        toCurrency = state.toCurrency
        convertedAmount = "\(state.convertedAmount)"
    }
}

class ConverterViewController: UIViewController, StoryboardBased {

    static var storyboardName: String = "Main"

    @IBOutlet weak var fromCurrencyLabel: UILabel!
    @IBOutlet weak var toCurrencyLabel: UILabel!
    @IBOutlet weak var fromAmountField: UITextField! {
        didSet {
            fromAmountField?.addDoneCancelToolbar(
                onDone: (target: self, action: #selector(convertAmount)),
                doneTitle: "CONVERT"
            )
        }
    }
    @IBOutlet weak var toAmountField: UITextField!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!

    var viewModel: ConverterViewModel!
    var presentation: ConverterPresentation! {
        didSet {
            updateUI()
        }
    }

    override func viewDidLoad() {

        super.viewDidLoad()
        presentation = ConverterPresentation(
            fromCurrency: viewModel.state.fromCurrency,
            toCurrency: viewModel.state.toCurrency,
            convertedAmount: ""
        )
        configureTableView()
        addChangeHandlers()
        fromAmountField.becomeFirstResponder()
    }

    private func updateUI() {

        toAmountField.text = presentation.convertedAmount
        fromCurrencyLabel.text = presentation.fromCurrency
        toCurrencyLabel.text = presentation.toCurrency
    }

    private func configureTableView() {

    }

    private func addChangeHandlers() {

        viewModel.addChangeHandler { [weak self] change in

            guard let self = self else { return }

            switch change {
            case .loading:
                self.activityIndicator.startAnimating()
            case .loaded:
                self.activityIndicator.stopAnimating()
                self.presentation.update(with: self.viewModel.state)
            case .failed(let error):
                self.activityIndicator.stopAnimating()
                self.showError(message: error)
            }
        }
    }

    @objc func convertAmount() {

        viewModel.convertAmount(fromAmountField.text ?? "1.0")
        self.view.endEditing(true)
    }
}
