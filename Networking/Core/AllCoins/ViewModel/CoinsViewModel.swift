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

    private let service = CoinDataService()

    init() {
        fetchCoins()
    }

    func fetchCoins() {
        service.fetchCoins { coins in
            DispatchQueue.main.async {
                for coin in coins {
                    self.coins = coins
                }
            }
        }
    }
}
