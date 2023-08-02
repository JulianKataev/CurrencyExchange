//
//  Money.swift
//  CurrencyExchange
//
//  Created by Юлиан Катаев on 01.08.2023.
//

class Money {
    var amount: Float?
    
    init(amount: Float? = nil) {
        self.amount = amount
    }
    
    func converted(amount: Amount, exchangeRate: ExchangeRate) -> Money {
        self.amount = amount.amount * exchangeRate.rate
        return Money(amount: self.amount)
    }
}
