//
//  CurrencyExchangePresenter.swift
//  CurrencyExchange
//
//  Created by Юлиан Катаев on 31.07.2023.
//

protocol CurrencyExchangePresenterInputProtocol: AnyObject {
    func viewDidLoad()
    func onConvertCurrency(amountString: String, fromCurrencyCode: String, toCurrencyCode: String)
}

protocol CurrencyExchangePresenterOutputProtocol: AnyObject {
    func showConvertedCurrency(amountFloat: Float)
}

class CurrencyExchangePresenter {
    weak var view: CurrencyExchangeViewControllerProtocol?
    var interactor: CurrencyExchangeInteractorProtocol?
}

extension CurrencyExchangePresenter: CurrencyExchangePresenterInputProtocol {
    func viewDidLoad() {
        view?.updateAmountUzsTextLabel(with: "Введи сумму в тенге")
    }
    
    func onConvertCurrency(amountString: String, fromCurrencyCode: String, toCurrencyCode: String) {
        guard let amount = Float(amountString) else {
            view?.updateAmountUzsTextLabel(with: "Введи сумму в тенге")
            return
        }
        
        self.interactor?.execute(amount: amount, fromCurrencyCode: fromCurrencyCode, toCurrencyCode: toCurrencyCode, complition: { money in
            if let currency = money.amount {
                self.showConvertedCurrency(amountFloat: currency)
            }
        })
    }
}

extension CurrencyExchangePresenter: CurrencyExchangePresenterOutputProtocol {
    func showConvertedCurrency(amountFloat: Float) {
        let string = String(format: "%.2f", amountFloat)
        view?.updateAmountUzsTextLabel(with: string)
    }
}
