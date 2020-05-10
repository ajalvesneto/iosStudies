//
//  AdicionarItensViewController.swift
//  eggplant-brownie
//
//  Created by Antonio Alves on 10/05/20.
//  Copyright © 2020 Alura. All rights reserved.
//

import UIKit

protocol adicionarItensDelegate{
    func add (_ item : Item)
}

class AdicionarItensViewController: UIViewController {

     //MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
   
     //MARK: - IBOutlets
    @IBOutlet weak var nomeTextField: UITextField!
    
    @IBOutlet weak var caloriasTextField: UITextField!
    
    //MARK: - Atributos
    
    var delegate : adicionarItensDelegate?
    
    init(delegate : adicionarItensDelegate) {
        super.init(nibName: "AdicionarItensViewController", bundle: nil)
        self.delegate = delegate;
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
   
    
    
    
    //MARK:: - IBActions
    
    @IBAction func adicionarItem(_ sender: Any) {
        
        guard let nome = nomeTextField.text, let calorias = caloriasTextField.text
            else {
                return
                
        }
        
        if let numeroCalorias = Double(calorias) {
            let item = Item(nome: nome, calorias: numeroCalorias)
            delegate?.add(item)
            navigationController?.popViewController(animated: true)
                
        }
        
        
        
    }
    

}
