//
//  Usuario.swift
//  Multi Inteligencia Coletiva
//
//  Created by Lucas Rocha on 20/09/17.
//  Copyright © 2017 Lucas Tavares. All rights reserved.
//

import UIKit

struct Usuario: Codable {
    var id: Int?
    var nome: String?
    var foto: String?
    var email: String?
    var cidade: String?
    var senha: String?
 
    var description: [String: Any] {
        get { return [ "id": id, "nome": nome, "foto": foto, "email": email, "cidade": cidade, "senha": senha ]}
    }
}

/*
 {
     "id": 3,
     "nome": "Ariovaldo da Silva",
     "foto": null,
     "email": "ariovaldo.silva@mail.com",
     "cidade": "São José das Pedras",
     "senha": "$2a$10$IoTvBmG.JtMsJqfUTqDS8OuKTfoqJQgiUfNuhjk5XVVKPB02qvELK"
 }
 */
