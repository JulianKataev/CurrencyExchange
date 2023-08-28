struct ExchangeRate {
    private let fromCurrency: CurrencyCode
    private let toCurrency: CurrencyCode
    let currencyPrice: CurrencyPrice
    
    init(fromCurrency: CurrencyCode, toCurrency: CurrencyCode, currencyPrice: CurrencyPrice) {
        self.fromCurrency = fromCurrency
        self.toCurrency = toCurrency
        self.currencyPrice = currencyPrice
    }
}
