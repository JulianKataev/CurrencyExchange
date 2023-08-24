import Foundation.NSURL

class URLProvider: URLProviderProtocol {

    enum URLProviderErrors: Error {
        case unsupportedFormat
    }
    
    func getUrl(with currencyCode: CurrencyCode) -> Result<URL, Error> {
        let urlString = "https://open.er-api.com/v6/latest/" + currencyCode.value
        
        if let url = URL(string: urlString) {
            return .success(url)
        } else {
            return .failure(URLProviderErrors.unsupportedFormat)
        }
    }
}
