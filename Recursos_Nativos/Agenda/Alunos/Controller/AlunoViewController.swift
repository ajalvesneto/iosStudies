//
//  AlunoViewController.swift
//  Agenda
//
//  Created by Ândriu Coelho on 24/11/17.
//  Copyright © 2017 Alura. All rights reserved.
//

import UIKit

class AlunoViewController: UIViewController, ImagePickerFotoSelecionada {
  
    
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var viewImagemAluno: UIView!
    @IBOutlet weak var imageAluno: UIImageView!
    @IBOutlet weak var buttonFoto: UIButton!
    @IBOutlet weak var scrollViewPrincipal: UIScrollView!
    
    @IBOutlet weak var textFieldNome: UITextField!
    @IBOutlet weak var textFieldEndereco: UITextField!
    @IBOutlet weak var textFieldTelefone: UITextField!
    @IBOutlet weak var textFieldSite: UITextField!
    @IBOutlet weak var textFieldNota: UITextField!
    
    //MARK: - Atributos
       
       let imagePicker = ImagePicker()
    
    // MARK: - View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
        self.arredondaView()
        
        NotificationCenter.default.addObserver(self, selector: #selector(aumentarScrollView(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func ImagePickerFotoSelecionada(_ foto: UIImage) {
        imageAluno.image = foto
      }
    
    func setup(){
        imagePicker.delegate = self
    }
    
   
    
    // MARK: - Métodos
    
    func arredondaView() {
        self.viewImagemAluno.layer.cornerRadius = self.viewImagemAluno.frame.width / 2
        self.viewImagemAluno.layer.borderWidth = 1
        self.viewImagemAluno.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    @objc func aumentarScrollView(_ notification:Notification) {
        self.scrollViewPrincipal.contentSize = CGSize(width: self.scrollViewPrincipal.frame.width, height: self.scrollViewPrincipal.frame.height + self.scrollViewPrincipal.frame.height/2)
    }
    
    func mostrarMultimidia(_ opcao : MenuOpcoes){
         let multimidia = UIImagePickerController();
         multimidia.delegate = imagePicker
        if multimidia.sourceType == .camera && UIImagePickerController.isSourceTypeAvailable(.camera){
            multimidia.sourceType = .camera
        }else{
            multimidia.sourceType = .photoLibrary
        }
        self.present(multimidia, animated: true, completion: nil)
    }
    
    // MARK: - IBActions
    
    @IBAction func buttonFoto(_ sender: UIButton) {
        let menu = ImagePicker().menuOpcoes { (opcao) in
            self.mostrarMultimidia(opcao)
        }
        
        present(menu, animated: true, completion: nil)
        
        
    }
    
    @IBAction func stepperNota(_ sender: UIStepper) {
        self.textFieldNota.text = "\(sender.value)"
    }
    
    
}