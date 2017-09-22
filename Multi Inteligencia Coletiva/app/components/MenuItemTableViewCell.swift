//
//  MenuItemTableViewCell.swift
//  Multi Inteligencia Coletiva
//
//  Created by Lucas Rocha on 21/09/17.
//  Copyright © 2017 Lucas Tavares. All rights reserved.
//

import UIKit

class MenuItemTableViewCell: UITableViewCell {
    @IBOutlet weak var itemTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
