//
//  CursosTableViewController.swift
//  Multi Inteligencia Coletiva
//
//  Created by Lucas Rocha on 19/09/17.
//  Copyright © 2017 Lucas Tavares. All rights reserved.
//

import UIKit

class CursosTableViewController: UITableViewController {
    let cursos = [
        Curso(
            imagem: "",
            titulo: "IOT no Atletismo",
            descricao: "A tecnologia está mudando o mundo, e o esporte precisa acompanhar essa evolução. Nesse curso, aprenderemos como a tecnologia pode auxiliar na prática do atletismo.",
            autor: Usuario(
                nome: "Jessé Farias",
                avatar: "jesse.jpg"
            )
        ),
        Curso(
            imagem: "",
            titulo: "Comunidade de Inovação na Educação",
            descricao: "As novas tecnologias nos trouxeram novas formas de interagir, e um inevitável processo de mudança...",
            autor: Usuario(
                nome: "Lucas Henrique",
                avatar: "lucas.jpg"
            )
        ),
        Curso(
            imagem: "",
            titulo: "Marketing com Enfoque em Mídias Sociais",
            descricao: "As mídias sociais já fazem parte do cotidiano das pessoas, e saber se comunicar com elas a partir das redes há muito já deixou de ser um diferencial e se tornou obrigação.",
            autor: Usuario(
                nome: "Thayla Ferreira",
                avatar: "thayla.jpg"
            )
        )
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Cursos"
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
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
            card?.cursoTituloLabel.text = self.cursos[indexPath.row].titulo
            card?.cursoDescLabel.text = self.cursos[indexPath.row].descricao
            card?.autorImage.image = UIImage(named: (self.cursos[indexPath.row].autor?.avatar)!)
            card?.autorNome.text = self.cursos[indexPath.row].autor?.nome
            
            return card!
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 100.0
        }
        else {
            return 400.0
        }
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
