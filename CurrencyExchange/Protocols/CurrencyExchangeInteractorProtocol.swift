protocol CurrencyExchangeInteractorProtocol: AnyObject {
    func execute(amount: Float, fromCurrencyCode: String, toCurrencyCode: String, completion: @escaping (Money) -> Void)
}
