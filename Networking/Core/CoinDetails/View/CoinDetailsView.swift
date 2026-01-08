//
//  CoinDetailsView.swift
//  Networking
//
//  Created by Eric on 06/01/2026.
//

import SwiftUI

struct CoinDetailsView: View {
    let coin: Coin
    @ObservedObject var viewModel: CoinDetailsViewModel

    init(coin: Coin, service: CoinServiceProtocol) {
        self.coin = coin
        self.viewModel = CoinDetailsViewModel(coinID: coin.id, service: service)
    }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                if let details = viewModel.coinDetails {
                    Text(details.name)
                        .fontWeight(.semibold)
                        .font(.subheadline)

                    Text(details.symbol.uppercased())
                        .font(.footnote)

                    Text(details.description.text)
                        .font(.footnote)
                        .padding(.vertical)
                }
            }
            .task { await viewModel.fetchCoinDetails() }
            .padding()
        }
    }
}

//#Preview {
//    CoinDetailsView(coin: Coin.mockCoins[0])
//}
