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
        cellsPresentations = state.rates.keys.map({

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
            case .failed:
                self.activityIndicator.stopAnimating()
            }
        }
    }

    private func updateUI() {

        tableView.reloadData()
        baseCurrencyButton.setTitle(presentation.baseCurrency, for: .normal)
    }

    @IBAction func didTapBaseCurrency() {

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
}
