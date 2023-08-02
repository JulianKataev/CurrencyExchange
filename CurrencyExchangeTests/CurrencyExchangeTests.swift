import XCTest
@testable import CurrencyExchange

final class CurrencyExchangeTests: XCTestCase {
    
    func testExchangeAmount() {
        let amount = Amount(amount: 1000.0)
        let exchangeRate = ExchangeRate(exchangeRate: 10.0)
        let money = Money().converted(amount: amount, exchangeRate: exchangeRate)
        XCTAssertEqual(money.amount, 10000.0)
    }
}
