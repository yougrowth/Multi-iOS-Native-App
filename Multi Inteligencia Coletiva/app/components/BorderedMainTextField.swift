//
//  BorderedMainTextField.swift
//  Multi Inteligencia Coletiva
//
//  Created by Lucas Rocha on 08/10/17.
//  Copyright © 2017 Lucas Tavares. All rights reserved.
//

import UIKit

class BorderedMainTextField: MainTextField {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        criarBorda()
    }
    
    required init(frame: CGRect) {
        super.init(frame: frame)
        criarBorda()
    }
    
    func criarBorda() {
        let border = CALayer()
        border.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height)
        border.borderWidth = 1.0
        border.borderColor = UIColor.lightGray.cgColor
        
        self.borderStyle = UITextBorderStyle.none
        self.layer.addSublayer(border)
    }
}
