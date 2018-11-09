//
//  CSLocalizations.swift
//  CSUtils
//
//  Created by Chrystian on 14/04/2018.
//

import Foundation
import UIKit

class CSLocalizations {
    
    /*
     - Seta uma localização definida por string
     - Parameter: String
     - Return: NSLocalizedString
     */
    func setLocalizableText(_ text: String) -> String {
        return NSLocalizedString(text, comment: "")
    }
    
    /*
     - Verifica se há conteudo em um determinado textfield, e retorna se há ou não
     - Parameter: UITextField
     - Return: Bool
     */
    func haveEmptyFields(_ fields: [UITextField]) -> Bool {
        var emptyField: Bool!
        for field in fields {
            if let text = field.text {
                if text.isEmpty || text == " " {
                    emptyField = true
                }
            }
        }
        return emptyField == true ? emptyField : false
    }
}
