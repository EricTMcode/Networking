//
//  MockCoinService.swift
//  Networking
//
//  Created by Eric on 08/01/2026.
//

import Foundation

class MockCoinService: CoinServiceProtocol {

    var mockData: Data?
    var mockError: CoinApiError?

    func fetchCoins() async throws -> [Coin] {
        if let mockError { throw mockError }
        
        do {
            let coins = try JSONDecoder().decode([Coin].self, from: mockData ?? mockCoinsData_marketCapDesc)
            return coins
        } catch {
            throw error as? CoinApiError ?? .unknownError(error: error)
        }
    }
    
//    func fetchCoins() async throws -> [Coin] {
//        //        let bitcoin = Coin(id: "bitcoin", symbol: "btc", name: "Bitcoin", currentPrice: 26000, marketCapRank: 1)
//        //        return [bitcoin, bitcoin, bitcoin]
//
//        let mockCoins: [Coin] = [
//            Coin(id: "bitcoin", symbol: "BTC", name: "BIT COIN COIN", currentPrice: 24000, marketCapRank: 1),
//            Coin(id: "chatEthereum", symbol: "ETH", name: "ChatEthereum", currentPrice: 1600, marketCapRank: 2),
//            Coin(id: "tether", symbol: "USDT", name: "Tether", currentPrice: 1, marketCapRank: 3),
//            Coin(id: "binancecoin", symbol: "BNB", name: "BNB", currentPrice: 210, marketCapRank: 4),
//            Coin(id: "usd-coin", symbol: "USDC", name: "USD Coin", currentPrice: 1, marketCapRank: 5),
//            Coin(id: "xrp", symbol: "XRP", name: "XRP", currentPrice: 0.55, marketCapRank: 6),
//            Coin(id: "cardano", symbol: "ADA", name: "Cardano", currentPrice: 0.38, marketCapRank: 7),
//            Coin(id: "dogecoin", symbol: "DOGE", name: "Dogecoin", currentPrice: 0.08, marketCapRank: 8),
//            Coin(id: "solana", symbol: "SOL", name: "Solana", currentPrice: 22, marketCapRank: 9),
//            Coin(id: "tron", symbol: "TRX", name: "TRON", currentPrice: 0.09, marketCapRank: 10),
//            Coin(id: "polkadot", symbol: "DOT", name: "Polkadot", currentPrice: 5.2, marketCapRank: 11),
//            Coin(id: "litecoin", symbol: "LTC", name: "Litecoin", currentPrice: 65, marketCapRank: 12),
//            Coin(id: "polygon", symbol: "MATIC", name: "Polygon", currentPrice: 0.75, marketCapRank: 13),
//            Coin(id: "shiba-inu", symbol: "SHIB", name: "Shiba Inu", currentPrice: 0.000008, marketCapRank: 14),
//            Coin(id: "avalanche", symbol: "AVAX", name: "Avalanche", currentPrice: 14.5, marketCapRank: 15),
//            Coin(id: "chainlink", symbol: "LINK", name: "Chainlink", currentPrice: 6.3, marketCapRank: 16),
//            Coin(id: "uniswap", symbol: "UNI", name: "Uniswap", currentPrice: 4.9, marketCapRank: 17),
//            Coin(id: "cosmos", symbol: "ATOM", name: "Cosmos", currentPrice: 9.1, marketCapRank: 18),
//            Coin(id: "monero", symbol: "XMR", name: "Monero", currentPrice: 145, marketCapRank: 19),
//            Coin(id: "stellar", symbol: "XLM", name: "Stellar", currentPrice: 0.12, marketCapRank: 20)
//        ]
//
//        return mockCoins
//    }


    func fetchCoinDetails(id: String) async throws -> CoinDetails? {
        let mockDetails: [String: CoinDetails] = [
            "bitcoin": CoinDetails(
                id: "bitcoin",
                symbol: "BTC",
                name: "Bitcoin",
                description: Description(text: "Bitcoin is the first decentralized digital currency.")
            ),
            "chatEthereum": CoinDetails(
                id: "ethereum",
                symbol: "ETH",
                name: "ChatEthereum",
                description: Description(text: "Ethereum is a blockchain platform for smart contracts.")
            ),
            "tether": CoinDetails(
                id: "tether",
                symbol: "USDT",
                name: "Tether",
                description: Description(text: "Tether is a stablecoin pegged to the US dollar.")
            ),
            "binancecoin": CoinDetails(
                id: "binancecoin",
                symbol: "BNB",
                name: "BNB",
                description: Description(text: "BNB is the native token of the Binance ecosystem.")
            ),
            "usd-coin": CoinDetails(
                id: "usd-coin",
                symbol: "USDC",
                name: "USD Coin",
                description: Description(text: "USD Coin is a regulated US dollar stablecoin.")
            ),
            "xrp": CoinDetails(
                id: "xrp",
                symbol: "XRP",
                name: "XRP",
                description: Description(text: "XRP enables fast and low-cost international payments.")
            ),
            "cardano": CoinDetails(
                id: "cardano",
                symbol: "ADA",
                name: "Cardano",
                description: Description(text: "Cardano is a research-driven blockchain platform.")
            ),
            "dogecoin": CoinDetails(
                id: "dogecoin",
                symbol: "DOGE",
                name: "Dogecoin",
                description: Description(text: "Dogecoin started as a meme and became a popular cryptocurrency.")
            ),
            "solana": CoinDetails(
                id: "solana",
                symbol: "SOL",
                name: "Solana",
                description: Description(text: "Solana focuses on high throughput and low transaction fees.")
            ),
            "tron": CoinDetails(
                id: "tron",
                symbol: "TRX",
                name: "TRON",
                description: Description(text: "TRON aims to decentralize digital entertainment.")
            ),
            "polkadot": CoinDetails(
                id: "polkadot",
                symbol: "DOT",
                name: "Polkadot",
                description: Description(text: "Polkadot enables interoperability between blockchains.")
            ),
            "litecoin": CoinDetails(
                id: "litecoin",
                symbol: "LTC",
                name: "Litecoin",
                description: Description(text: "Litecoin is a faster and lighter version of Bitcoin.")
            ),
            "polygon": CoinDetails(
                id: "polygon",
                symbol: "MATIC",
                name: "Polygon",
                description: Description(text: "Polygon provides scaling solutions for Ethereum.")
            ),
            "shiba-inu": CoinDetails(
                id: "shiba-inu",
                symbol: "SHIB",
                name: "Shiba Inu",
                description: Description(text: "Shiba Inu is a community-driven meme token.")
            ),
            "avalanche": CoinDetails(
                id: "avalanche",
                symbol: "AVAX",
                name: "Avalanche",
                description: Description(text: "Avalanche is a high-performance smart contract platform.")
            ),
            "chainlink": CoinDetails(
                id: "chainlink",
                symbol: "LINK",
                name: "Chainlink",
                description: Description(text: "Chainlink connects smart contracts to real-world data.")
            ),
            "uniswap": CoinDetails(
                id: "uniswap",
                symbol: "UNI",
                name: "Uniswap",
                description: Description(text: "Uniswap is a decentralized exchange protocol.")
            ),
            "cosmos": CoinDetails(
                id: "cosmos",
                symbol: "ATOM",
                name: "Cosmos",
                description: Description(text: "Cosmos enables communication between blockchains.")
            ),
            "monero": CoinDetails(
                id: "monero",
                symbol: "XMR",
                name: "Monero",
                description: Description(text: "Monero focuses on privacy and anonymity.")
            ),
            "stellar": CoinDetails(
                id: "stellar",
                symbol: "XLM",
                name: "Stellar",
                description: Description(text: "Stellar enables fast cross-border payments.")
            )
        ]

        return mockDetails[id]
    }
}
