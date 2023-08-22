import UIKit

class CurrencyExchangeModuleBuilder {
    static func build() -> CurrencyExchangeViewController {
        let storyboard = UIStoryboard(name: CurrencyExchangeConstants.MAIN_SB_NAME, bundle: nil)
        let viewController = storyboard.instantiateViewController(
            withIdentifier: CurrencyExchangeConstants.MAIN_VC_ID
        ) as! CurrencyExchangeViewController
        let urlProvider = URLProvider()
        let exchangeRateRemoteAPImanager = ExchangeRateRemoteAPI(urlProvider: urlProvider)
        let interactor = CurrencyExchangeInteractor(exchangeRateRemoteAPImanager: exchangeRateRemoteAPImanager)
        let presenter = CurrencyExchangePresenter(view: viewController, interactor: interactor)
        viewController.presenter = presenter
        interactor.presenter = presenter
        return viewController
    }
}
