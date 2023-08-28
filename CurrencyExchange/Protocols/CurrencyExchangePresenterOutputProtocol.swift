protocol CurrencyExchangePresenterOutputProtocol: AnyObject {
    func showConvertedMoney(money: Money)
    func showError(_ error: RemoteAPIErrors)
}
