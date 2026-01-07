//
//  CoinDataService.swift
//  Networking
//
//  Created by Eric on 06/01/2026.
//

import Foundation

class CoinDataService {
    private let urlString = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=20&page=1&sparkline=false&price_change_percentage=24h&locale=en"

    func fetchCoins() async throws -> [Coin] {
        return try await fetchData(as: [Coin].self, endpoint: urlString)

    }

    func fetchCoinDetails(id: String) async throws -> CoinDetails? {
        let detailsURLString = "https://api.coingecko.com/api/v3/coins/\(id)?localization=false"
        return try await fetchData(as: CoinDetails.self, endpoint: detailsURLString)

    }

    private func fetchData<T: Codable>(as type: T.Type, endpoint: String) async throws -> T {
        guard let url = URL(string: endpoint) else {
            throw CoinApiError.requestFailed(description: "Invalid URL")
        }

        let (data, response) = try await URLSession.shared.data(from: url)

        guard let httpResponse = response as? HTTPURLResponse else {
            throw CoinApiError.requestFailed(description: "Request failed")
        }

        guard httpResponse.statusCode == 200 else {
            throw CoinApiError.invalidStatusCode(statusCode: httpResponse.statusCode)
        }

        do {
            return try JSONDecoder().decode(type, from: data)
        } catch {
            throw error as? CoinApiError ?? .unknownError(error: error)
        }

    }
}
