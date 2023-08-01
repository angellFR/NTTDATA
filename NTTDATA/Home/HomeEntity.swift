//
//  HomeEntity.swift
//  NTTDATA
//
//  Created by Luis Fernando Flores Rivera on 31/07/23.
//

import Foundation

// MARK: - Welcome
struct dataInfo: Codable {
    let products: [Product]
    let total, skip, limit: Int
}

// MARK: - Product
struct Product: Codable {
    let id: Int
    let title, description: String
    let price: Int
    let discountPercentage, rating: Double
    let stock: Int
    let brand, category: String
    let thumbnail: String
    let images: [String]
}
