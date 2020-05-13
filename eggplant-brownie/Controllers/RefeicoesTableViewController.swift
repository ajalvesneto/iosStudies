//
//  RefeicoesTableViewController.swift
//  eggplant-brownie
//
//  Created by Antonio Alves on 19/04/20.
//  Copyright © 2020 Alura. All rights reserved.
//

import UIKit

class RefeicoesTableViewController: UITableViewController, AdicionaRefeicaoDelegate{
    
    var refeicoes : [Refeicao] = []
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return refeicoes.count;
    }
    
    override func viewDidLoad() {
        refeicoes = RefeicaoDAO().recuperaRefeicoes()
    }
    

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let celula = UITableViewCell(style: .default, reuseIdentifier: nil)
        let refeicao = refeicoes[indexPath.row];
    
        celula.textLabel?.text = refeicao.nome;
        
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(mostrarDetalhe(_:)))
        celula.addGestureRecognizer(longPress)
        
        return celula;
    }
    
    @objc func mostrarDetalhe(_ gesture : UILongPressGestureRecognizer){
        if gesture.state == .began{
            let celula = gesture.view as! UITableViewCell
            
            guard let indexPath = tableView.indexPath(for: celula)
            else {
                return
            }
            let refeicao = refeicoes[indexPath.row]
            
            
            RemoveRefeicaoViewController.init(self).exibe(refeicao, handler: { alert  in
                self.refeicoes.remove(at: indexPath.row)
                self.tableView.reloadData()
            })
            
        }
        
    }
    
    func removeRefeicao(alerta : UIAlertAction){
        print("entrou")
    }
    
    func addRefeicao(_ refeicao: Refeicao){
        refeicoes.append(refeicao);
        tableView.reloadData();
        RefeicaoDAO().save(refeicoes)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewController =  segue.destination as? ViewController{
            viewController.delegate = self
        }
        
    }
    
    
    
}
