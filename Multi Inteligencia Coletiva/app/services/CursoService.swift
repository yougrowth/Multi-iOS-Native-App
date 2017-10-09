//
//  CursoService.swift
//  Multi Inteligencia Coletiva
//
//  Created by Lucas Rocha on 09/10/17.
//  Copyright © 2017 Lucas Tavares. All rights reserved.
//

import UIKit

class CursoService: NSObject {
    var serviceUrl = URL(string: "https://yg-api-multi-temp.herokuapp.com/curso")!
    
    func criar(_ curso: Curso, depois callback: HttpRequestCallback) {
        HttpService
            .post(curso.description, to: serviceUrl, then: callback, requireAuth: true)
    }
}
