//
//  Currency.swift
//  CurrencyExchange
//
//  Created by Юлиан Катаев on 01.08.2023.
//

// FIXME: Currency — это одна конкретная валюта USD, RUB, UZS, KZT, etc.
// FIXME: Что нам нужно о ней знать для приложения?
// FIXME: Только ее код. Т.е. Currency — это код валюты. Возможно, это CurrencyCode. Нарисуй единственное свойство `value`.
// FIXME: В этом приложении Currency поведением не обладает, а значит это скорее всего структура
// FIXME: Также нам нужно отличать одну валюту от другой. Структуры equatable из коробки, если свойства — примитивы

// FIXME: *Что будет, если создать в системе Currency с несуществующим кодом?
// FIXME: Типа, CurrencyCode(value: "SPARTA-MONEY"), а не CurrencyCode(value: "USD")?
class Currency {
    // FIXME: информация о том «что» и «во что» мы конвертим и так есть у Interactor'a
    let fromCurrencyCode: String
    let toCurrencyCode: String
    
    init(fromCurrency: String, toCurrency: String) {
        self.fromCurrencyCode = fromCurrency
        self.toCurrencyCode = toCurrency
    }
}
