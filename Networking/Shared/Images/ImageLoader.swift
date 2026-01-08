//
//  ImageLoader.swift
//  Networking
//
//  Created by Eric on 08/01/2026.
//

import SwiftUI

class ImageLoader: ObservableObject {
    @Published var image: Image?

    private let URLString: String

    init(url: String) {
        self.URLString = url
        Task { await loadImage() }
    }

    @MainActor
    private func loadImage() async {
        guard let url = URL(string: URLString) else { return }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            guard let uiImage = UIImage(data: data) else { return }
            self.image = Image(uiImage: uiImage)
        } catch {
            print("DEBUG: Failed to fetch image with error \(error)")
        }
    }
}
