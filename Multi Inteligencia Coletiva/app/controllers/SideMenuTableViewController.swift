//
//  SideMenuTableViewController.swift
//  Multi Inteligencia Coletiva
//
//  Created by Lucas Rocha on 21/09/17.
//  Copyright © 2017 Lucas Tavares. All rights reserved.
//

import UIKit
import SideMenu

class SideMenuTableViewController: UITableViewController {
    var usuario: Usuario?
    var menuItems = ["Cursos", "Sair"]
    
    override func viewDidLoad() {
        configSideMenuManager()
        usuario = SessionManager.getLogado()
        
        if usuario == nil {
            self.listarUsuario()
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        else {
            return menuItems.count
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let header = tableView.dequeueReusableCell(withIdentifier: "MenuHeader", for: indexPath) as? MenuHeader
            
            if self.usuario != nil {
                header?.nome.text = usuario?.nome!
                header?.avatar.image = UIImage(named: (usuario?.foto!)!)
            }
            
            return header!
        }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MenuItem", for: indexPath) as? MenuItemTableViewCell
            
            cell?.itemTitleLabel.text = menuItems[indexPath.row]
            
            return cell!
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 100
        }
        else {
            return 44
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 1 {
            if indexPath.row == 0 {
                performSegue(withIdentifier: "toCursosView", sender: self)
            }
            else if indexPath.row == 1 {
                logout()
            }
        }
    }
    
    func configSideMenuManager() {
        SideMenuManager.menuAllowPushOfSameClassTwice = false
    }
    
    func logout() {
        SessionManager.closeSession()
        self.dismiss(animated: true)
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "logout"), object: nil)
    }
    
    func listarUsuario() {
        UsuarioService()
            .getUsuarioLogado(depois: self.exibirUsuario)
    }
    
    
    func exibirUsuario(data: Data?, response: URLResponse?, err: Error?) -> Void {
        do {
            let logado = try JSONSerialization.jsonObject(with: data!, options: []) as! [String: AnyObject]
            
            self.usuario = Usuario()
            self.usuario?.nome = logado["nome"] as? String
            self.usuario?.foto = logado["foto"] as? String
            self.usuario?.email = logado["email"] as? String
            self.usuario?.cidade = logado["cidade"] as? String
            
            SessionManager.setLogado(self.usuario)
            
            self.tableView.reloadData()
        }
        catch let e as NSError {
            print(e.localizedDescription)
        }
    }
}
