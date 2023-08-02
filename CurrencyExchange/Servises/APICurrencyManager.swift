//
//  APITransferManager.swift
//  CurrencyExchange
//
//  Created by Юлиан Катаев on 01.08.2023.
//

import Foundation

final class APICurrencyManager {
    private var urlString = "https://open.er-api.com/v6/latest/"
    static let shared = APICurrencyManager()
    
    private init() {}
    
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
