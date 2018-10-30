//
//  AnaliseViewController.swift
//  PIncendio Beta
//
//  Created by Chrystian on 02/09/17.
//  Copyright © 2017 Chrystian Salgado. All rights reserved.
//

import UIKit

class AnaliseViewController: UIViewController {

    @IBOutlet weak var valorLbl: UILabel!
    @IBOutlet weak var areaTf: UITextField!
    
    private var constante: Double = 3.2514
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.textFieldSettings()
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "esconderTeclado")
        view.addGestureRecognizer(tap)
    }
    
    // MARK: Funções
    func calculoHidrante(){
        if let area = Double(areaTf.text!){
            let pt1 = constante * area
            let pt2 = pt1 * 0.10
            //valorLbl.text = ("R$ " + String(pt2))
            formatarValor(valor: pt2)
        }
        else{
             areaTf.text = ""
             areaTf.placeholder = "INFORME UMA AREA VALIDA !!!"
        }
    }
        
    func calculoExtintor(){
        if let area = Double(areaTf.text!){
            let pt1 = constante * area
            let pt2 = pt1 * 0.07
            //valorLbl.text = ("R$ " + String(pt2))
            formatarValor(valor: pt2)
         }
            else{
             areaTf.text = ""
             areaTf.placeholder = "INFORME UMA AREA VALIDA !!!"
        }
    }
    
    func updateMeters(){
        let area = (areaTf.text! + " m²")
        areaTf.text = area
    }
    
    func textFieldSettings(){
        areaTf.addTarget(self, action: #selector(self.updateMeters), for: .editingDidEndOnExit)
    }
    
    func esconderTeclado(){
        view.endEditing(true)
    }
    
    func formatarValor(valor: Double){
        let nf = NumberFormatter()
        nf.numberStyle = .decimal
        nf.numberStyle = .currency
        nf.locale = Locale(identifier: "pt_BR")
        
        let valorNS = NSNumber(value: valor)
        let valorTaxa = nf.string(from: valorNS)
        valorLbl.text = valorTaxa
    }
    
    // MARK: Actions

    @IBAction func ajudaBarButton(_ sender: Any) {
        let mensagem = "A taxa de análise é a qual deve ser paga para que os analistas do Corpo de Bombeiros fiscalizem a edificação com relação as suas normas."
        let criarCaixaAlerta = UIAlertController(title: "Sobre", message: mensagem, preferredStyle: .alert)
        let acaoDismiss = UIAlertAction(title: "Dispensar", style: .destructive) { (_) in
        }
        criarCaixaAlerta.addAction(acaoDismiss)
        present(criarCaixaAlerta, animated: true, completion: nil)
    }
    
    @IBAction func switchHidrante(_ sender: UISwitch) {
        if (sender.isOn == true){
            calculoHidrante()
        }else{
            calculoExtintor()
        }
    }
}
