protocol ExchangeRateRemoteAPIProtocol {
    func getExchangeRate(currency: Currency, completion: @escaping (ExchangeRate) -> Void)
}
