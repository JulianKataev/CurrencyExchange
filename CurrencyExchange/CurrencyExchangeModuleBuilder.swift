import UIKit

class CurrencyExchangeModuleBuilder {
    static func build() -> CurrencyExchangeViewController {
        let urlProvider = URLProvider()
        let currencyPriceRemoteApiManager = CurrencyPriceRemoteAPI(urlProvider: urlProvider)
        let interactor = CurrencyExchangeInteractor(currencyPriceRemoteApiManager: currencyPriceRemoteApiManager)
        let storyboard = UIStoryboard(name: CurrencyExchangeConstants.MAIN_SB_NAME, bundle: nil)
        let viewController = storyboard.instantiateViewController(
            withIdentifier: CurrencyExchangeConstants.MAIN_VC_ID
        ) as! CurrencyExchangeViewController 
        let presenter = CurrencyExchangePresenter(view: viewController, interactor: interactor)
        viewController.presenter = presenter
        interactor.presenter = presenter
        return viewController
    }
}
