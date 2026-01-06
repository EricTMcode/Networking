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
        Task { await fetchCoins() }
    }

    @MainActor
    func fetchCoins() async {
        do {
            self.coins = try await service.fetchCoins()
        } catch {
            if let error = error as? CoinApiError {
                self.errorMessage = error.customDescription
            } else {
                self.errorMessage = error.localizedDescription
            }
        }
    }
}
