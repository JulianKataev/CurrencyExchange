class CurrencyExchangePresenter {
    private var view: CurrencyExchangeViewControllerProtocol?
    private var interactor: CurrencyExchangeInteractorProtocol?
    
    init(view: CurrencyExchangeViewControllerProtocol? = nil, interactor: CurrencyExchangeInteractorProtocol? = nil) {
        self.view = view
        self.interactor = interactor
    }
}

extension CurrencyExchangePresenter: CurrencyExchangePresenterInputProtocol {
    func viewDidLoad() {
        // FIXME: Magic String
        view?.updateAmountUzsTextLabel(with: "Введи сумму в тенге")
    }
    
    func onConvertCurrency(amountString: String, fromCurrencyCode: String, toCurrencyCode: String) {
        guard let amount = Float(amountString) else {
            // FIXME: Magic String
            view?.updateAmountUzsTextLabel(with: "Введи сумму в тенге")
            return
        }

        // FIXME: Completion можно в виде замыкающего выражения сдерать method(arg: "abc") { /* completion */ }
        // FIXME: тогда последний аргумент (блок кода или замыкание) без имени сдвинется за скобки
        self.interactor?.execute(amount: amount, fromCurrencyCode: fromCurrencyCode, toCurrencyCode: toCurrencyCode, completion: { money in
            if let currency = money.amount {
                self.showConvertedCurrency(amountFloat: currency)
            }
        })
    }
}

extension CurrencyExchangePresenter: CurrencyExchangePresenterOutputProtocol {
    func showConvertedCurrency(amountFloat: Float) {
        // FIXME: Magic String
        let string = String(format: "%.2f", amountFloat)
        view?.updateAmountUzsTextLabel(with: string)
    }
}
