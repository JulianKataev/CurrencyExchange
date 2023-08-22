import Foundation.NSURL

class URLProvider: URLProviderProtocol {
    func getUrl(with currencyCode: CurrencyCode) -> URL {
        let urlString = "https://open.er-api.com/v6/latest/" + currencyCode.value
        return URL(string: urlString)!
    }
}
