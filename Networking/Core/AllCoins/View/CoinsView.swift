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
        VStack {
            if let errorMessage = viewModel.errorMessage {
                Text(errorMessage)
                    .foregroundColor(.red)
            } else {
                Text("\(viewModel.coin): \(viewModel.price)")
            }
        }
        .padding()
    }
}

#Preview {
    CoinsView()
}
