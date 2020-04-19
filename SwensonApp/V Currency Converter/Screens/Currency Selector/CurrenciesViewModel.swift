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
        case failed
    }

    var currencies: [String: String]
}

class CurrenciesViewModel: StatefulViewModel<CurrenciesState.Change> {

    func loadCurrencies() {

        let params: [String: Any] = [
            "access_key": "52a0e68207a79a986118dfb96e73d1b9"
        ]
        AF.request("http://data.fixer.io/api/symbols", parameters: params).responseDecodable(of: SymbolsModel.self) { response in

            guard let symbols = response.value else {
                return
            }

            symbols.symbols?.forEach({
                print($0)
                print($1)
            })
        }
    }
}
