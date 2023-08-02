//
//  CurrencyExchangeInteractor.swift
//  CurrencyExchange
//
//  Created by Юлиан Катаев on 01.08.2023.
//
import Foundation

protocol CurrencyExchangeInteractorProtocol: AnyObject {
    func execute(amount: Float, fromCurrencyCode: String, toCurrencyCode: String, complition: @escaping (Money) -> Void)
}

class CurrencyExchangeInteractor: CurrencyExchangeInteractorProtocol {
    weak var presenter: CurrencyExchangePresenterOutputProtocol?
    private let apiCurrencyManager = APICurrencyManager.shared
    
    func execute(amount: Float, fromCurrencyCode: String, toCurrencyCode: String, complition: @escaping (Money) -> Void) {
        let amount = Amount(amount: amount)
        let currency = Currency(fromCurrency: fromCurrencyCode, toCurrency: toCurrencyCode)
        
        DispatchQueue.global().async {
            self.apiCurrencyManager.getExchangeRate(currency: currency) { exchangeRate in
                let convert = Money().converted(amount: amount, exchangeRate: exchangeRate)
                complition(convert)
            }
        }
    }
}
