//
//  RefeicoesTableViewController.swift
//  eggplant-brownie
//
//  Created by Antonio Alves on 19/04/20.
//  Copyright © 2020 Alura. All rights reserved.
//

import UIKit

class RefeicoesTableViewController: UITableViewController{
    
     var refeicoes = [Refeicao(nome: "Lasanha", felicidade: 4),
                    Refeicao(nome: "Pizza", felicidade: 5),
                    Refeicao(nome: "Japones", felicidade: 5),
                    Refeicao(nome: "Feijoada", felicidade: 3)];
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return refeicoes.count;
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let celula = UITableViewCell(style: .default, reuseIdentifier: nil)
        let refeicao = refeicoes[indexPath.row];
    
        celula.textLabel?.text = refeicao.nome;
        
        return celula;
    }
    
    func addRefeicao(_ refeicao: Refeicao){
        refeicoes.append(refeicao);
        tableView.reloadData();
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewController =  segue.destination as? ViewController{
            viewController.tableViewController = self
        }
        
    }
    
    
    
}
