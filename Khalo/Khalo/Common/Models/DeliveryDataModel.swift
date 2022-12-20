//
//  DeliveryDataModel.swift
//  Khalo
//
//  Created by Furqan on 14/12/2022.
//

import Foundation
import SwiftUI
struct DeliveryModel: Codable {
    var restaurants: [Restaurant]
}

// MARK: - Restaurant
struct Restaurant: Codable {
    let name: String
    let imageLink: String
    let rating: Double
    let segments: [Segment]

    enum CodingKeys: String, CodingKey {
        case name
        case imageLink = "image_link"
        case rating, segments
    }
}

// MARK: - Segment
struct Segment: Codable {
    let name: String
    let dishes: [Dish]
}

// MARK: - Dish
struct Dish: Codable {
    let name: String
    let price: Double
}

