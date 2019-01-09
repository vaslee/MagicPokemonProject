//
//  MagicAPIClient.swift
//  PairProject
//
//  Created by Jane Zhu on 1/9/19.
//  Copyright © 2019 JaneZhu. All rights reserved.
//

import Foundation

struct MagicAPIClient {
    static func getMagicCards(completionHandler: @escaping ((AppError?, Magic?) -> Void)) {
        NetworkHelper.shared.performDataTask(endpointURLString: "https://api.magicthegathering.io/v1/cards?contains=imageUrl") { (appError, data, httpResponse) in
            if let appError = appError {
                completionHandler(appError, nil)
            }
            guard let response = httpResponse, (200...299).contains(response.statusCode) else {
                let statusCode = httpResponse?.statusCode ?? -999
                completionHandler(AppError.badStatusCode(String(statusCode)), nil)
                return
            }
            if let data = data {
                do {
                    let magicData = try JSONDecoder().decode(Magic.self, from: data)
                    completionHandler(nil, magicData)
                } catch {
                    completionHandler(AppError.decodingError(error), nil)
                }
            }
        }
    }
}
