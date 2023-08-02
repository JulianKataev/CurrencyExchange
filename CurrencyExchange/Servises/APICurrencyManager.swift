//
//  APITransferManager.swift
//  CurrencyExchange
//
//  Created by Юлиан Катаев on 01.08.2023.
//

import Foundation

// FIXME: Обычно API стоит в конце имени, но есть ощущение, что это API рейтов валют, т.е. ExchangeRateRemoteAPI
// FIXME: Remote в имени обращает внимание на то, что данные будут поставляют из удаленного источника
final class APICurrencyManager {
    // FIXME: Хардкод адреса приводит к невозможности подключения тестового сервера рейтов, нужно получать из конфига
    private var urlString = "https://open.er-api.com/v6/latest/"

    // FIXME: здесь не нужен синглтон, инстанцируй для каждого юзкейса свой экземпляр RemoteAPI
    static let shared = APICurrencyManager()
    
    private init() {}

    // FIXME: Где-то тут на вход полетело 2 экземпляра Currency (KZT и UZS, например)
    // FIXME: Один of, второй — to
    // FIXME: т.е. getExchangeRate(of: Currency(value: "KZT"), to: Currency(value: "UZS")) { /* completion goes here */ }
    // FIXME: Буквально, значит «Дай курс обмена сумм к тенге»
    func getExchangeRate(currency: Currency, complition: @escaping (ExchangeRate) -> Void) {
        urlString += currency.fromCurrencyCode
        guard let url = URL(string: urlString) else { return }
        
        let request = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data else { return }
            if let currencyData = try? JSONDecoder().decode(CurrencyData.self, from: data) {
                if let rate = currencyData.rates[currency.toCurrencyCode] {
                    complition(ExchangeRate(exchangeRate: rate))
                }
            }
        }
        task.resume()
    }
}
