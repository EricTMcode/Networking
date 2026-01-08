//
//  CoinsDetailCache.swift
//  Networking
//
//  Created by Eric on 08/01/2026.
//

import Foundation

class CoinsDetailCache {

    private let cache = NSCache<NSString, NSData>()

    func set(_ coinDetails: CoinDetails, forkey key: String) {
        guard let data = try? JSONEncoder().encode(coinDetails) else { return }
        cache.setObject(data as NSData, forKey: key as NSString)
    }

    func get(forkey key: String) -> CoinDetails? {
        guard let data = cache.object(forKey: key as NSString) as? Data else { return nil }
        return try? JSONDecoder().decode(CoinDetails.self, from: data)
    }
}
