//
//  Pokemon.swift
//  PairProject
//
//  Created by Jane Zhu on 1/9/19.
//  Copyright © 2019 JaneZhu. All rights reserved.
//

import Foundation

struct Pokemon: Codable {
    let cards: [PokemonCardsWrapper]
}

struct PokemonCardsWrapper: Codable {
    let imageUrl: String
    let imageUrlHiRes: String
    let attacks: [AttacksWrapper]
}

struct AttacksWrapper: Codable {
    let name: String
    let damage: String
    let text: String
}
