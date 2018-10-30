//
//  CadastroViewController.swift
//  PIncendio Beta
//
//  Created by Chrystian on 25/08/17.
//  Copyright © 2017 Chrystian Salgado. All rights reserved.
//

import Foundation
import UIKit
import CoreData
import UserNotifications

enum alertType {
    case erro
    case tip
}

class CadastroViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var botaoSalvar: UIBarButtonItem!
    @IBOutlet weak var areaLbl: UITextField!
    @IBOutlet weak var alturaLbl: UITextField!
    @IBOutlet weak var ocupacaoPicker: UIPickerView!
    @IBOutlet weak var redsBOLbl: UITextField!
    @IBOutlet weak var cpfCNPJLbl: UITextField!
    @IBOutlet weak var nProcessoLbl: UITextField!
    @IBOutlet weak var responsavelUsoLbl: UITextField!
    @IBOutlet weak var stackAtualizaOcupacao: UIStackView!
    @IBOutlet weak var ocupacaoLbl: UILabel!
    //    @IBOutlet weak var dataProcessoLbl: UILabel!

    
    var gerenciadorBanco: NSManagedObjectContext!
    var processo: NSManagedObject!
    var ocupacaoAraay = anexosData.ocupacao
    var ocupacao: String!
    var notificacao1: Int = 28
    var notificacao2: Int = 29
    var notificacao3: Int = 30
    var segundos: Float!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "esconderTeclado")
        
        view.addGestureRecognizer(tap)
        ocupacaoPicker.delegate = self
        ocupacaoPicker.dataSource = self
        
        stackAtualizaOcupacao.isHidden = true
        
        textFieldSettings()
        
        // ---->>> acessa o banco de dados
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        gerenciadorBanco = appDelegate.persistentContainer.viewContext
        
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        if processo != nil {
            botaoSalvar.title = "Atualizar"
            self.nProcessoLbl.text = processo.value(forKey: "nProcesso") as? String
            self.responsavelUsoLbl.text = processo.value(forKey: "responsavelUso") as? String
            self.cpfCNPJLbl.text = processo.value(forKey: "cpfCNPJ") as? String
            self.alturaLbl.text = processo.value(forKey: "altura") as? String
            self.areaLbl.text = processo.value(forKey: "area") as? String
            self.ocupacaoLbl.text = processo.value(forKey: "ocupacao") as? String
            stackAtualizaOcupacao.isHidden = false
            ocupacaoPicker.isHidden = true
            // adicionar um numero do REDS ou Boletim de Ocorrencia
            // self.dataProcessoLbl.text = processo.value(forKey: "dataCriacao") as? String
        }
            else {
        }
    }

    //    func mockProcesso() -> ProcessoMock {
    //        let processo = ProcessoMock.init(numeroProcesso: <#T##String!#>, responsavelUso: <#T##String!#>, alturaEdificacao: <#T##String?#>, areaEdificacao: <#T##String?#>, ocupacaoEdificacao: <#T##String?#>)
    //        return processo
    //    }
    
    //MARK: CoreData process
    
    func salvarProcesso(){
        let entidade = NSEntityDescription.insertNewObject(forEntityName: "Processo", into: gerenciadorBanco)
        
        entidade.setValue(self.nProcessoLbl.text, forKey: "nProcesso")
        entidade.setValue(self.responsavelUsoLbl.text, forKey: "responsavelUso")
        entidade.setValue(self.cpfCNPJLbl.text, forKey: "cpfCNPJ")
        entidade.setValue(self.alturaLbl.text, forKey: "altura")
        entidade.setValue(self.areaLbl.text, forKey: "area")
        entidade.setValue(ocupacao, forKey: "ocupacao")
        // entidade.setValue(NSDate(), forKey: "dataCriacao")
        if self.nProcessoLbl.text != "" || self.responsavelUsoLbl.text != "" {
            do{
                try gerenciadorBanco.save()
                    self.notificacao()
                    self.witchAlert(type: .erro, mensage: "Dados salvos com sucesso")
                    self.navigationController?.popViewController(animated: true) //retorar pra tela inicial
            }catch{
                self.witchAlert(type: .erro, mensage: "Não foi possivel salvar os dados")
            }
        }
        else {
            self.criaAlerta(title: "Atenção", mensage: "Não é possivel salvar os dados, pois existem dados em branco\n Preencha os dados faltantes", style: .default)
            if self.nProcessoLbl.text == "" {
                self.nProcessoLbl.placeholder = "Insira o nº do Processo AQUI !!!"
            }
            else {
                self.responsavelUsoLbl.placeholder = "Insira o nome do responsavel pelo uso AQUI !!!"
            }
        }
    }
    
    func atualizarProcesso(){
        
        processo.setValue(self.nProcessoLbl.text, forKey: "nProcesso")
        processo.setValue(self.responsavelUsoLbl.text, forKey: "responsavelUso")
        processo.setValue(self.cpfCNPJLbl.text, forKey: "cpfCNPJ")
        processo.setValue(self.alturaLbl.text, forKey: "altura")
        processo.setValue(self.areaLbl.text, forKey: "area")
        processo.setValue(self.ocupacao, forKey: "ocupacao")
        
        if self.nProcessoLbl.text != "" && self.responsavelUsoLbl.text != "" {
            do{
                try gerenciadorBanco.save()
                    self.witchAlert(type: .erro, mensage: "Dados atualizados com sucesso")
            }catch{
                self.witchAlert(type: .erro, mensage: "Não foi possivel atualizar os dados")
            }
        }
        else {
            self.criaAlerta(title: "Atenção", mensage: "Não é possivel atualizar os dados, pois existem dados em branco\n Preencha os dados faltantes", style: .default)
            if self.nProcessoLbl.text == "" {
                self.nProcessoLbl.placeholder = "Insira o nº do Processo AQUI !!!"
            }
            else {
                self.responsavelUsoLbl.placeholder = "Insira o nome do responsavel pelo uso AQUI !!!"
            }
        }
    }
    //MARK: Essas funcões tratam dos elementos e dos tratamentos.
    
    func esconderTeclado(){
        view.endEditing(true)
    }
    
    func generateMetersQua(){
        let area = (areaLbl.text! + " m²")
        areaLbl.text = area
    }
    
    func generateMeters(){
        let altura = (alturaLbl.text! + " m")
        alturaLbl.text = altura
    }
    
    
    func textFieldSettings(){
        nProcessoLbl.addTarget(responsavelUsoLbl, action: #selector(becomeFirstResponder), for: .editingDidEndOnExit)
        responsavelUsoLbl.addTarget(cpfCNPJLbl, action: #selector(becomeFirstResponder), for: .editingDidEndOnExit)
        cpfCNPJLbl.addTarget(alturaLbl, action: #selector(becomeFirstResponder), for: .editingDidEndOnExit)
        alturaLbl.addTarget(areaLbl, action: #selector(becomeFirstResponder), for: .editingDidEndOnExit)
        areaLbl.addTarget(self, action: #selector(self.esconderTeclado), for: .editingDidEndOnExit)
        areaLbl.addTarget(self, action: #selector(self.generateMetersQua), for: .editingDidEnd)
        alturaLbl.addTarget(self, action: #selector(self.generateMeters), for: .editingDidEnd)
    }
    
    //MARK: Essas funcões abaixo configuram o picker view
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return ocupacaoAraay.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return ocupacaoAraay[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.ocupacao = ocupacaoAraay[row]
    }

    
    //MARK: Notificações
    
    func criaNotificacao(nProcesso: String, dias: String) -> UNMutableNotificationContent{
        let conteudo = UNMutableNotificationContent()
        conteudo.title = "Seu processo está vencendo"
        conteudo.badge = 1
        conteudo.body = ("O Processo nº" + nProcesso + " vence em " + dias + " dias")
    return conteudo
        
    }
    
    func diasparaNotificar(conteudo: UNMutableNotificationContent, numDias: Int){
        if numDias > 15 {
            let numDiasF = Float(numDias)
            self.segundos = numDiasF/3600
            let disparaTempo = UNTimeIntervalNotificationTrigger(timeInterval: TimeInterval(self.segundos), repeats: false)
            let fazNotificacao = UNNotificationRequest(identifier: "acabando Tempo", content: conteudo, trigger: disparaTempo)
            UNUserNotificationCenter.current().add(fazNotificacao, withCompletionHandler: nil)
        }
            else {
                let segundos = numDias
                let disparaTempo = UNTimeIntervalNotificationTrigger(timeInterval: TimeInterval(segundos), repeats: false)
                let fazNotificacao = UNNotificationRequest(identifier: "acabando Tempo", content: conteudo, trigger: disparaTempo)
                UNUserNotificationCenter.current().add(fazNotificacao, withCompletionHandler: nil)
        }
    }
    
    func notificacao(){
        let mensagem1 = criaNotificacao(nProcesso: self.nProcessoLbl.text!, dias: String(notificacao1))
        diasparaNotificar(conteudo: mensagem1, numDias: notificacao1)
        let mensagem2 = criaNotificacao(nProcesso: self.nProcessoLbl.text!, dias: String(notificacao2))
        diasparaNotificar(conteudo: mensagem2, numDias: notificacao2)
        let mensagem3 = criaNotificacao(nProcesso: self.nProcessoLbl.text!, dias: String(notificacao3))
        diasparaNotificar(conteudo: mensagem3, numDias: notificacao3)
    }
    
    //MARK: Alertas
    func witchAlert(type: alertType, mensage: String){
        switch type {
        case .erro:
            criaAlerta(title: "Atenção", mensage: mensage, style: .destructive)
        case .tip:
            criaAlerta(title: "Ajuda", mensage: mensage, style: .default)
        }
    }
    
    func criaAlerta(title: String, mensage: String, style: UIAlertActionStyle){
        if style == .default {
            let criarCaixaAlerta = UIAlertController(title: title, message: mensage, preferredStyle: .alert)
            let acaoDismiss = UIAlertAction(title: "Ok !", style: style) { (_) in
            }
            criarCaixaAlerta.addAction(acaoDismiss)
            present(criarCaixaAlerta, animated: true, completion: nil)
        } else {
            let criarCaixaAlerta = UIAlertController(title: title, message: mensage, preferredStyle: .alert)
            let acaoDismiss = UIAlertAction(title: "Continuar", style: style) { (_) in
                self.navigationController?.popToRootViewController(animated: true)
            }
            criarCaixaAlerta.addAction(acaoDismiss)
            present(criarCaixaAlerta, animated: true, completion: nil)
        }
    }
    
    //MARK: Actions
    
    @IBAction func editOcupacao(_ sender: Any) {
        ocupacaoPicker.isHidden = false
        stackAtualizaOcupacao.isHidden = true
    }
    
    @IBAction func btSalvar(_ sender: Any) {
        if processo != nil {
            atualizarProcesso()
        }else {
            salvarProcesso()
        }
    }
    
    @IBAction func btInformacao(_ sender: Any) {
        self.witchAlert(type: .tip, mensage: "Aqui, você pode salvar seus processos, para que seja lembrado do seu prazo em relação ao dia que você adicionou em nosso sistema. \n Caso um dia precise, você pode voltar aqui para consultar ou alterar os dados de um determinado processo.")
    }
    
}

