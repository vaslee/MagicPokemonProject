//
//  PokemonAPIClient.swift
//  PairProject
//
//  Created by Jane Zhu on 1/9/19.
//  Copyright © 2019 JaneZhu. All rights reserved.
//

import Foundation

struct PokemonAPIClient {
    static func getPokemonCards(completionHandler: @escaping ((AppError?, Pokemon?) -> Void)) {
        NetworkHelper.shared.performDataTask(endpointURLString: "https://api.pokemontcg.io/v1/cards?contains=imageUrl,imageUrlHiRes,attacks") { (appError, data, httpResponse) in
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
                    let pokemonData = try JSONDecoder().decode(Pokemon.self, from: data)
                    completionHandler(nil, pokemonData)
                } catch {
                    completionHandler(AppError.decodingError(error), nil)
                }
            }
        }
    }
}
