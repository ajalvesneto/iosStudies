//
//  RefeicaoDAO.swift
//  eggplant-brownie
//
//  Created by Antonio Alves on 13/05/20.
//  Copyright © 2020 Alura. All rights reserved.
//

import Foundation

class RefeicaoDAO {
    
    func save(_ refeicoes : [Refeicao]) {
        do{
            let dados = try NSKeyedArchiver.archivedData(withRootObject: refeicoes, requiringSecureCoding: false)
            guard let caminho = recuperaCaminho() else {return }
            try dados.write(to: caminho)
        }catch {
            print(error.localizedDescription)
        }
    }
    
    
    func recuperaCaminho() -> URL? {
        guard let diretorio = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil}
        let caminho = diretorio.appendingPathComponent("refeicoes")
        return caminho
    }
    
    func recuperaRefeicoes() -> [Refeicao]{
        guard let caminho = recuperaCaminho() else {return []}
        
        do {
            let dados = try Data(contentsOf: caminho)
            guard let refeicoesSalvas = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(dados) as? Array<Refeicao> else {return []}
            return refeicoesSalvas
        } catch {
            print(error.localizedDescription)
            return []
        }
    }

}
