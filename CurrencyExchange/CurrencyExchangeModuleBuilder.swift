//
//  CurrencyExchangeModuleBuilder.swift
//  CurrencyExchange
//
//  Created by Юлиан Катаев on 01.08.2023.
//

import UIKit

// FIXME: Это stateless (не хранящий состояние) класс с единственным методом
// FIXME: Чисто технически его экземпляр нам не нужен, чтобы сбилдить CurrencyExchange
class CurrencyExchangeModuleBuilder {
    // FIXME: Сейчас этот метод принадлежит экземпляру (объекту), но ведь нам не нужно хранить состояние этого объекта
    // FIXME: А значит можно сделать его методом типа, т.е. статическим
    func build() -> CurrencyExchangeViewController {
        let presenter = CurrencyExchangePresenter()
        let interactor = CurrencyExchangeInteractor()
        // FIXME: Magic String следует выносить в именованные константы
        // FIXME: В данном случае очевидно, что Main — это имя борды, но в качестве дисцплины константы все равно лучше
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        // FIXME: А вот в данном случае уже интереснее:
        // FIXME: У тебя 2 строки Main и это не одно и тоже и не о том же
        // FIXME: Первая - имя борды; Вторая — идентификатор вью контролера
        // FIXME: эти граждане должны лежать в константах MAIN_SB_NAME и MAIN_VC_ID, соответственно
        let viewController = storyboard.instantiateViewController(withIdentifier: "Main") as! CurrencyExchangeViewController
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.view = viewController
        interactor.presenter = presenter
        return viewController
    }
}
