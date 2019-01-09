//
//  Magic.swift
//  PairProject
//
//  Created by Jane Zhu on 1/9/19.
//  Copyright © 2019 JaneZhu. All rights reserved.
//

import Foundation

struct Magic: Codable {
    let cards: [CardsWrapper]
}

struct CardsWrapper: Codable {
    let name: String
    let imageUrl: String?
    let text: String
    let foreignNames: [ForeignNamesrapper]
}

struct ForeignNamesrapper: Codable {
    let name: String
    let text: String
    let imageUrl: String
    let language: String
}
