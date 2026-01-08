//
//  CoinsViewModelTests.swift
//  MockCoinServiceTests
//
//  Created by Eric on 08/01/2026.
//

import XCTest
@testable import Networking

@MainActor
final class CoinsViewModelTests: XCTestCase {
    func testInit() {
        let service = MockCoinService()
        let viewModel = CoinsViewModel(service: service)

        XCTAssertNotNil(viewModel, "The view model should not be nil")
    }

    func testSuccessfulCoinsFetch() async throws {
        let service = MockCoinService()
        let viewModel = CoinsViewModel(service: service)

        await viewModel.fetchCoins()

        XCTAssertTrue(viewModel.coins.count > 0)
        XCTAssertEqual(viewModel.coins.count, 20)
        XCTAssertEqual(viewModel.coins, viewModel.coins.sorted(by: { $0.marketCapRank < $1.marketCapRank }))
    }


    func testCoinFetchWithInvalidJSON() async {
        let service = MockCoinService()
        service.mockData = mockCoins_invalidJSON

        let viewModel = CoinsViewModel(service: service)

        await viewModel.fetchCoins()

        XCTAssertTrue(viewModel.coins.isEmpty)
        XCTAssertNotNil(viewModel.errorMessage)
    }

    func testThrowsInvalidDataError() async {
        let service = MockCoinService()
        service.mockError = CoinApiError.invalidData

        let viewModel = CoinsViewModel(service: service)

        await viewModel.fetchCoins()

        XCTAssertNotNil(viewModel.errorMessage)
        XCTAssertEqual(viewModel.errorMessage, CoinApiError.invalidData.customDescription)
    }

}
