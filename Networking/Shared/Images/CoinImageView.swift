//
//  CoinImageView.swift
//  Networking
//
//  Created by Eric on 08/01/2026.
//

import SwiftUI

struct CoinImageView: View {
    @ObservedObject var imageLoader: ImageLoader

    init(url: String) {
        self.imageLoader = ImageLoader(url: url)
    }

    var body: some View {
        if let image = imageLoader.image {
            image
                .resizable()
                .scaledToFit()
        }
    }
}

#Preview {
    CoinImageView(url: "https://coin-images.coingecko.com/coins/images/1/large/bitcoin.png?1696501400")
}
