//
//  ViewController.swift
//  CurrencyExchange
//
//  Created by Юлиан Катаев on 31.07.2023.
//

import UIKit
import Foundation

// FIXME: один тип — один файл
protocol CurrencyExchangeViewControllerProtocol: AnyObject {
    func updateAmountUzsTextLabel(with amountUsz: String)
}

class CurrencyExchangeViewController: UIViewController {
    @IBOutlet private var amountKztTextField: UITextField!
    @IBOutlet private var amountUzsLabel: UILabel!
    
    var presenter: CurrencyExchangePresenterInputProtocol?
    
    @IBAction func exchangeButtonDidTap() {
        if let amountKzt = amountKztTextField.text {
            // FIXME: Вью скорее всего не должна знать о кодах валют — это чистая бизнес-логика
            // FIXME: А значит эти коды ей либо должны поставлять извне, либо эти коды должны указываться в др. месте
            presenter?.onConvertCurrency(amountString: amountKzt, fromCurrencyCode: "KZT", toCurrencyCode: "UZS")
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // FIXME: ты же вроде ослабляешь ссылку в презентере
        // FIXME: здесь (ссылка НА) презентер мне кажется обязательным и не опциональным
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

