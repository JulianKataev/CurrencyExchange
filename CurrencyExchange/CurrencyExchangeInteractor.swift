import Foundation

class CurrencyExchangeInteractor: CurrencyExchangeInteractorProtocol {
    weak var presenter: CurrencyExchangePresenterOutputProtocol?
    private let exchangeRateRemoteAPImanager: ExchangeRateRemoteAPIProtocol
    
    init(exchangeRateRemoteAPImanager: ExchangeRateRemoteAPIProtocol) {
        self.exchangeRateRemoteAPImanager = exchangeRateRemoteAPImanager
    }
    
    func execute(amount: Float, fromCurrencyCode: String, toCurrencyCode: String, completion: @escaping (Money) -> Void) {
        let amount = Amount(amount: amount)
        let currency = 

        // FIXME: На бекграунд поток с не понятным QoS переключился...
        DispatchQueue.global().async {
            self.exchangeRateRemoteAPImanager.getExchangeRate(currency: currency) { exchangeRate in
                let convert = Money().converted(amount: amount, exchangeRate: exchangeRate)
                // FIXME: ...а обратно на главный не вернулся
                completion(convert)
            }
        }
    }
}
