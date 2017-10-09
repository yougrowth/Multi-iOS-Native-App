//
//  Auth.swift
//  Multi Inteligencia Coletiva
//
//  Created by Lucas Rocha on 08/10/17.
//  Copyright © 2017 Lucas Tavares. All rights reserved.
//

import Foundation

struct Auth: Codable {
    var token: String?
    
    var description: [String: String] {
        get { return ["token": token!] }
    }
}
