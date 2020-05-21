//
//  DetalhesViagemViewController.swift
//  Alura Viagens
//
//  Created by Antonio Alves on 18/05/20.
//  Copyright © 2020 Antonio Alves. All rights reserved.
//

import UIKit

class DetalhesViagemViewController: UIViewController {

    @IBOutlet weak var imagemPacoteViagem: UIImageView!
    @IBOutlet weak var labelTituloPacoteViagem: UILabel!
    @IBOutlet weak var labeldescricaoPacoteViagem: UILabel!
    @IBOutlet weak var labelDataPacoteViagem: UILabel!
    @IBOutlet weak var labelPrecoPacoteViagem: UILabel!
    
    @IBOutlet weak var scrollPrincipal: UIScrollView!
    @IBOutlet weak var textFieldDataValidade: UITextField!
    var pacoteSelecionado : PacoteViagem? = nil
    
    override func viewDidLoad() {
        NotificationCenter.default.addObserver(self, selector: #selector(aumentaScroll(notification:)) , name : UIResponder.keyboardWillShowNotification, object: nil)
        super.viewDidLoad()
        
        if let pacote = pacoteSelecionado {
            self.imagemPacoteViagem.image = UIImage(named: pacote.viagem.caminhoImagem)
            self.labelTituloPacoteViagem.text = pacote.viagem.titulo
            self.labeldescricaoPacoteViagem.text = pacote.descricao
            self.labelDataPacoteViagem.text = pacote.dataViagem
            self.labelPrecoPacoteViagem.text = pacote.viagem.valor
        }

        // Do any additional setup after loading the view.
    }
    
    @IBAction func voltar(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func aumentaScroll(notification : Notification){
        self.scrollPrincipal.contentSize = CGSize(width: self.scrollPrincipal.frame.width, height: self.scrollPrincipal.frame.height + 420)
    }
    
    @objc func exibeDataTextField(sender: UIDatePicker) {
            let formatador = DateFormatter()
            formatador.dateFormat = "dd/MM/yyyy"
            self.textFieldDataValidade.text = formatador.string(from: sender.date)
    }
    
    @IBAction func entrouTextFieldData(_ sender: UITextField) {
        let datePickerView = UIDatePicker()
        datePickerView.datePickerMode = .date
        datePickerView.datePickerStyle
        sender.inputView = datePickerView
        datePickerView.addTarget(self, action: #selector(exibeDataTextField(sender:)), for: .valueChanged)
    
    }
    

}
