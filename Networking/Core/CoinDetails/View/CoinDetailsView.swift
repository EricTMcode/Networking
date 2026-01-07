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

    init(coin: Coin) {
        self.coin = coin
        self.viewModel = CoinDetailsViewModel(coinID: coin.id)
    }

    var body: some View {
        if let details = viewModel.coinDetails {
            ScrollView {
                VStack(alignment: .leading) {
                    Text(details.name)
                        .fontWeight(.semibold)
                        .font(.subheadline)

                    Text(details.symbol.uppercased())
                        .font(.footnote)

                    Text(details.description.text)
                        .font(.footnote)
                        .padding(.vertical)
                }
                .padding()
            }
        }
    }
}

#Preview {
    CoinDetailsView(coin: Coin.mockCoins[0])
}
