import UIKit
import Foundation

class CurrencyExchangeViewController: UIViewController {
    @IBOutlet private var amountKztTextField: UITextField!
    @IBOutlet private var amountUzsLabel: UILabel!
    
    private let fromCurrency = "KZT"
    private let toCurrency = "UZS"
    
    var presenter: CurrencyExchangePresenterInputProtocol?
    
    @IBAction func exchangeButtonDidTap() {
        if let string = amountKztTextField.text {
            presenter?.convertCurrency(fromCurrencyCode: fromCurrency, toCurrencyCode: toCurrency, amountKztText: string)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
}

extension CurrencyExchangeViewController: CurrencyExchangeViewControllerProtocol {
    func updateAmountUzsTextLabel(with amountUsz: String) {
        self.amountUzsLabel.text = amountUsz
    }
}
