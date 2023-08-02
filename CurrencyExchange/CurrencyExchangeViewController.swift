import UIKit
import Foundation

class CurrencyExchangeViewController: UIViewController {
    @IBOutlet private var amountKztTextField: UITextField!
    @IBOutlet private var amountUzsLabel: UILabel!
    
    weak var presenter: CurrencyExchangePresenterInputProtocol?
    
    @IBAction func exchangeButtonDidTap() {
        if let amountKzt = amountKztTextField.text {
            // FIXME: Вью скорее всего не должна знать о кодах валют — это чистая бизнес-логика
            // FIXME: А значит эти коды ей либо должны поставлять извне, либо эти коды должны указываться в др. месте
            presenter?.onConvertCurrency(amountString: amountKzt, fromCurrencyCode: "KZT", toCurrencyCode: "UZS")
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
}

extension CurrencyExchangeViewController: CurrencyExchangeViewControllerProtocol {
    func updateAmountUzsTextLabel(with amountUsz: String) {
        DispatchQueue.main.async {
            self.amountUzsLabel.text = amountUsz
        }
    }
}
