//
//  CSAlerts.swift
//  CSUtils
//
//  Created by Chrystian on 12/04/2018.
//

import Foundation

class CSAlerts {
    
    let locale = CSLocalizations()
    
     func buildAlert(title: String?, mensage: String, alertButtons: [AlertButtonEnum], _ withButtonColor: UIColor? = UIColor.black, completion: @escaping (_ :Void?)-> Void?)  -> UIAlertController {
        let alertBox = UIAlertController(title: title, message: mensage, preferredStyle: .alert)
        for itens in alertButtons {
            switch itens {
            case .OK:
                let action = UIAlertAction(title: locale.setLocalizableText("OK"), style: .default) { (_) in
                    completion(nil)
                }
                alertBox.addAction(action)
            case .CANCEL:
                let action = UIAlertAction(title: locale.setLocalizableText("CANCEL"), style: .default) { (_) in }
                alertBox.addAction(action)
            case .DISMISS:
                let action = UIAlertAction(title: locale.setLocalizableText("DISMISS"), style: .cancel) { (_) in }
                alertBox.addAction(action)
            }
        }
        return alertBox
    }
    
    func buildAlertWithTextField(title: String?, mensage: String, alertButtons: [AlertButtonEnum], _ withButtonColor: UIColor? = UIColor.black, completion: @escaping (_ :[String]?)-> Void?)  -> UIAlertController {
        let alertBox = UIAlertController(title: title, message: mensage, preferredStyle: .alert)
        alertBox.addTextField { (textField: UITextField) in
            textField.placeholder = "DIGITE_SEU_LOGIN"
        }
        alertBox.addTextField { (textField: UITextField) in
            textField.placeholder = "DIGITE_SUA_SENHA"
            textField.isSecureTextEntry = true
        }
        if let color = withButtonColor {
            alertBox.view.tintColor = color
        }
        
        for itens in alertButtons {
            switch itens {
            case .OK:
                let action = UIAlertAction(title: locale.setLocalizableText("OK"), style: .default) { (_) in
                    var textFields: [String] = []
                    if (alertBox.textFields?.forEach({ (textField) in
                        if let textFieldText = textField.text {
                            textFields.append(textFieldText)
                        }
                    })) != nil {
                        completion(textFields)
                    }
                }
                alertBox.addAction(action)
            case .CANCEL:
                let action = UIAlertAction(title: locale.setLocalizableText("CANCEL"), style: .default) { (_) in }
                alertBox.addAction(action)
            case .DISMISS:
                let action = UIAlertAction(title: locale.setLocalizableText("DISMISS"), style: .cancel) { (_) in }
                alertBox.addAction(action)
            }
        }
        return alertBox
    }
    
    func buildAlertWithTextField(title: String?, mensage: String, alertButtons: [AlertButtonEnum], _ withButtonColor: UIColor? = UIColor.black, numberOfFields: Int, completion: @escaping (_ :[String]?)-> Void?)  -> UIAlertController {
        let alertBox = UIAlertController(title: title, message: mensage, preferredStyle: .alert)
        for _ in 1...numberOfFields  {
            alertBox.addTextField { (textField: UITextField) in
                textField.placeholder = "Some placeholder text!"
            }
        }
        for itens in alertButtons {
            switch itens {
            case .OK:
                let action = UIAlertAction(title: locale.setLocalizableText("OK"), style: .default) { (_) in
                    var textFields: [String] = []
                    if (alertBox.textFields?.forEach({ (textField) in
                        if let textFieldText = textField.text {
                            textFields.append(textFieldText)
                        } else {
                            textField.becomeFirstResponder()
                        }
                    })) != nil {
                        completion(textFields)
                    }
                }
                alertBox.addAction(action)
            case .CANCEL:
                let action = UIAlertAction(title: locale.setLocalizableText("CANCEL"), style: .default) { (_) in }
                alertBox.addAction(action)
            case .DISMISS:
                let action = UIAlertAction(title: locale.setLocalizableText("DISMISS"), style: .cancel) { (_) in }
                alertBox.addAction(action)
            }
        }
        return alertBox
    }
}
