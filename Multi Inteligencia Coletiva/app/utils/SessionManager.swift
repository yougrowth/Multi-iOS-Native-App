//
//  SessionManager.swift
//  Multi Inteligencia Coletiva
//
//  Created by Lucas Rocha on 13/10/17.
//  Copyright © 2017 Lucas Tavares. All rights reserved.
//

import UIKit

class SessionManager: NSObject {
    static var userDefaults = UserDefaults.standard
    static var usuario: Usuario?
    
    static func initSession(for token: String) -> Void {
        self.userDefaults.set(token, forKey: "session")
    }
    
    static func closeSession() -> Void {
        self.userDefaults.removeObject(forKey: "session")
        self.setLogado(nil)
    }
    
    static func getToken() -> Any? {
        return self.userDefaults.object(forKey: "session")
    }
    
    static func setLogado(_ usuario: Usuario?) -> Void {
        self.usuario = usuario
    }
    
    static func getLogado() -> Usuario? {
        return self.usuario
    }
}
