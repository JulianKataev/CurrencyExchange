import Foundation.NSURL

class URLProvider: URLProviderProtocol {

    func getUrl(with currencyCode: CurrencyCode) -> Result<URL, URLProviderErrors> {
        let urlString = "https://open.er-api.com/v6/latest/" + currencyCode.value
        
        if let url = URL(string: urlString) {
            return .success(url)
        } else {
            return .failure(.unsupportedFormat)
        }
    }
}
