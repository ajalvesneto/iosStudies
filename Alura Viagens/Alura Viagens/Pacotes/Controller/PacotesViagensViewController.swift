//
//  PacotesViagensViewController.swift
//  Alura Viagens
//
//  Created by Antonio Alves on 15/05/20.
//  Copyright © 2020 Antonio Alves. All rights reserved.
//

import UIKit

class PacotesViagensViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UISearchBarDelegate {
    
    
    
    let listaTodasViagens : Array<Viagem> = ViagemDAO().retornaTodasAsViagens()
    var listaViagens : Array<Viagem> = []
    @IBOutlet weak var colecaoPacoteViagens: UICollectionView!
    @IBOutlet weak var pesquisarViagens: UISearchBar!
    
    @IBOutlet weak var contadorPacotes: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colecaoPacoteViagens.dataSource = self
        colecaoPacoteViagens.delegate = self
        pesquisarViagens.delegate = self
        listaViagens = listaTodasViagens
        self.contadorPacotes.text = self.contaPacotes()

        // Do any additional setup after loading the view.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.listaViagens.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let celulaPacote = collectionView.dequeueReusableCell(withReuseIdentifier: "celulaPacote", for: indexPath) as! PacoteViagemCollectionViewCell
        
        let viagemAtual = listaViagens[indexPath.item]
        
        celulaPacote.labeltitulo.text = viagemAtual.titulo
        celulaPacote.labelQuantidadeDias.text = "\(viagemAtual.quantidadeDias) Dias"
        celulaPacote.labelValor.text = "R$: \(viagemAtual.valor) "
        celulaPacote.imagemPacote.image = UIImage(named: viagemAtual.caminhoImagem)
        celulaPacote.imagemPacote.layer.cornerRadius = 10
        celulaPacote.imagemPacote.layer.masksToBounds = true
        celulaPacote.layer.borderWidth = 0.5
        celulaPacote.layer.borderColor = UIColor(red: 85.0/255.0, green: 85.0/255.0, blue: 85.0/255.0, alpha: 1).cgColor
        celulaPacote.layer.cornerRadius = 8

        
        return celulaPacote
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: (collectionView.bounds.width / 2) - 10, height: 160)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText != ""{
        let filtroViagem = NSPredicate(format:"titulo contains %@", searchText)
        let listaViagensFiltradas : Array<Viagem> = (listaViagens as NSArray).filtered(using: filtroViagem) as! Array
            listaViagens = listaViagensFiltradas
        }else{
            listaViagens = listaTodasViagens
        }
        self.contadorPacotes.text = self.contaPacotes()
        colecaoPacoteViagens.reloadData()
    }
    
    func contaPacotes() -> String
    {
       
        if listaViagens.count == 1 { return "1 Pacote Encontrado" }else{ return "\(listaViagens.count) Pacotes Encontrados"}
    }
    
     
    

}
