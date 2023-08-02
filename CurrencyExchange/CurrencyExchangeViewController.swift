//
//  ViewController.swift
//  CurrencyExchange
//
//  Created by Юлиан Катаев on 31.07.2023.
//

import UIKit
import Foundation

protocol CurrencyExchangeViewControllerProtocol: AnyObject {
    func updateAmountUzsTextLabel(with amountUsz: String)
}

class CurrencyExchangeViewController: UIViewController {
    @IBOutlet private var amountKztTextField: UITextField!
    @IBOutlet private var amountUzsLabel: UILabel!
    
    var presenter: CurrencyExchangePresenterInputProtocol?
    
    @IBAction func exchangeButtonDidTap() {
        if let amountKzt = amountKztTextField.text {
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

