//
//  Viagem.swift
//  Alura Viagens
//
//  Created by Antonio Alves on 13/05/20.
//  Copyright © 2020 Antonio Alves. All rights reserved.
//

import UIKit

class Viagem: NSObject {
    
    @objc let titulo : String;
    let quantidadeDias : Int;
    let valor : String;
    let caminhoImagem : String;
    
    
    init(titulo : String, quantidadeDias : Int, valor : String, caminhoImagem : String) {
        self.titulo = titulo
        self.quantidadeDias = quantidadeDias
        self.valor = valor
        self.caminhoImagem = caminhoImagem
    }
}
