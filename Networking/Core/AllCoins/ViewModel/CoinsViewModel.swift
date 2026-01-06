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
        fetchCoins()
    }

    func fetchCoins() {
        service.fetchCoinsWithResult { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let coins):
                    self.coins = coins
                case .failure(let error):
                    self.errorMessage = "\(error.localizedDescription)"
                }
            }
        }
//        service.fetchCoins { coins, error in
//            DispatchQueue.main.async {
//                if let error = error {
//                    self.errorMessage = "\(error.localizedDescription)"
//                    return
//                }
//                    self.coins = coins ?? []
//            }
//        }
    }
}
