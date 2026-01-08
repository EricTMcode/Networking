//
//  MockCoinServiceTests.swift
//  MockCoinServiceTests
//
//  Created by Eric on 08/01/2026.
//

import XCTest
@testable import Networking

final class MockCoinServiceTests: XCTestCase {

    func test_DecodeCoinsIntoArray_marketCapDesc() throws {
        do {
            let coins = try JSONDecoder().decode([Coin].self, from: mockCoinsData_marketCapDesc)
            XCTAssertTrue(coins.count > 0)
            XCTAssertFalse(coins.isEmpty)
            XCTAssertEqual(coins.count, 20)

            XCTAssertEqual(coins, coins.sorted(by: { $0.marketCapRank < $1.marketCapRank }))
        } catch {
            XCTFail(error.localizedDescription)
        }
    }

}
