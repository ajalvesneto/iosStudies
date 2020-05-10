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

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
   
    
    
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
    
    
    //MARK: - Life View Cicle
    
    

    
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
        
        guard let nomeDaRefeicao = nomeTextField?.text else {
            return
        }
        
        guard let felicidadeDaRefeicao = felicidadeTextField?.text, let felicidade = Int(felicidadeDaRefeicao) else {
            return
        }
        
        let refeicao = Refeicao(nome: nomeDaRefeicao, felicidade: felicidade)
        refeicao.itens = itensSelecionados;
        
        delegate?.addRefeicao(refeicao)
        navigationController?.popViewController(animated: true)
    }
}

