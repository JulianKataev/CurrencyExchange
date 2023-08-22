import Foundation.NSURL

protocol ExchangeRateRemoteAPIProtocol {
    func getCurrencyPrice(from baseCurrency: CurrencyCode,
                          to targetCurrency: CurrencyCode,
                          completion: @escaping (CurrencyPrice) -> Void)
}
