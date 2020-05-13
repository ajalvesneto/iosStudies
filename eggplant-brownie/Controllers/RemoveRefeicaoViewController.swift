//
//  RemoveRefeicaoViewController.swift
//  eggplant-brownie
//
//  Created by Antonio Alves on 12/05/20.
//  Copyright © 2020 Alura. All rights reserved.
//

import UIKit

class RemoveRefeicaoViewController {
    
    let controller : UIViewController;
    
    init(_ controller : UIViewController) {
        self.controller = controller
    }
    
    func exibe(_ refeicao : Refeicao, handler : @escaping (UIAlertAction) -> Void){
        
        let alertController = UIAlertController(title: refeicao.nome, message: refeicao.toString(), preferredStyle: .alert)
        
        let botaoCancelar = UIAlertAction(title: "Fechar", style: .cancel)
        
        alertController.addAction(botaoCancelar)
        
        let botaoRemover = UIAlertAction(title: "Remover", style: .destructive, handler : handler)
        
        alertController.addAction(botaoRemover)
        controller.present(alertController, animated: true, completion: nil)
    }
}
