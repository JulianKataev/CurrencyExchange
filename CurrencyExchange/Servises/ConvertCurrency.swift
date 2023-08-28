class ConvertCurrency: ConvertCurrencyProtocol {
    private let exchangeRate: ExchangeRate
    private let money: Money
    
    init(exchangeRate: ExchangeRate, money: Money) {
        self.exchangeRate = exchangeRate
        self.money = money
    }
    
    func callAsFunction() -> Money {
        let result = money.amount.value * exchangeRate.currencyPrice.value
        let money = Money(currency: money.currency, amount: Amount(value: result))
        return money
    }
}
