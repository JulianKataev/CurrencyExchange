protocol CurrencyExchangeInteractorProtocol: AnyObject {
    // FIXME: Typo (completion, NOT complition)
    func execute(amount: Float, fromCurrencyCode: String, toCurrencyCode: String, complition: @escaping (Money) -> Void)
}
