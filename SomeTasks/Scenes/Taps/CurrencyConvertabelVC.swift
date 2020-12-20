//
//  ViewController.swift
//  SomeTasks
//
//  Created by ahmed gado on 20/12/2020.
//

import UIKit

class CurrencyConvertabelVC: UIViewController {
    @IBOutlet weak var secondTextField: UITextField!
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var priceTextFiled: UITextField!
    fileprivate let pickerView = ToolbarPickerView()
    var countriesData = ["AED", "AFN", "ALL", "AMD", "ANG", "AOA", "ARS", "AUD", "AWG", "AZN", "BAM", "BBD", "BDT", "BGN" , "BHD" , "BIF" , "BMD", "BND", "BOB", "BRL", "BSD", "BTC", "BTN", "BWP", "BYN", "BYR", "BZD", "CAD", "CDF", "CHF", "CLF", "CLP", "CNY", "COP", "CRC", "CUC", "CUP", "CVE" , "CZK", "DJF", "DKK", "DOP", "DZD", "EGP", "ERN", "ETB", "EUR", "FJD", "FKP", "GBP", "GEL", "GGP", "GHS", "GIP", "GMD", "GNF", "GTQ", "GYD", "HKD", "HNL", "HRK", "HTG", "HUF", "IDR", "ILS", "IMP", "INR", "IQD", "IRR", "ISK", "JEP", "JMD", "JOD", "JPY", "KES", "KGS", "KHR", "KMF", "KPW", "KRW", "KWD", "KYD", "KZT", "LAK", "LBP", "LKR", "LRD", "LSL", "LTL", "LVL", "LYD", "MAD", "MDL", "MGA", "MKD", "MMK", "MNT", "MOP", "MRO", "MUR", "MVR", "MWK", "MXN", "MYR", "MZN", "NAD", "NGN", "NIO", "NOK", "NPR", "NZD", "OMR", "PAB", "PEN", "PGK", "PHP", "PKR", "PLN", "PYG", "QAR", "RON", "RSD", "RUB", "RWF", "SAR", "SBD", "SCR", "SDG", "SEK", "SGD", "SHP", "SLL", "SOS", "SRD", "STD", "SVC", "SYP", "SZL", "THB", "TJS", "TMT", "TND", "TOP", "TRY", "TTD", "TWD", "TZS", "UAH", "UGX", "USD", "UYU", "UZS", "VEF", "VND", "VUV", "WST", "XAF", "XAG", "XAU", "XCD", "XDR", "XOF", "XPF", "YER", "ZAR", "ZMK", "ZMW", "ZWL"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.secondTextField.inputView = self.pickerView
        self.secondTextField.inputAccessoryView = self.pickerView.toolbar
        
        self.pickerView.dataSource = self
        self.pickerView.delegate = self
        self.pickerView.toolbarDelegate = self
        
        self.pickerView.reloadAllComponents()
        hideKeyboardWhenTappedAround()

    }

    @IBAction func showResultButtonPressed(_ sender: Any) {
        getResult()
    }
    func getResult()  {
        showIndicator()
        ApiRouter.checkKey(keyUrl: "6b381158652837361b9bc5a138ab2a3f", from: "USD", to: secondTextField.text ?? "", amount: priceTextFiled.text ?? "0").send(ApiKeyModel.self) { [weak self] response in
            guard let self = self else{return}
            self.hideIndicator()
            switch response {

            case .success(let value):
                self.resultLabel.text = "\(value.result)"
        
            case .failure(let error):
                guard let errorMessage = error as? APIError else {
                    // server Error
                print(error.localizedDescription)
                   return
                }
                // BackEnd Error
                    print(errorMessage.localizedDescription)
                Alert.showAlertOnVC(target: self, title: " Error", message: errorMessage.localizedDescription)

            }
        }
    }
    
}

extension CurrencyConvertabelVC: UIPickerViewDataSource, UIPickerViewDelegate {

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.countriesData.count
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.countriesData[row]
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.secondTextField.text = self.countriesData[row]
    }
}

extension CurrencyConvertabelVC: ToolbarPickerViewDelegate {

    func didTapDone() {
        let row = self.pickerView.selectedRow(inComponent: 0)
        self.pickerView.selectRow(row, inComponent: 0, animated: false)
        self.secondTextField.text = self.countriesData[row]
        self.secondTextField.resignFirstResponder()
    }

    func didTapCancel() {
        self.secondTextField.text = nil
        self.secondTextField.resignFirstResponder()
    }
}
