//
//  ViewController.swift
//  PIncendio Beta
//
//  Created by Chrystian on 25/08/17.
//  Copyright © 2017 Chrystian Salgado. All rights reserved.
//

import UIKit
import CoreData
import UserNotifications

class ListaViewController: UITableViewController {

    var gerenciadorBanco: NSManagedObjectContext!
    var processos: [NSManagedObject] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //cria a permissao da notificação
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge], completionHandler: { didAllow, error in })
        

        //cria conexao com banco
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        gerenciadorBanco = appDelegate.persistentContainer.viewContext     
        
    }

    
    override func viewDidAppear(_ animated: Bool) {
       
        carregarProcessos()
    
    }
    
    
    
    func carregarProcessos(){
        // criamos uma requisicao, essa pede os dado ao banco de dados
        let requisicao = NSFetchRequest<NSFetchRequestResult>(entityName: "Processo")
        
        do{
            //carregar os dados
            let processosRecuperados = try gerenciadorBanco.fetch(requisicao) //tenta recuperar os dados do banco
            //temos que armazenas a consulta dentro de uma variavel local, para podermos acessar os conteudos do array
            
            self.processos = processosRecuperados as! [NSManagedObject] //carregamos os processos do banco de dados para o array de nome processos
    
            tableView.reloadData()
            
            }catch{
            print("Não foi possivel carregar os dados")
        }
        
        
        
    }
       
    
    // ----------> trata os elementos da tabela <----------------
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return processos.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = tableView.dequeueReusableCell(withIdentifier: "celulaReuso", for: indexPath)
        
        
    //carregamos uma anotacao especifica
        let processoLocal = self.processos[indexPath.row] //carregamos um processo da linha escolhida
        
        celula.textLabel?.text = processoLocal.value(forKey: "nProcesso") as? String
        celula.detailTextLabel?.text = processoLocal.value(forKey: "responsavelUso") as? String
        
        
        return celula
        
    }
    

    
    // ----------> trata da atualização de um determinado elemento <----------------
    
    //esse metodo executa um comando quando a linha X é selecionada
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //descelecionar a linha quando clicada
        self.tableView.deselectRow(at: indexPath, animated: true)
        
        //carrear os dados da linha selecionada
        let processo = processos [indexPath.row]
        
        //passa o conteudo para a outra view
        self.performSegue(withIdentifier: "verProcessos", sender: processo)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "verProcessos" {
            
            let viewControllerDestino = segue.destination as! CadastroViewController
            viewControllerDestino.processo = sender as? NSManagedObject // o processo da classe Cadastro...Controller recebe o conteudo passado pelo sender
        }
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete {
            // recuperar a anotação selecionada para ser deletada
            
            let indice = indexPath.row //indice recebe a linha
            let anotacaoDeletar = self.processos[indice] //recebe a anotacao que desejamos deletar
            
            self.gerenciadorBanco.delete(anotacaoDeletar)
             //deleta a anotacao capturada
            self.processos.remove(at: indice) //deleta o processo do array de processos
            
            do {
                try gerenciadorBanco.save() // salva a alteracao no banco
                    self.tableView.deleteRows(at: [indexPath], with: .fade) //deleta a linha da tabela
                }catch{
                    //fazer alerta de erro
                    
                
            }
            
            
        }
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

