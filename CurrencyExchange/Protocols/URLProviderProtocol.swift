import Foundation.NSURL

protocol URLProviderProtocol {
    func getUrl(with baseCurrencyCode: CurrencyCode) -> URL
}
