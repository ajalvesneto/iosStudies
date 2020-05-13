//
//  ItemDAO.swift
//  eggplant-brownie
//
//  Created by Antonio Alves on 13/05/20.
//  Copyright © 2020 Alura. All rights reserved.
//

import Foundation

class ItemDAO {
    
    func save(_ item : [Item]) {
        do{
            let dados = try NSKeyedArchiver.archivedData(withRootObject: item, requiringSecureCoding: false)
            guard let caminho = recuperaCaminho() else {return }
            try dados.write(to: caminho)
        }catch {
            print(error.localizedDescription)
        }
    }
    
    
    func recuperaCaminho() -> URL? {
        guard let diretorio = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil}
        let caminho = diretorio.appendingPathComponent("itens")
        return caminho
    }
    
    func recuperaItens() -> [Item]{
        guard let caminho = recuperaCaminho() else {return []}
        
        do {
            let dados = try Data(contentsOf: caminho)
            guard let itensSalvos = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(dados) as? Array<Item> else {return []}
            return itensSalvos
        } catch {
            print(error.localizedDescription)
            return []
        }
    }

}
