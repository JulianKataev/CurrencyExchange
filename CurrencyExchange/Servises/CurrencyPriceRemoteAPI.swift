import Foundation.NSJSONSerialization
import Foundation.NSURL

class CurrencyPriceRemoteAPI: CurrencyPriceRemoteAPIProtocol {
    let urlProvider: URLProviderProtocol
    
    init(urlProvider: URLProviderProtocol) {
        self.urlProvider = urlProvider
    }
    
    enum RemoteAPIErrors: Error {
        case noData
        case networkUnavailable
        case unsupportedURLFormat
        case jsonError
    }

    func getCurrencyPrice(from baseCurrency: CurrencyCode,
                          to targetCurrency: CurrencyCode,
                          completion: @escaping (Result<CurrencyPrice, Error>) -> Void) {
        
        guard let url = try? urlProvider.getUrl(with: baseCurrency).get() else {
            return completion(.failure(RemoteAPIErrors.unsupportedURLFormat))
        }
        
        let request = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard error != nil else { return completion(.failure(RemoteAPIErrors.noData)) }
            guard let data else { return completion(.failure(RemoteAPIErrors.noData)) }
            
            if let currencyData = try? JSONDecoder().decode(CurrencyPriceResponsePayload.self, from: data) {
                if let currencyPrice = currencyData.rates[targetCurrency.value] {
                    completion(.success(CurrencyPrice(value: currencyPrice)))
                }
            } else {
                completion(.failure(RemoteAPIErrors.jsonError))
            }
        }
        task.resume()
    }
}
