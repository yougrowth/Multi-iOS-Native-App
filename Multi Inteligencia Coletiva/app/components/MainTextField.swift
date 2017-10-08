//
//  MainTextField.swift
//  Multi Inteligencia Coletiva
//
//  Created by Lucas Rocha on 07/10/17.
//  Copyright © 2017 Lucas Tavares. All rights reserved.
//

import UIKit

class MainTextField: UITextField {
    let padding = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 10)
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        criarSombra()
    }
    
    required override init(frame: CGRect) {
        super.init(frame: frame)
        criarSombra()
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
    
    func criarSombra() {
        self.layer.shadowOpacity = 0.4
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        self.layer.shadowRadius = 1.0
    }
}
