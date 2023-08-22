import Foundation.NSJSONSerialization
import Foundation.NSURL

class ExchangeRateRemoteAPI: ExchangeRateRemoteAPIProtocol {
    let urlProvider: URLProviderProtocol
    
    init(urlProvider: URLProviderProtocol) {
        self.urlProvider = urlProvider
    }

    func getCurrencyPrice(from baseCurrency: CurrencyCode,
                          to targetCurrency: CurrencyCode,
                          completion: @escaping (CurrencyPrice) -> Void) {
        let url = urlProvider.getUrl(with: baseCurrency)
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data else { return }
            if let currencyData = try? JSONDecoder().decode(CurrencyExchangeRateResponsePayload.self, from: data) {
                if let currencyPrice = currencyData.rates[targetCurrency.value] {
                    completion(CurrencyPrice(value: currencyPrice))
                }
            } else {
                return
            }
        }
        task.resume()
    }
}
