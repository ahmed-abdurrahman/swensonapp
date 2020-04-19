//
//  CurrenciesViewModel.swift
//  SwensonApp
//
//  Created by Ahmed Abdurrahman on 4/19/20.
//  Copyright © 2020 SwensonHe. All rights reserved.
//

import Foundation
import Alamofire

struct CurrenciesState {

    enum Change: StateChange {

        case loading
        case loaded
        case failed(error: String)
    }

    var currencies: [String: String] = [:]
}

class CurrenciesViewModel: StatefulViewModel<CurrenciesState.Change> {

    var state = CurrenciesState()

    func loadCurrencies() {

        emit(change: .loading)
        APIClient.performRequest(
            route: .symbols
        ) { [weak self] (result: Result<SymbolsModel, Error>) in

                guard let self = self else { return }
                switch result {
                case .success(let symbols):
                    self.state.currencies = symbols.symbols ?? [:]
                    self.emit(change: .loaded)
                case .failure(let error):
                    self.emit(change: .failed(error: error.localizedDescription))
                }
        }
    }
}
