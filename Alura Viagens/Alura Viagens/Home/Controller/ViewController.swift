//
//  ViewController.swift
//  Alura Viagens
//
//  Created by Antonio Alves on 13/05/20.
//  Copyright © 2020 Antonio Alves. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    let listaViagens : Array<Viagem> = ViagemDAO().retornaTodasAsViagens()
    
    
    @IBOutlet weak var tabelaViagens: UITableView!
    
    @IBOutlet weak var viewHoteis: UIView!
    @IBOutlet weak var viewPacotes: UIView!
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listaViagens.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = tableView.dequeueReusableCell(withIdentifier: "celula", for: indexPath) as! TableViewCell
        let viagemAtual = listaViagens[indexPath.row]
        
        celula.labelTitulo.text = viagemAtual.titulo
        celula.labelDias.text = "\(viagemAtual.quantidadeDias) Dias"
        celula.labelValor.text = "R$: \(viagemAtual.valor) "
        celula.imagemViagem.image = UIImage(named: viagemAtual.caminhoImagem)
        celula.imagemViagem.layer.cornerRadius = 10
        celula.imagemViagem.layer.masksToBounds = true

        
        return celula
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabelaViagens.dataSource = self
        self.tabelaViagens.delegate = self
        self.viewHoteis.layer.cornerRadius = 10
        self.viewPacotes.layer.cornerRadius = 10
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 175; 
    }


}

