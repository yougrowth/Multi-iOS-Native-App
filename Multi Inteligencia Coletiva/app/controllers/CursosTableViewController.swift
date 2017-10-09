//
//  CursosTableViewController.swift
//  Multi Inteligencia Coletiva
//
//  Created by Lucas Rocha on 19/09/17.
//  Copyright © 2017 Lucas Tavares. All rights reserved.
//

import UIKit
import Foundation

class CursosTableViewController: UITableViewController {
    var cursos:[Curso] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Cursos"
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(CursosTableViewController.dismissKeyboard)))
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let defaults = UserDefaults.standard
        
        if defaults.string(forKey: "session") == nil {
            performSegue(withIdentifier: "toLoginView", sender: self)
        }
        else {
            listarCursos()
        }
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        else {
            return self.cursos.count
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let header = tableView.dequeueReusableCell(withIdentifier: "HeaderCell", for: indexPath) as? HeaderTableViewCell
            
            return header!
        }
        else {
            let card = tableView.dequeueReusableCell(withIdentifier: "ResultCell", for: indexPath) as? CardTableViewCell
            
            card?.cursoImage.image = UIImage(named: "baymax.jpg")
            card?.cursoTituloLabel.text = self.cursos[indexPath.row].nome
            card?.cursoDescLabel.text = self.cursos[indexPath.row].descricao
            card?.autorImage.image = UIImage(named: "thayla.jpg")
            card?.autorNome.text = self.cursos[indexPath.row].autor?.nome
            
            return card!
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 100.0
        }
        else {
            return 410.0
        }
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @IBAction func deslogar(_ sender: Any) {
        let defaults = UserDefaults.standard
        
        defaults.removeObject(forKey: "session")
        performSegue(withIdentifier: "toLoginView", sender: self)
    }
    
    func listarCursos() {
        CursoService()
            .listarTodos(depois: self.importarCursos)
    }
    
    func importarCursos(data: Data?, res: URLResponse?, err: Error?) {
        do {
            let jsonLista = try JSONSerialization.jsonObject(with: data!, options: []) as! [[String:AnyObject]]
            
            var cursoLista: [Curso] = []
            
            for jsonCurso in jsonLista {
                var curso = Curso()
                curso.id = jsonCurso["id"] as? Int
                curso.nome = jsonCurso["nome"] as? String
                curso.descricao = jsonCurso["descricao"] as? String
                curso.autor = Usuario()
                curso.autor?.id = jsonCurso["autor"]!["id"] as? Int
                curso.autor?.nome = jsonCurso["autor"]!["nome"] as? String
                cursoLista.append(curso)
            }
            
            print(cursoLista)
            
            self.cursos = cursoLista
            self.tableView.reloadData()
        }
        catch let err as NSError {
            print("\(err.localizedDescription)")
            present(alertGenerico(titulo: ":(", mensagem: "Não foi possível carregar os cursos"), animated: true, completion: nil)
        }
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
