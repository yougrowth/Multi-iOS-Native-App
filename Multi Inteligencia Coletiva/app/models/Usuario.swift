//
//  Usuario.swift
//  Multi Inteligencia Coletiva
//
//  Created by Lucas Rocha on 20/09/17.
//  Copyright © 2017 Lucas Tavares. All rights reserved.
//

import UIKit

class Usuario: NSObject {
    var nome: String?
    var avatar: String?
    
    init(nome: String, avatar: String) {
        self.nome = nome
        self.avatar = avatar
    }
}
