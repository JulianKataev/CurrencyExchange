import Foundation.NSURL

protocol CurrencyPriceRemoteAPIProtocol {
    func getCurrencyPrice(from baseCurrency: CurrencyCode,
                          to targetCurrency: CurrencyCode,
                          completion: @escaping (Result<CurrencyPrice, Error>) -> Void)
}
