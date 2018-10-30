//
//  CargaIncendioViewController.swift
//  PIncendio Beta
//
//  Created by Chrystian on 11/12/17.
//  Copyright © 2017 Chrystian Salgado. All rights reserved.
//

import Foundation
import UIKit

class CargaIncendioViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{
    
    var ocupacao: [String] = anexosData.ocupacao
    var cargas: [String] = anexosData.cargas
    
    @IBOutlet weak var ocupacaoPiker: UIPickerView!
    @IBOutlet weak var OcupacaoOpTf: UITextField!
    @IBOutlet weak var valorCargaLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "esconderTeclado")
        view.addGestureRecognizer(tap)
        
        ocupacaoPiker.delegate = self
        ocupacaoPiker.dataSource = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    func esconderTeclado(){
        view.endEditing(true)
    }
    
    //MARK: PickerView Delegates
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return ocupacao.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return ocupacao[row]
    }

    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        calculoCargaIncendio(row: row)
    }
    
    // MARK: Funções
    
    func calculoCargaIncendio(row: Int){
        let carga = cargas[row]
        valorCargaLbl.text = "Carga: " + carga + "MJ/m²"
    }
    
    @IBAction func helpButton(_ sender: Any) {
        let mensagem = "Para mais informações consulte o site do Corpo de Bombeiros \n IT - 09"
        let criarCaixaAlerta = UIAlertController(title: "Sobre", message: mensagem, preferredStyle: .alert)
        let acaoDismiss = UIAlertAction(title: "Dispensar", style: .destructive) { (_) in
            }
        criarCaixaAlerta.addAction(acaoDismiss)
        present(criarCaixaAlerta, animated: true, completion: nil)
    }
    
}
