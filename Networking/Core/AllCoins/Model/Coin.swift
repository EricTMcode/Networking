//
//  Coin.swift
//  Networking
//
//  Created by Eric on 06/01/2026.
//

import Foundation

struct Coin: Codable, Hashable, Identifiable {
    let id: String
    let symbol: String
    let name: String
    let image: String
    let currentPrice: Double
    let marketCapRank: Int

    enum CodingKeys: String, CodingKey {
        case id, symbol, name, image
        case currentPrice = "current_price"
        case marketCapRank = "market_cap_rank"
    }
}

extension Coin {
    static let mockCoins: [Coin] = [
        Coin(id: "1", symbol: "BTC", name: "Bitcoin", image: "", currentPrice: 60000, marketCapRank: 1),
        Coin(id: "2", symbol: "ETH", name: "Ethereum", image: "", currentPrice: 3000, marketCapRank: 2),
        Coin(id: "3", symbol: "SOL", name: "Solana", image: "", currentPrice: 100, marketCapRank: 3),
        ]
    
}
