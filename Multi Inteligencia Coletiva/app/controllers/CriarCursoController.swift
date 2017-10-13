//
//  CriarCursoController.swift
//  Multi Inteligencia Coletiva
//
//  Created by Lucas Rocha on 09/10/17.
//  Copyright © 2017 Lucas Tavares. All rights reserved.
//

import UIKit

class CriarCursoController: UITableViewController {

    @IBOutlet weak var nomeCursoText: BorderedMainTextField!
    @IBOutlet weak var categoriaText: BorderedMainTextField!
    @IBOutlet weak var nivelText: BorderedMainTextField!
    @IBOutlet weak var privacidadeText: BorderedMainTextField!
    @IBOutlet weak var duracaoText: BorderedMainTextField!
    @IBOutlet weak var descricaoText: BorderedMainTextField!
    @IBOutlet weak var precoText: BorderedMainTextField!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configDismissKeyboard()
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
    @IBAction func onCriarClick(_ sender: Any) {
        if camposVazios() {
            present(alertGenerico(titulo: ":(", mensagem: "Por favor, preencha todos os campos"), animated: true, completion: nil)
        }
        else if !camposValidos() {
            present(alertGenerico(titulo: ":(", mensagem: "Por favor, preencha os campos corretamente"), animated: true, completion: nil)
        }
        else {
            criarCurso()
        }
        
    }
    
    func camposValidos() -> Bool {
        return Int(duracaoText.text!)! >= 4
    }
    
    func camposVazios() -> Bool {
        return nomeCursoText.text == ""
            || categoriaText.text == ""
            || nivelText.text == ""
            || privacidadeText.text == ""
            || duracaoText.text == ""
            || descricaoText.text == ""
            || precoText.text == ""
    }
    
    func criarCurso() {
        loadingIndicator.startAnimating()
        
        let curso = Curso()
        curso.nome = nomeCursoText.text
        curso.categoria = categoriaText.text
        curso.nivel = nivelText.text
        curso.privacidade = privacidadeText.text
        curso.duracao = Int(duracaoText.text!)
        curso.descricao = descricaoText.text
        curso.preco = NumberFormatter().number(from: precoText.text!)?.doubleValue
        
        CursoService().criar(curso, depois: { (data, resp, err) in
            self.loadingIndicator.stopAnimating()
            self.navigationController?.popViewController(animated: true)
        })
    }
    
    func configDismissKeyboard() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(CriarCursoController.dismissKeyboard))
        
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
