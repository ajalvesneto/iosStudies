    //
    //  ViewController.swift
    //  eggplant-brownie
    //
    //  Created by Andriu Felipe Coelho on 23/02/19.
    //  Copyright © 2019 Alura. All rights reserved.
    //

    import UIKit

    protocol AdicionaRefeicaoDelegate {
        func addRefeicao(_ refeicao: Refeicao)
    }

    class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate,  adicionarItensDelegate {
        
        
        
       
        
       
        
        
        //MARK: - Atributos
        
        var delegate : RefeicoesTableViewController?
        
        var itens : [Item] = [Item(nome: "Molho Shoyo", calorias: 40),
                              Item(nome: "Molho Barbecue", calorias: 20),
                              Item(nome: "Molho Acebolado", calorias: 10),
                              Item(nome: "Molho Ingles", calorias: 100)]
        
        
        var itensSelecionados : [Item] = []
        
        //var itens : [String] = ["Molho Shoyo", "", "Molho Acebolado", "Molho Ingles"]
        
        
        //MARK: - IBOutlet
        @IBOutlet var nomeTextField: UITextField?
        @IBOutlet weak var felicidadeTextField: UITextField?
        @IBOutlet weak var itensTableView: UITableView!
        
        
        //MARK: - Life View Cicle
        
        override func viewDidLoad() {
            let botaoAdicionarItens = UIBarButtonItem(title: "adicionaritens", style: .plain, target: self, action : #selector(AdicionarItens))
            navigationItem.rightBarButtonItem = botaoAdicionarItens
        }
        
        @objc func AdicionarItens(){
            let adicionarViewsControlle = AdicionarItensViewController(delegate : self);
            navigationController?.pushViewController(adicionarViewsControlle, animated: true)
        }

        
        //MARK: - UITableViewController
        
            func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return itens.count
           }
           
           func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            let celula = UITableViewCell(style: .default, reuseIdentifier: nil)
            
            celula.textLabel?.text = itens[indexPath.row].nome;
            return celula
           }
        

        
        // MARK: - UITableViewDelegate
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            guard let celula = tableView.cellForRow(at: indexPath) else {return }
            
            let linhaTabela = itens[indexPath.row];
            if celula.accessoryType == .none {
                celula.accessoryType = .checkmark
                itensSelecionados.append(linhaTabela)
            }else{
                celula.accessoryType = .none
                if let position = itensSelecionados.index(of: linhaTabela){
                    itensSelecionados.remove(at: position)
                    
                    for itemSelecionado in itensSelecionados{
                        print(itemSelecionado.nome)
                    }
                }
            }
            
            
        }
        
        //MARK: - IBAction
        @IBAction func adicionar(_ sender: Any) {
            
            if  let refeicao = recuperaFormRefeicao() {
                delegate?.addRefeicao(refeicao)
                navigationController?.popViewController(animated: true)
            } else {Alerta(controller: self).exibe(titulo: "Problemas com o Formulário", mensagem: "Tivemos um problema em pegar os dados do formulário")}
            
            
        }
        
        func recuperaFormRefeicao() -> Refeicao?{
            guard let nomeDaRefeicao = nomeTextField?.text else {
                Alerta(controller: self).exibe(titulo: "Nome da Refeição", mensagem: "Tivemos um problema em pegar o nome da refeição")
                return nil
            }
            
            guard let felicidadeDaRefeicao = felicidadeTextField?.text, let felicidade = Int(felicidadeDaRefeicao) else {
                Alerta(controller: self).exibe(titulo: "Felicidade da Refeição", mensagem: "Tivemos um problema em pegar a felicidade da refeição")
                return nil
            }
            
            let refeicao = Refeicao(nome: nomeDaRefeicao, felicidade: felicidade)
            refeicao.itens = itensSelecionados;
            
            return refeicao
        
        }
        
        
           func add(_ item: Item) {
            itens.append(item)
            if let itensTableView = itensTableView{
                itensTableView.reloadData()
            }else{
                Alerta(controller: self).exibe()
            }
        }
        
    }

