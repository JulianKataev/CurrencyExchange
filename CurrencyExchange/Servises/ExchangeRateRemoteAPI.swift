import Foundation

final class ExchangeRateRemoteAPI: ExchangeRateRemoteAPIProtocol {
    // FIXME: Хардкод адреса приводит к невозможности подключения тестового сервера рейтов, нужно получать из конфига
    private var urlString = "https://open.er-api.com/v6/latest/"

    func getExchangeRate(from: CurrencyCode, to: CurrencyCode, completion: @escaping (ExchangeRate) -> Void) {
        urlString += from.value.rawValue
        guard let url = URL(string: urlString) else { return }
        
        let request = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data else { return }
            if let currencyData = try? JSONDecoder().decode(CurrencyExchangeRateResponsePayload.self, from: data) {
                if let rate = currencyData.rates[to.value.rawValue] {
                    completion(ExchangeRate(exchangeRate: rate))
                }
            }
        }
        task.resume()
    }
}
