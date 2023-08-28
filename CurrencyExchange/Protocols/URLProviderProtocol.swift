import Foundation.NSURL

protocol URLProviderProtocol {
    func getUrl(with currencyCode: CurrencyCode) -> Result<URL, URLProviderErrors>
}
