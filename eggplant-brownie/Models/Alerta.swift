//
//  Alerta.swift
//  eggplant-brownie
//
//  Created by Antonio Alves on 11/05/20.
//  Copyright © 2020 Alura. All rights reserved.
//

import UIKit

class Alerta {
    
    let controller : UIViewController
    
    init(controller : UIViewController){
        self.controller = controller
    }
    
    func exibe(titulo : String = "Sorry", mensagem : String = "Desculpe, erro inesperado"){
        let alertController = UIAlertController(title: titulo, message: mensagem, preferredStyle: .alert)
        let botaoCancelar = UIAlertAction(title: "Fechar", style: .cancel, handler: nil)
        alertController.addAction(botaoCancelar)
        controller.present(alertController, animated: true, completion: nil)
        
    }
}
