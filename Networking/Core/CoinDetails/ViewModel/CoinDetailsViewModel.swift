//
//  CoinDetailsViewModel.swift
//  Networking
//
//  Created by Eric on 06/01/2026.
//

import Foundation

class CoinDetailsViewModel: ObservableObject {

    private let service = CoinDataService()
    private let coinID: String

    @Published var coinDetails: CoinDetails?

    init(coinID: String) {
        self.coinID = coinID

        Task { await fetchCoinDetails() }
    }

    func fetchCoinDetails() async {
        do {
            let details = try await service.fetchCoinDetails(id: coinID)
            print("DEBUG: Details \(details)")
        } catch {
            print("DEBUG: Error \(error.localizedDescription)")
        }
    }
}
