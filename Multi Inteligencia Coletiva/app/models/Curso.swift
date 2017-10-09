//
//  Curso.swift
//  Multi Inteligencia Coletiva
//
//  Created by Lucas Rocha on 20/09/17.
//  Copyright © 2017 Lucas Tavares. All rights reserved.
//

import Foundation

struct Curso {
    var id: Int?
    var imagem: String?
    var nome: String?
    var descricao: String?
    var categoria: String?
    var nivel: String?
    var privacidade: String?
    var preco: Double?
    var duracao: Int?
    var autor: Usuario?
    
    var description: [String: Any] {
        get { return ["id": id, "imagem": imagem, "nome": nome, "descricao": descricao, "categoria": categoria, "nivel": nivel, "privacidade": privacidade, "preco": preco, "duracao": duracao, "autor": autor?.id] }
    }
}
