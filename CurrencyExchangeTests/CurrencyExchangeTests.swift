//
//  CurrencyExchangeTests.swift
//  CurrencyExchangeTests
//
//  Created by Юлиан Катаев on 31.07.2023.
//

import XCTest
@testable import CurrencyExchange

final class CurrencyExchangeTests: XCTestCase {

    override func setUpWithError() throws {
        
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testExchangeAmount() {
        let amount = Amount(amount: 1000.0)
        let exchangeRate = ExchangeRate(exchangeRate: 10.0)
        let money = Money().converted(amount: amount, exchangeRate: exchangeRate)
        XCTAssertEqual(money.amount, 10000.0)
    }
}
