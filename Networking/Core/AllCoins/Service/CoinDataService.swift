//
//  CoinDataService.swift
//  Networking
//
//  Created by Eric on 06/01/2026.
//

import Foundation

class CoinDataService: HTTPDataDownloader {
    private let urlString = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=20&page=1&sparkline=false&price_change_percentage=24h&locale=en"

    func fetchCoins() async throws -> [Coin] {
        return try await fetchData(as: [Coin].self, endpoint: urlString)
    }

    func fetchCoinDetails(id: String) async throws -> CoinDetails? {
        let detailsURLString = "https://api.coingecko.com/api/v3/coins/\(id)?localization=false"
        return try await fetchData(as: CoinDetails.self, endpoint: detailsURLString)
    }
}
