//
//  CurrencyExchangeInteractor.swift
//  CurrencyExchange
//
//  Created by Юлиан Катаев on 01.08.2023.
//
import Foundation

// FIXME: Хорошее правило: один тип — один файл. Вынеси интерефейс в свой собственный
protocol CurrencyExchangeInteractorProtocol: AnyObject {
    // FIXME: Typo (completion, NOT complition)
    func execute(amount: Float, fromCurrencyCode: String, toCurrencyCode: String, complition: @escaping (Money) -> Void)
}

class CurrencyExchangeInteractor: CurrencyExchangeInteractorProtocol {
    weak var presenter: CurrencyExchangePresenterOutputProtocol?
    // FIXME: Где интерфейс, Лебовски?! Здесь прямая зависимость от APICurrencyManager класса, а должна быть от интерфейса
    // FIXME: Это есть прямое нарушение DIP (D в SOLID) — принципа инверсии зависимостей
    // FIXME: Жду какой-нить ExchangeRateRemoteAPI интерфейс, а здесь конструктор с блек-джеком и шлюхами
    private let apiCurrencyManager = APICurrencyManager.shared
    
    func execute(amount: Float, fromCurrencyCode: String, toCurrencyCode: String, complition: @escaping (Money) -> Void) {
        let amount = Amount(amount: amount)
        let currency = Currency(fromCurrency: fromCurrencyCode, toCurrency: toCurrencyCode)

        // FIXME: На бекграунд поток с не понятным QoS переключился...
        DispatchQueue.global().async {
            self.apiCurrencyManager.getExchangeRate(currency: currency) { exchangeRate in
                let convert = Money().converted(amount: amount, exchangeRate: exchangeRate)
                // FIXME: ...а обратно на главный не вернулся
                complition(convert)
            }
        }
    }
}
