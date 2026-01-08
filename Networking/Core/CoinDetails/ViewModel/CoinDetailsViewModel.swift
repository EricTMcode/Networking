//
//  CoinDetailsViewModel.swift
//  Networking
//
//  Created by Eric on 06/01/2026.
//

import Foundation

class CoinDetailsViewModel: ObservableObject {
    private let service: CoinDataService
    private let coinID: String

    @Published var coinDetails: CoinDetails?

    init(coinID: String, service: CoinDataService) {
        self.service = service
        self.coinID = coinID
    }

    @MainActor
    func fetchCoinDetails() async {
        do {
            self.coinDetails = try await service.fetchCoinDetails(id: coinID)
        } catch {
            print("DEBUT: Error \(error.localizedDescription)")
        }
    }
}
