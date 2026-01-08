//
//  CoinDataService.swift
//  Networking
//
//  Created by Eric on 06/01/2026.
//

import Foundation

protocol CoinServiceProtocol {
    func fetchCoins() async throws -> [Coin]
    func fetchCoinDetails(id: String) async throws -> CoinDetails?
}

class CoinDataService: CoinServiceProtocol, HTTPDataDownloader {

    init() {
        print("DEBUG: DID INIT SERVICE...")
    }

    func fetchCoins() async throws -> [Coin] {
        guard let endpoint = allCoinsURLString else {
            throw CoinApiError.requestFailed(description: "Invalid Endpoint")
        }
        return try await fetchData(as: [Coin].self, endpoint: endpoint)
    }

    func fetchCoinDetails(id: String) async throws -> CoinDetails? {
        if let cached = CoinDetailsCache.shared.get(forkey: id) {
            print("DEBUG: Got details from CACHE.")
            return cached
        }

        guard let endpoint = coinDetailsURLString(id: id) else {
            throw CoinApiError.requestFailed(description: "Invalid Endpoint")
        }

        let details = try await fetchData(as: CoinDetails.self, endpoint: endpoint)
        print("DEBUG: Got details from API.")
        CoinDetailsCache.shared.set(details, forkey: id)
        return details
    }

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

    private func coinDetailsURLString(id: String) -> String? {
        var components = baseURLComponents
        components.path += "\(id)"
        components.queryItems = [
            .init(name: "localization", value: "false")
        ]

        return components.url?.absoluteString
    }
}
