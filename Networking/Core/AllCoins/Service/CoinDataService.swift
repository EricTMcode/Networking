//
//  CoinDataService.swift
//  Networking
//
//  Created by Eric on 06/01/2026.
//

import Foundation

class CoinDataService: HTTPDataDownloader {
    private var baseURLComponents: URLComponents {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.coingecko.com"
        components.path = "/api/v3/coins/"

        return components
    }

    private var allCoinsURLString: String? {
        var components = baseURLComponents
        components.path += "markets"

        components.queryItems = [
            .init(name: "vs_currency", value: "usd"),
            .init(name: "order", value: "market_cap_desc"),
            .init(name: "per_page", value: "20"),
            .init(name: "page", value: "1"),
            .init(name: "sparkline", value: "false"),
            .init(name: "price_change_percentage", value: "24h"),
            .init(name: "locale", value: "en")
            ]

        return components.url?.absoluteString

    }

    func fetchCoins() async throws -> [Coin] {
        guard let endpoint = allCoinsURLString else {
            throw CoinApiError.requestFailed(description: "Invalid Endpoint")
        }
        return try await fetchData(as: [Coin].self, endpoint: endpoint)
    }

    func fetchCoinDetails(id: String) async throws -> CoinDetails? {
        let detailsURLString = "https://api.coingecko.com/api/v3/coins/\(id)?localization=false"
        return try await fetchData(as: CoinDetails.self, endpoint: detailsURLString)
    }
}
