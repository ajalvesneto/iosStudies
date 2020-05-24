//
//  MapaViewController.swift
//  Agenda
//
//  Created by Antonio Alves on 24/05/20.
//  Copyright © 2020 Alura. All rights reserved.
//

import UIKit
import MapKit
class MapaViewController: UIViewController {

    //MARk: Variaveis
    
    var aluno : Aluno?
    
    @IBOutlet weak var mapa: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = getTitulo()
        self.localizacaoInicial()
        self.localizarAluno()

        // Do any additional setup after loading the view.
    }
    
    //MARk: Metodos

    func configuraPino(titulo : String, localizacao : CLPlacemark) -> MKPointAnnotation{
        let pino = MKPointAnnotation()
        pino.title = titulo
        pino.coordinate = localizacao.location?.coordinate as! CLLocationCoordinate2D
        return pino
    }
    
    func localizarAluno(){
        guard let nomeAluno = self.aluno?.nome else {return }
        guard let localizacao = self.aluno?.endereco else {return }
        Localizacao().converteEnderecoEmCoordenadas(endereco: localizacao, local:{ (localizacaoEncontrada) in
                 let pinoAluno = self.configuraPino(titulo: nomeAluno, localizacao: localizacaoEncontrada)
                self.mapa.addAnnotation(pinoAluno)
            }
        )
       
        
    }
    
    func localizacaoInicial(){
        Localizacao().converteEnderecoEmCoordenadas(endereco: "Pedrinhas Sergipe") { (localizacaoEncontrada) in
            let pino = self.configuraPino(titulo: "Minha Casa", localizacao: localizacaoEncontrada)
            let regiao = MKCoordinateRegion(center: pino.coordinate, latitudinalMeters: 5000, longitudinalMeters: 5000)
           
            
            self.mapa.setRegion(regiao, animated: true)
            self.mapa.addAnnotation(pino)
            
            
        }
    }
    
    func getTitulo() -> String{
        return "Localizar Alunos"

    }
}
