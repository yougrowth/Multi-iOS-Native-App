//
//  CadastroController.swift
//  Multi Inteligencia Coletiva
//
//  Created by Lucas Rocha on 07/10/17.
//  Copyright © 2017 Lucas Tavares. All rights reserved.
//

import UIKit

class CadastroController: UIViewController {
    @IBOutlet weak var nomeTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var cidadeTextField: UITextField!
    @IBOutlet weak var senhaTextField: UITextField!
    @IBOutlet weak var confirmSenhaTextField: UITextField!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configDismissKeyboard()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onCadastrarClick(_ sender: Any) {
        if camposVazios() {
            present(alertGenerico(titulo: ":(", mensagem: "Por favor, preencha todos os campos"), animated: true, completion: nil)
        }
        else if senhasNaoConferem() {
            present(alertGenerico(titulo: ":(", mensagem: "As senhas digitadas não são iguais"), animated: true, completion: nil)
        }
        else {
            self.loadingIndicator.startAnimating()
            cadastrar()
        }
    }
    
    func camposVazios() -> Bool {
        return nomeTextField.text == "" ||
            emailTextField.text == ""   ||
            cidadeTextField.text == ""  ||
            senhaTextField.text == ""   ||
            confirmSenhaTextField.text == ""
    }
    
    func senhasNaoConferem() -> Bool {
        return senhaTextField.text != confirmSenhaTextField.text
    }
    
    func cadastrar() {
        var usuario = Usuario()
        
        usuario.nome = nomeTextField.text
        usuario.email = emailTextField.text
        usuario.cidade = cidadeTextField.text
        usuario.senha = senhaTextField.text
        
        UsuarioService()
            .cadastrar(usuario, depois: onServerResponse)
    }
    
    func onServerResponse(data: Data?, response: URLResponse?, error: Error?) {
        self.loadingIndicator.stopAnimating()
        
        if let res = response as? HTTPURLResponse {
            if res.statusCode == 201 {
                self.dismiss(animated: true, completion: nil)
            }
            else {
                print(res.statusCode)
                present(alertGenerico(titulo: "Erro :(", mensagem: "Não foi possível realizar seu cadastro"), animated: true, completion: nil)
            }
        }
    }
    
    func configDismissKeyboard() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(CadastroController.dismissKeyboard))
        
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
