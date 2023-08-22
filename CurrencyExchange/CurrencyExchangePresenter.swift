class CurrencyExchangePresenter {
    private weak var view: CurrencyExchangeViewControllerProtocol?
    private var interactor: CurrencyExchangeInteractorProtocol
    private let placeholder = "Введи сумму в тенге"
    private let stringFormatter = "%.2f"
    
    init(view: CurrencyExchangeViewControllerProtocol, interactor: CurrencyExchangeInteractorProtocol) {
        self.view = view
        self.interactor = interactor
    }
}

extension CurrencyExchangePresenter: CurrencyExchangePresenterInputProtocol {
    func convertCurrency(fromCurrencyCode: String, toCurrencyCode: String, amountKztText: String) {
        if let amount = Double(amountKztText) {
            interactor.execute(from: CurrencyCode(value: fromCurrencyCode),
                               to: CurrencyCode(value: toCurrencyCode),
                               amount: Amount(value: amount))
        } else {
            view?.updateAmountUzsTextLabel(with: placeholder)
        }
    }
    
    func viewDidLoad() {
        view?.updateAmountUzsTextLabel(with: placeholder)
    }
}

extension CurrencyExchangePresenter: CurrencyExchangePresenterOutputProtocol {
    func showConvertedMoney(money: Money) {
        let string = String(format: stringFormatter, money.amount.value)
        view?.updateAmountUzsTextLabel(with: string)
    }
}
