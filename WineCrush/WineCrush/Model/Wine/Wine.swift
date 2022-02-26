//
//  Wine.swift
//  WineCrush
//
//  Created by Adam Mabrouki on 21/02/2022.
//

import Foundation

// MARK: - WineMatch
struct WineMatch: Codable {
    let pairedWines: [String]
    let pairingText: String
    let productMatches: [ProductMatch]
}

// MARK: - ProductMatch
struct ProductMatch: Codable {
    let id: Int
    let title, productMatchDescription, price: String
    let imageURL: String
    let averageRating: Double
    let ratingCount: Int
    let score: Double
    let link: String

    enum CodingKeys: String, CodingKey {
        case id, title
        case productMatchDescription = "description"
        case price
        case imageURL = "imageUrl"
        case averageRating, ratingCount, score, link
    }
}
