//
//  CoinsViewModel.swift
//  Networking
//
//  Created by Eric on 05/01/2026.
//

import Foundation

@Observable
class CoinsViewModel {
    var coins = [Coin]()
    var errorMessage: String?

    private let service = CoinDataService()

    init() {
        Task { try await fetchCoins() }
    }

    func fetchCoins() async throws {
        self.coins = try await service.fetchCoins()
    }
}
