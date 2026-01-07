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
        guard let url = URL(string: urlString) else { return [] }

        let (data, response) =  try await URLSession.shared.data(from: url)

        guard let httpResponse = response as? HTTPURLResponse else {
            throw CoinApiError.requestFailed(description: "Request failed")
        }

        guard httpResponse.statusCode == 200 else {
            throw CoinApiError.invalidStatusCode(statusCode: httpResponse.statusCode)
        }

        do {
            let coins = try JSONDecoder().decode([Coin].self, from: data)
            return coins
        } catch {
            print("DEBUG: Error fetching data: \(error)")
            throw error as? CoinApiError ?? .unknownError(error: error)
        }
    }

    func fetchCoinDetails(id: String) async throws -> CoinDetails? {

        let detailsURLString = "https://api.coingecko.com/api/v3/coins/\(id)?localization=false"

        guard let url = URL(string: detailsURLString) else { return nil }

        let (data, response) = try await URLSession.shared.data(from: url)

        guard let httpResponse = response as? HTTPURLResponse else {
            throw CoinApiError.requestFailed(description: "Request failed")
        }

        guard httpResponse.statusCode == 200 else {
            throw CoinApiError.invalidStatusCode(statusCode: httpResponse.statusCode)
        }

        do {
            let details = try JSONDecoder().decode(CoinDetails.self, from: data)
            return details
        } catch {
            print("DEBUG: Error: \(error)")
            throw error as? CoinApiError ?? .unknownError(error: error)
        }
    }
}
