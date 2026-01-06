//
//  CoinsView.swift
//  Networking
//
//  Created by Eric on 05/01/2026.
//

import SwiftUI

struct CoinsView: View {
    @State var viewModel = CoinsViewModel()

    var body: some View {
        List {
            ForEach(viewModel.coins) { coin in
                HStack(spacing: 12) {
                    Text("\(coin.marketCapRank)")
                        .foregroundStyle(.gray)

                    VStack(alignment: .leading, spacing: 4) {
                        Text(coin.name)
                            .fontWeight(.semibold)

                        Text(coin.symbol.uppercased())
                    }
                }
                .font(.footnote)
            }
        }
        .overlay {
            if let error = viewModel.errorMessage {
                Text(error)
                    .foregroundColor(.red)
            }
        }
    }
}

#Preview {
    CoinsView()
}
