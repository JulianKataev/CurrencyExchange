protocol CurrencyExchangePresenterInputProtocol: AnyObject {
    func viewDidLoad()
    func onConvertCurrency(amountString: String, fromCurrencyCode: String, toCurrencyCode: String)
}
