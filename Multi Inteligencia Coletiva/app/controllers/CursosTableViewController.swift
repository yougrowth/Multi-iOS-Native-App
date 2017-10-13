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
    var filterField: BorderedMainTextField?
    var cursos:[Curso] = []
    var filtrados:[Curso] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Cursos"
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(CursosTableViewController.dismissKeyboard)))
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if SessionManager.getToken() == nil {
            navigationController?.popToRootViewController(animated: false)
        }
        else if cursos.count == 0 {
            listarCursos()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(self.onLogout), name: NSNotification.Name(rawValue: "logout"), object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self)
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
            return self.filtrados.count
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let header = tableView.dequeueReusableCell(withIdentifier: "HeaderCell", for: indexPath) as? HeaderTableViewCell
            
            filterField = header?.filtroField
            
            return header!
        }
        else {
            let card = tableView.dequeueReusableCell(withIdentifier: "ResultCell", for: indexPath) as? CardTableViewCell
            let avatar = self.filtrados[indexPath.row].autor?.foto
            
            card?.cursoImage.image = UIImage(named: "baymax.jpg")
            card?.cursoTituloLabel.text = self.filtrados[indexPath.row].nome
            card?.cursoDescLabel.text = self.filtrados[indexPath.row].descricao
            card?.autorImage.image = UIImage(named: avatar!)
            card?.autorNome.text = self.filtrados[indexPath.row].autor?.nome
            
            return card!
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 135.0
        }
        else {
            return 410.0
        }
    }
    
    @IBAction func filtrarResultados(_ sender: Any) {
        if filterField?.text != "" {
            self.filtrados = self.cursos.filter({ (curso) -> Bool in
                return curso.nome?.range(of: (self.filterField?.text)!) != nil
            })
        }
        else {
            self.filtrados = [Curso](self.cursos)
        }
        
        self.tableView.reloadData()
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
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
                let curso = Curso()
                curso.id = jsonCurso["id"] as? Int
                curso.nome = jsonCurso["nome"] as? String
                curso.descricao = jsonCurso["descricao"] as? String
                curso.autor = Usuario()
                curso.autor?.id = jsonCurso["autor"]!["id"] as? Int
                curso.autor?.nome = jsonCurso["autor"]!["nome"] as? String
                curso.autor?.foto = jsonCurso["autor"]!["foto"] as? String
                cursoLista.append(curso)
            }
            
            self.cursos = cursoLista
            self.filtrados = [Curso](self.cursos)
            self.tableView.reloadData()
        }
        catch let err as NSError {
            print("\(err.localizedDescription)")
            present(alertGenerico(titulo: ":(", mensagem: "Não foi possível carregar os cursos"), animated: true, completion: nil)
        }
    }
    
    func onLogout() -> Void {
        self.navigationController?.popToRootViewController(animated: true)
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
