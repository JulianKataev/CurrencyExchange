protocol CurrencyExchangePresenterInputProtocol: AnyObject {
    func viewDidLoad()
    func convertCurrency(fromCurrencyCode: String, toCurrencyCode: String, amountKztText: String)
}
