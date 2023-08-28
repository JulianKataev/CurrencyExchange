import Foundation

class CurrencyExchangeInteractor: CurrencyExchangeInteractorProtocol {
    weak var presenter: CurrencyExchangePresenterOutputProtocol?
    private let currencyPriceRemoteApiManager: CurrencyPriceRemoteAPIProtocol
    
    init(currencyPriceRemoteApiManager: CurrencyPriceRemoteAPIProtocol) {
        self.currencyPriceRemoteApiManager = currencyPriceRemoteApiManager
    }
    
    func execute(from baseCurrency: CurrencyCode, to targetCurrency: CurrencyCode, amount: Amount) {
        DispatchQueue.global().async {
            self.currencyPriceRemoteApiManager.getCurrencyPrice(from: baseCurrency,
                                                                to: targetCurrency) { [weak self] result in
                DispatchQueue.main.async {
                    switch result {
                    case .success(let currencyPrice):
                        let money = Money(currency: baseCurrency, amount: amount)
                        let exchangeRate = ExchangeRate(fromCurrency: baseCurrency,
                                                        toCurrency: targetCurrency,
                                                        currencyPrice: currencyPrice)
                        let converted = ConvertCurrency(exchangeRate: exchangeRate, money: money)
                            .callAsFunction()
                        self?.presenter?.showConvertedMoney(money: converted)
                    case .failure(let error):
                        self?.presenter?.showError(error)
                    }
                }
            }
        }
    }
}
