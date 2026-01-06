//
//  CoinDetailsView.swift
//  Networking
//
//  Created by Eric on 06/01/2026.
//

import SwiftUI

struct CoinDetailsView: View {
    let coin: Coin

    var body: some View {
        Text(coin.name)
    }
}

#Preview {
    CoinDetailsView(coin: Coin.mockCoins[0])
}
