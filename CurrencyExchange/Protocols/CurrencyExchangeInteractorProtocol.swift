protocol CurrencyExchangeInteractorProtocol: AnyObject {
    func execute(from baseCurrency: CurrencyCode,
                 to targetCurrency: CurrencyCode,
                 amount: Amount)
}
