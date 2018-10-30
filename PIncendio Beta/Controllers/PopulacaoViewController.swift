//
//  PopulacaoViewController.swift
//  PIncendio Beta
//
//  Created by Chrystian on 03/09/17.
//  Copyright © 2017 Chrystian Salgado. All rights reserved.
//

import UIKit


class PopulacaoViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var porMetroLbl: UILabel!
    @IBOutlet weak var areaTf: UITextField!
    @IBOutlet weak var totalPopulacaoLbl: UILabel!
    @IBOutlet weak var ocupacaoPiker: UIPickerView!
    @IBOutlet weak var segmentUP: UISegmentedControl!
    
    var ocupacao: [String] = anexosData.ocupacao
    var upOcupacaoAcesso: [String] = anexosData.upOcupacaoAcesso
    var upOcupacaoEscadas: [String] = anexosData.upOcupacaoEscadas
    var upOcupacaoPortas: [String] = anexosData.upOcupacaoPortas
    var populacao: [Double] = anexosData.populacao
    var valorUP: Int!
    var row: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "esconderTeclado")
        view.addGestureRecognizer(tap)
        let tap2: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "updateMeters")
        view.addGestureRecognizer(tap)
        view.addGestureRecognizer(tap2)
        
        ocupacaoPiker.delegate = self
        ocupacaoPiker.dataSource = self
    }
    
    func esconderTeclado(){
        view.endEditing(true)
    }
    
    func calculaPopulacaopMetro(UP: Int, row: Int) -> String{
        var result: String = ""
        self.porMetroLbl.text = String(Int(populacao[row])) + " Pessoas /m²"

            if let area = Double(self.areaTf.text!) {
                let porMetroQuadrado = self.populacao[row]
                var pt1 = area / porMetroQuadrado
                pt1 = pt1 / Double(UP)
                var resultadoAproximado = Int(pt1.rounded())
                if resultadoAproximado == 0 {
                    resultadoAproximado = 1
                    result = String(resultadoAproximado) + " Unidade de Passagem"
                }
                else {
                    result = String(resultadoAproximado) + " Unidades de Passagem"
                }
        }
            else {
                result = "Insira uma Area Valida"
        }
        return result
    }
    
    func updateMeters(){
        self.recalcular()
        if areaTf.text != ""{
            let area = (areaTf.text! + " m²")
            areaTf.text = area
        }
    }
    
    func textFieldSettings(){
        areaTf.addTarget(self, action: #selector(self.updateMeters), for: .editingDidEnd)
    }
    
    func recalcular(){
        if self.row != nil {
            if valorUP != nil {
                totalPopulacaoLbl.text = calculaPopulacaopMetro(UP: self.valorUP, row: self.row)
            }
        }
        self.esconderTeclado()
    }
    
    //MARK: Essas funcões abaixo configuram o picker view
    
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
        areaTf.text = ""
        if segmentUP.selectedSegmentIndex == 0 {
            self.valorUP = Int(upOcupacaoAcesso[row])
            self.row = row
//            self.recalcular()
        }
        else {
            if segmentUP.selectedSegmentIndex == 1 {
                self.valorUP = Int(upOcupacaoEscadas[row])
                self.row = row
//                self.recalcular()
            }
            else  {
                self.valorUP = Int(upOcupacaoPortas[row])
                self.row = row
//                self.recalcular()
            }
        }
    }
    

    @IBAction func sobreAlertaPopulacao(_ sender: Any) {
            let mensagem = "As saidas de emergência são dimensionadas em função da população da edificação\n N=P/C\n Confome IT 08"
            let criarCaixaAlerta = UIAlertController(title: "Sobre", message: mensagem, preferredStyle: .alert)
            let acaoDismiss = UIAlertAction(title: "Dispensar", style: .destructive) { (_) in
            }
            criarCaixaAlerta.addAction(acaoDismiss)
            present(criarCaixaAlerta, animated: true, completion: nil)
    }
    
}
