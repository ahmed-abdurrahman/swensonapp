//
//  LatestRatesViewModel.swift
//  SwensonApp
//
//  Created by Ahmed Abdurrahman on 4/19/20.
//  Copyright © 2020 SwensonHe. All rights reserved.
//

import Foundation
import Alamofire

struct LatestRatesState {

    enum Change: StateChange {

        case loading
        case loaded
        case failed(error: Error)
    }

    var baseCurrency: String = "EUR"
    var rates: [String: Double] = [:]
}

class LatestRatesViewModel: StatefulViewModel<LatestRatesState.Change> {

    var state = LatestRatesState()

    func loadLatestRates() {

        emit(change: .loading)
        APIClient.performRequest(
            route: .latest,
            params: ["base": state.baseCurrency]) { [weak self] (result: Result<LatestRatesModel, Error>) in

                guard let self = self else { return }
                switch result {
                case .success(let rates):
                    self.state.rates = rates.rates ?? [:]
                    self.emit(change: .loaded)
                case .failure(let error):
                    self.emit(change: .failed(error: error))
                }
        }
    }
}
