import XCTest
@testable import CurrencyExchange

final class CurrencyExchangeTests: XCTestCase {
    private var currencyConverter: ConvertCurrency!
    private let baseCurrency = "KZT"
    
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        
    }
    
    override func tearDownWithError() throws {
        currencyConverter = nil
    }
    
    func testConvertCurrency() {
        
    }
}
