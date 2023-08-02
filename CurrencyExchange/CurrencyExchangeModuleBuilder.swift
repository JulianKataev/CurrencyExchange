//
//  CurrencyExchangeModuleBuilder.swift
//  CurrencyExchange
//
//  Created by Юлиан Катаев on 01.08.2023.
//

import UIKit

class CurrencyExchangeModuleBuilder {
    func build() -> CurrencyExchangeViewController {
        let presenter = CurrencyExchangePresenter()
        let interactor = CurrencyExchangeInteractor()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "Main") as! CurrencyExchangeViewController
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.view = viewController
        interactor.presenter = presenter
        return viewController
    }
}
