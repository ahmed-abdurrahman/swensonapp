//
//  CurrenciesViewController.swift
//  SwensonApp
//
//  Created by Ahmed Abdurrahman on 4/19/20.
//  Copyright © 2020 SwensonHe. All rights reserved.
//

import UIKit

import UIKit

protocol CurrenciesDelegate: class {

    func currenciesList(_ sender: CurrenciesViewController, didSelectBaseCurrency currency: String)
}

struct CurrenciesPresentation: Presentation {

    var cellsPresentations: [CurrencyCellPresentation] = []

    mutating func update(with state: CurrenciesState) {

        cellsPresentations = state.currencies.keys.sorted().map({

            let country = state.currencies[$0] ?? ""
            return CurrencyCellPresentation(country: country, currency: $0)
        })
    }
}

class CurrenciesViewController: UIViewController, StoryboardBased {

    static var storyboardName: String = "Main"

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!

    weak var delegate: CurrenciesDelegate?
    let viewModel = CurrenciesViewModel()
    var presentation = CurrenciesPresentation() {
        didSet {
            updateUI()
        }
    }

    override func viewDidLoad() {

        super.viewDidLoad()
        configureTableView()
        addChangeHandlers()
        viewModel.loadCurrencies()
    }

    private func configureTableView() {

        tableView.register(CurrencyTableViewCell.nib, forCellReuseIdentifier: "CurrencyTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 80.0
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
                self.showError()
            }
        }
    }

    private func updateUI() {

        tableView.reloadData()
    }
}

// MARK: - TableView Delegate & DataSource

extension CurrenciesViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return presentation.cellsPresentations.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell: CurrencyTableViewCell = tableView.dequeueReusableCell(withIdentifier: "CurrencyTableViewCell") as! CurrencyTableViewCell

        cell.presentation = presentation.cellsPresentations[indexPath.row]
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        DispatchQueue.main.async {
            let currency = self.presentation.cellsPresentations[indexPath.row].currency
            self.delegate?.currenciesList(self, didSelectBaseCurrency: currency)
        }
    }
}

