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
        case failed
    }

    var baseCurrency: String = "EUR"
    var rates: [String: Double] = [:]
}

class LatestRatesViewModel: StatefulViewModel<LatestRatesState.Change> {

    var state = LatestRatesState()

    func loadLatestRates() {

        emit(change: .loading)
        let params: [String: Any] = [
            "access_key": "52a0e68207a79a986118dfb96e73d1b9"
        ]
        AF.request("http://data.fixer.io/api/latest",
                   parameters: params)
            .responseDecodable(of: LatestRatesModel.self) { [weak self] response in

            guard let self = self,
                let rates = response.value?.rates else {
                return
            }

            self.state.rates = rates
            self.emit(change: .loaded)
        }
    }
}
