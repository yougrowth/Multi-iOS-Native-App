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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configDismissKeyboard()
        
        if SessionManager.getToken() != nil {
            performSegue(withIdentifier: "login", sender: self)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.isNavigationBarHidden = false
    }
    
    @IBAction func onEntrarClick(_ sender: Any) {
        self.loadingIndicator.startAnimating()
        
        if !(emailTextField.text! == "" && senhaTextField.text! == "") {
            self.logar()
        }
        else {
            self.loadingIndicator.stopAnimating()
            present(alertGenerico(titulo: "D:", mensagem: "Não esqueça de preencher o e-mail e a senha"), animated: true, completion: nil)
        }
    }
    
    func logar() {
        let usuario = Usuario()
        
        usuario.email = emailTextField.text
        usuario.senha = senhaTextField.text
        
        UsuarioService()
            .logar(usuario, depois: salvarToken)
    }
    
    func salvarToken(data: Data?, response: URLResponse?, error: Error?) {
        do {
            let auth = try JSONSerialization.jsonObject(with: data!, options: []) as! [String: String]
            
            if let token = auth["token"] {
                SessionManager.initSession(for: token)
                performSegue(withIdentifier: "login", sender: self)
            }
            else {
                present(alertGenerico(titulo: ":(", mensagem: "E-mail ou senha inválidos"), animated: true, completion: nil)
            }
            
            self.loadingIndicator.stopAnimating()
        }
        catch let error as NSError {
            print("Erro: \(error.localizedDescription)")
            self.loadingIndicator.stopAnimating()
        }
    }
    
    func configDismissKeyboard() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(CadastroController.dismissKeyboard))
        
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
}
