//
//  CoinsViewModel.swift
//  Networking
//
//  Created by Eric on 05/01/2026.
//

import Foundation

class CoinsViewModel: ObservableObject {
    @Published var coins = [Coin]()
    @Published var errorMessage: String?

    private let service: CoinServiceProtocol

    init(service: CoinServiceProtocol) {
        self.service = service
    }

    @MainActor
    func fetchCoins() async {
        do {
            let coins = try await service.fetchCoins()
            self.coins.append(contentsOf: coins)
            print("DEBUG: Did fetch coins")
        } catch {
            guard let error = error as? CoinApiError else { return }
            self.errorMessage = error.customDescription
        }
    }
}
