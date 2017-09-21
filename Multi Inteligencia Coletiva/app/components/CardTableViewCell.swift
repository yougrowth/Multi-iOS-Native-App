//
//  CardTableViewCell.swift
//  Multi Inteligencia Coletiva
//
//  Created by Lucas Rocha on 19/09/17.
//  Copyright © 2017 Lucas Tavares. All rights reserved.
//

import UIKit

class CardTableViewCell: UITableViewCell {
    @IBOutlet weak var cursoImage: UIImageView!
    @IBOutlet weak var cursoTituloLabel: UILabel!
    @IBOutlet weak var cursoDescLabel: UILabel!
    @IBOutlet weak var participarButton: UIButton!
    @IBOutlet weak var autorImage: UIImageView!
    @IBOutlet weak var autorNome: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        cursoImage.layer.borderWidth = 1
        cursoImage.layer.borderColor = UIColor(red: 5/255, green: 66/255, blue: 62/255, alpha: 1/255).cgColor
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
