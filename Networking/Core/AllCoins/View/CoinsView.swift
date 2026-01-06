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
                Text(coin.name)
            }
        }
    }
}

#Preview {
    CoinsView()
}
