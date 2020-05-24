//
//  Mensagem.swift
//  Agenda
//
//  Created by Antonio Alves on 23/05/20.
//  Copyright © 2020 Alura. All rights reserved.
//

import UIKit
import MessageUI

class Mensagem: NSObject, MFMessageComposeViewControllerDelegate {
    
    //MARK: Métodos
    
    func configuraSms(_ aluno : Aluno) -> MFMessageComposeViewController? {
        if MFMessageComposeViewController.canSendText() {
            let componenteSMS = MFMessageComposeViewController()
            guard let numeroTelefone = aluno.telefone else {return componenteSMS}
            componenteSMS.recipients = [numeroTelefone]
            componenteSMS.messageComposeDelegate = self
            return componenteSMS
        }else{
            return nil
        }
       
    }
    
    //MARK: messageComposeViewController
    
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        controller.dismiss(animated: true, completion: nil)
    }
    

}
