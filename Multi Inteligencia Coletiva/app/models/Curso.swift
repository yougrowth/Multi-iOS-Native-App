//
//  Curso.swift
//  Multi Inteligencia Coletiva
//
//  Created by Lucas Rocha on 20/09/17.
//  Copyright © 2017 Lucas Tavares. All rights reserved.
//

import Foundation

class Curso: NSObject {
    var imagem: String?
    var titulo: String?
    var descricao: String?
    var autor: Usuario?
    
    init(imagem: String, titulo: String, descricao: String, autor: Usuario) {
        self.imagem = imagem
        self.titulo = titulo
        self.descricao = descricao
        self.autor = autor
    }
}
