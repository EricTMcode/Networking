//
//  CoinsViewModel.swift
//  Networking
//
//  Created by Eric on 05/01/2026.
//

import Foundation

@Observable
class CoinsViewModel {
    var coin = ""
    var price = ""
    var errorMessage: String?

    private let service = CoinDataService()

    init() {
        fetchPrice(coin: "bitcoin")
    }

    func fetchPrice(coin: String) {
        service.fetchPrice(coin: coin) { result in
            DispatchQueue.main.async {
                self.price = "$\(result)"
                self.coin = coin
            }
        }
    }
}
