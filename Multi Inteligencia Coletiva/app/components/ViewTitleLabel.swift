//
//  ViewTitleLabel.swift
//  Multi Inteligencia Coletiva
//
//  Created by Lucas Rocha on 08/10/17.
//  Copyright © 2017 Lucas Tavares. All rights reserved.
//

import UIKit

class ViewTitleLabel: UILabel {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.textColor = UIColor.darkGray
        self.font = self.font.withSize(22)
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
