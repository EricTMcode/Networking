//
//  CoinDetails.swift
//  Networking
//
//  Created by Eric on 06/01/2026.
//

import Foundation

struct CoinDetails: Codable {
    let id: String
    let symbol: String
    let name: String
    let description: Description

}

struct Description: Codable {
    let text: String

    enum CodingKeys: String, CodingKey {
        case text = "en"
    }
}
