//
//  Currency.swift
//  CurrencyExchange
//
//  Created by Юлиан Катаев on 01.08.2023.
//

class Currency {
    let fromCurrencyCode: String
    let toCurrencyCode: String
    
    init(fromCurrency: String, toCurrency: String) {
        self.fromCurrencyCode = fromCurrency
        self.toCurrencyCode = toCurrency
    }
}
