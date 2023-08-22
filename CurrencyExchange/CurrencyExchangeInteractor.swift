import Foundation

class CurrencyExchangeInteractor: CurrencyExchangeInteractorProtocol {
    weak var presenter: CurrencyExchangePresenterOutputProtocol?
    private let exchangeRateRemoteAPImanager: ExchangeRateRemoteAPIProtocol
    
    init(exchangeRateRemoteAPImanager: ExchangeRateRemoteAPIProtocol) {
        self.exchangeRateRemoteAPImanager = exchangeRateRemoteAPImanager
    }
    
    func execute(from baseCurrency: CurrencyCode, to targetCurrency: CurrencyCode, amount: Amount) {
        DispatchQueue.global().async {
            self.exchangeRateRemoteAPImanager.getCurrencyPrice(from: baseCurrency, to: targetCurrency) { price in
                DispatchQueue.main.async {
                    let money = Money(currency: baseCurrency, amount: amount)
                    let exchangeRate = ExchangeRate(fromCurrency: baseCurrency,
                                                    toCurrency: targetCurrency,
                                                    currencyPrice: price)
                    let converted = ConvertCurrency(exchangeRate: exchangeRate, money: money)
                        .callAsFunction()
                    self.presenter?.showConvertedMoney(money: converted)
                }
            }
        }
    }
}
