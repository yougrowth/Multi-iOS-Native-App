//
//  AlertFactory.swift
//  Multi Inteligencia Coletiva
//
//  Created by Lucas Rocha on 07/10/17.
//  Copyright © 2017 Lucas Tavares. All rights reserved.
//

import Foundation
import UIKit

func alertGenerico(titulo: String, mensagem: String) -> UIAlertController {
    let alerta = UIAlertController(
        title: titulo,
        message: mensagem,
        preferredStyle: UIAlertControllerStyle.alert)
    
    alerta.addAction(UIAlertAction(
        title: "Ok",
        style: UIAlertActionStyle.default,
        handler: nil))
    
    return alerta
}
