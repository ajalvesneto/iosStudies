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

class ViewController: UIViewController, UITableViewDataSource {
   
    
    
    //MARK: - Atributos
    
    var delegate : RefeicoesTableViewController?
    var itens : [String] = ["Molho Shoyo", "Molho Barbecue", "Molho Acebolado", "Molho Ingles"]
    
    
    //MARK: - IBOutlet
    @IBOutlet var nomeTextField: UITextField?
    @IBOutlet weak var felicidadeTextField: UITextField?
    
    //MARK: - UITableViewController
    
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itens.count
       }
       
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let celula = UITableViewCell(style: .default, reuseIdentifier: nil)
        
        celula.textLabel?.text = itens[indexPath.row];
        return celula
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
        
        delegate?.addRefeicao(refeicao)
        navigationController?.popViewController(animated: true)
    }
}

