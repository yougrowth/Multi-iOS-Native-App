//
//  MenuHeader.swift
//  Multi Inteligencia Coletiva
//
//  Created by Lucas Rocha on 13/10/17.
//  Copyright © 2017 Lucas Tavares. All rights reserved.
//

import UIKit

class MenuHeader: UITableViewCell {
    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var nome: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
