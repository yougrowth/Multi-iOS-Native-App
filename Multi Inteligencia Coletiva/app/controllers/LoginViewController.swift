//
//  LoginViewController.swift
//  Multi Inteligencia Coletiva
//
//  Created by Lucas Rocha on 05/10/17.
//  Copyright © 2017 Lucas Tavares. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var senhaTextField: UITextField!
    @IBOutlet weak var esqueceuSenhaButton: UIButton!
    @IBOutlet weak var entrarButton: UIButton!
    @IBOutlet weak var cadastroButton: UIButton!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    
    @IBAction func onEntrarClick(_ sender: Any) {
        self.loadingIndicator.startAnimating()
        
        if !(emailTextField.text! == "" && senhaTextField.text! == "") {
            self.logar()
        }
        else {
            self.loadingIndicator.stopAnimating()
        }
    }
    
    func logar() {
        var usuario = Usuario()
        
        usuario.email = emailTextField.text
        usuario.senha = senhaTextField.text
        
        UsuarioService()
            .logar(usuario.description, depois: salvarToken)
    }
    
    func salvarToken(data: Data?, response: URLResponse?, error: Error?) {
        do {
            let json = try JSONSerialization.jsonObject(with: data!, options: []) as! [String: String]
            let defaults = UserDefaults.standard
            
            defaults.set(json["token"]!, forKey: "session")
            self.loadingIndicator.stopAnimating()
            self.dismiss(animated: true, completion: nil)
        }
        catch let error as NSError {
            self.loadingIndicator.stopAnimating()
            print("Erro: \(error.localizedDescription)")
        }
    }
}
