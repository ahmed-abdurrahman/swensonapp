//
//  APIClient.swift
//  SwensonApp
//
//  Created by Ahmed Abdurrahman on 4/19/20.
//  Copyright © 2020 SwensonHe. All rights reserved.
//

import Foundation
import Alamofire

class APIClient {

    enum Constants {

        static let baseApiUrl = "http://data.fixer.io/api/"
        static let defaultParameters = [
            "access_key": "52a0e68207a79a986118dfb96e73d1b9"
        ]
    }

    @discardableResult
    static func performRequest<T: Decodable>(
        route: APIRoute,
        params: [String: String] = [:],
        completion: @escaping (Result<T, Error>)->Void) -> DataRequest {

        let parameters = params.merging(Constants.defaultParameters){(current,_) in current}
        return AF.request(
            Constants.baseApiUrl + route.rawValue,
            parameters: parameters
        ).responseDecodable(of: T.self) { response in

            if let error = response.error {
                completion(.failure(error))
                return
            }
            if let result = response.value {
                completion(.success(result))
            }
        }
    }
}
