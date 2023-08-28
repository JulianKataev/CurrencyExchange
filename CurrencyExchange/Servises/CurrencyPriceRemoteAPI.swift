import Foundation.NSJSONSerialization
import Foundation.NSURL

class CurrencyPriceRemoteAPI: CurrencyPriceRemoteAPIProtocol {
    let urlProvider: URLProviderProtocol
    
    init(urlProvider: URLProviderProtocol) {
        self.urlProvider = urlProvider
    }

    func getCurrencyPrice(from baseCurrency: CurrencyCode,
                          to targetCurrency: CurrencyCode,
                          completion: @escaping (Result<CurrencyPrice, RemoteAPIErrors>) -> Void) {
        
        guard let url = try? urlProvider.getUrl(with: baseCurrency).get() else {
            completion(.failure(.unsupportedURLFormat))
            return
        }
        
        let request = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard error == nil else {
                completion(.failure(.networkUnavailable))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completion(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
            
            do {
                let currencyData = try JSONDecoder().decode(CurrencyPriceResponsePayload.self, from: data)
                
                if let currencyPrice = currencyData.rates[targetCurrency.value] {
                    completion(.success(CurrencyPrice(value: currencyPrice)))
                } else {
                    completion(.failure(.invalidData))
                }
            } catch {
                completion(.failure(.invalidData))
            }
        }
        task.resume()
    }
}
