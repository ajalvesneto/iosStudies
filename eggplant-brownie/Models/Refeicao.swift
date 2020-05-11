//
//  Refeicao.swift
//  eggplant-brownie
//
//  Created by Andriu Felipe Coelho on 16/03/19.
//  Copyright © 2019 Alura. All rights reserved.
//

import UIKit

class Refeicao: NSObject {
    
    // MARK: - Atributos
    
    let nome: String
    let felicidade: Int
    var itens: Array<Item> = []
    
    // MARK: - Init
    
    init(nome: String, felicidade: Int, itens : [Item] = []) {
        self.nome = nome
        self.felicidade = felicidade
    }
    
    // MARK: - Metodos
    
    func totalDeCalorias() -> Double {
        var total = 0.0
        
        for item in itens {
            total += item.calorias
        }
        
        return total
    }
    
    func toString() -> String {
        var mensagem = "Felicidade: \(felicidade) "
        
        for item in itens {
            mensagem += "\n \(item.nome) - \(item.calorias) Calorias"
        }
        
        
        return mensagem
    }
}
