//
//  CurrencyExchangePresenter.swift
//  CurrencyExchange
//
//  Created by Юлиан Катаев on 31.07.2023.
//

// FIXME: One type — One source file
protocol CurrencyExchangePresenterInputProtocol: AnyObject {
    func viewDidLoad()
    func onConvertCurrency(amountString: String, fromCurrencyCode: String, toCurrencyCode: String)
}

protocol CurrencyExchangePresenterOutputProtocol: AnyObject {
    func showConvertedCurrency(amountFloat: Float)
}

// FIXME: Перепроверь открытые св-ва классов, мне кажется они должны быть закрытыми и ч/з конструктор инжектиться
// FIXME: Кроме случаев кольцевых связей, разумеется (нельзя сослаться на вью, которая еще не инстанцирована)
class CurrencyExchangePresenter {
    weak var view: CurrencyExchangeViewControllerProtocol?
    var interactor: CurrencyExchangeInteractorProtocol?
}

extension CurrencyExchangePresenter: CurrencyExchangePresenterInputProtocol {
    func viewDidLoad() {
        // FIXME: Magic String
        view?.updateAmountUzsTextLabel(with: "Введи сумму в тенге")
    }
    
    func onConvertCurrency(amountString: String, fromCurrencyCode: String, toCurrencyCode: String) {
        guard let amount = Float(amountString) else {
            // FIXME: Magic String
            view?.updateAmountUzsTextLabel(with: "Введи сумму в тенге")
            return
        }

        // FIXME: Completion можно в виде замыкающего выражения сдерать method(arg: "abc") { /* completion */ }
        // FIXME: тогда последний аргумент (блок кода или замыкание) без имени сдвинется за скобки
        self.interactor?.execute(amount: amount, fromCurrencyCode: fromCurrencyCode, toCurrencyCode: toCurrencyCode, complition: { money in
            if let currency = money.amount {
                self.showConvertedCurrency(amountFloat: currency)
            }
        })
    }
}

extension CurrencyExchangePresenter: CurrencyExchangePresenterOutputProtocol {
    func showConvertedCurrency(amountFloat: Float) {
        // FIXME: Magic String
        let string = String(format: "%.2f", amountFloat)
        view?.updateAmountUzsTextLabel(with: string)
    }
}
