//
//  LatestRatesViewController.swift
//  SwensonApp
//
//  Created by Ahmed Abdurrahman on 4/19/20.
//  Copyright © 2020 SwensonHe. All rights reserved.
//

import Foundation
import UIKit

struct LatestRatesPresentation: Presentation {

    var cellsPresentations: [RateCellPresentation] = []
    var baseCurrency: String = ""

    mutating func update(with state: LatestRatesState) {

        baseCurrency = state.baseCurrency
        cellsPresentations = state.rates.keys.sorted().map({

            let rate = state.rates[$0] ?? 0.0
            let formatted = String(format: "%.2f", rate)
            return RateCellPresentation(currencyCode: $0, rate: formatted)
        })
    }
}

class LatestRatesViewController: UIViewController {

    @IBOutlet weak var baseCurrencyButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!

    let viewModel = LatestRatesViewModel()
    var presentation = LatestRatesPresentation() {
        didSet {
            updateUI()
        }
    }

    override func viewDidLoad() {

        super.viewDidLoad()
        configureTableView()
        addChangeHandlers()
        viewModel.loadLatestRates()
    }

    private func configureTableView() {

        tableView.register(RateTableViewCell.nib, forCellReuseIdentifier: "RateTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
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

    private func updateUI() {

        tableView.reloadData()
        baseCurrencyButton.setTitle(presentation.baseCurrency, for: .normal)
    }

    @IBAction func didTapBaseCurrency() {

        AppRouter.routeToCurrenciesList(from: self, delegate: self)
    }
}

// MARK: - TableView Delegate & DataSource

extension LatestRatesViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return presentation.cellsPresentations.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell: RateTableViewCell = tableView.dequeueReusableCell(withIdentifier: "RateTableViewCell") as! RateTableViewCell

        cell.presentation = presentation.cellsPresentations[indexPath.row]
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        DispatchQueue.main.async {

            let fromCurrency = self.viewModel.state.baseCurrency
            let toCurrency = self.presentation.cellsPresentations[indexPath.row].currencyCode
            self.tableView.deselectRow(at: indexPath, animated: true)
            AppRouter.routeToConverter(
                from: self,
                fromCurrency: fromCurrency,
                toCurrency: toCurrency
            )
        }
    }
}

// MARK: - CurrenciesDelegate

extension LatestRatesViewController: CurrenciesDelegate {

    func currenciesList(
        _ sender: CurrenciesViewController,
        didSelectBaseCurrency currency: String) {

        dismiss(animated: true)
        viewModel.setBaseCurrency(currency)
    }
}
