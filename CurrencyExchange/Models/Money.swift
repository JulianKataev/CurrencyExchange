struct Money {
    let currency: CurrencyCode
    let amount: Amount
    
    init(currency: CurrencyCode, amount: Amount) {
        self.currency = currency
        self.amount = amount
    }
}
