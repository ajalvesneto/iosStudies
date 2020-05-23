//
//  ImagePicker.swift
//  Agenda
//
//  Created by Antonio Alves on 22/05/20.
//  Copyright © 2020 Alura. All rights reserved.
//

import UIKit

enum MenuOpcoes{
    case camera
    case biblioteca
}

protocol ImagePickerFotoSelecionada {
    func ImagePickerFotoSelecionada(_ foto : UIImage)
}


class ImagePicker: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    
    //MARK: Atributos
    
    var delegate : ImagePickerFotoSelecionada?
    
    //MARK: Métodos
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let foto = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        delegate?.ImagePickerFotoSelecionada(foto)
        picker.dismiss(animated: true, completion: nil)
    }
    
    func menuOpcoes(completion : @escaping (_ opcao : MenuOpcoes) -> Void) -> UIAlertController{
        let menu = UIAlertController(title: "Atenção", message: "Escolha uma opção", preferredStyle: .actionSheet)
        let camera = UIAlertAction(title: "Tirar Foto", style: .default) { (acao) in
            completion(.camera)
        }
        let biblioteca = UIAlertAction(title: "Biblioteca", style: .default) { (acao) in
            completion(.biblioteca)
        }
        
        let cancelar = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        
        menu.addAction(camera)
        menu.addAction(biblioteca)
        menu.addAction(cancelar)
        
        
        return menu
    }
}
