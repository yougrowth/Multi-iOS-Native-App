//
//  UsuarioService.swift
//  Multi Inteligencia Coletiva
//
//  Created by Lucas Rocha on 08/10/17.
//  Copyright © 2017 Lucas Tavares. All rights reserved.
//

import UIKit

typealias HttpRequestCallback = ((Data?, URLResponse?, Error?) -> Void)!

class UsuarioService: NSObject {
    var serviceUrl = URL(string: "https://yg-api-multi-temp.herokuapp.com/usuario")!
    
    func cadastrar(_ usuario: Usuario, depois callback: HttpRequestCallback) {
        HttpService
            .post(usuario.description, to: serviceUrl, then: callback)
    }
    
    func logar(_ usuario: Usuario, depois callback: HttpRequestCallback) {
        
    }
}
