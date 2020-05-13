//
//  ViagemDAO.swift
//  Alura Viagens
//
//  Created by Ândriu Coelho on 04/08/17.
//  Copyright © 2017 Alura. All rights reserved.
//

import UIKit

class ViagemDAO: NSObject {
    
    func retornaTodasAsViagens() -> Array<Viagem> {
        let ceara = Viagem(titulo: "Ceará", quantidadeDias: 3, valor: "1.800,59", caminhoImagem: "img1.png")
        let rioDeJaneiro = Viagem(titulo: "Rio de Janeiro", quantidadeDias: 6, valor: "1.200,00", caminhoImagem: "img2.jpg")
        let interiorSaoPaulo = Viagem(titulo: "Atibaia - Sao Paulo", quantidadeDias: 1, valor: "890,00", caminhoImagem: "img3.jpg")
        let paraiba = Viagem(titulo: "Paraíba", quantidadeDias: 3, valor: "1.385,00", caminhoImagem: "img4.jpg")
        let fortaleza = Viagem(titulo: "Fortaleza", quantidadeDias: 4, valor: "3.120,00", caminhoImagem: "img5.jpg")
        let listaViagem:Array<Viagem> = [rioDeJaneiro, ceara, interiorSaoPaulo, paraiba, fortaleza]
        
        return listaViagem
    }
}
