//
//  HeaderTableViewCell.swift
//  Multi Inteligencia Coletiva
//
//  Created by Lucas Rocha on 19/09/17.
//  Copyright © 2017 Lucas Tavares. All rights reserved.
//

import UIKit

class HeaderTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var novoCursoButton: UIButton!
    @IBOutlet weak var searchTextField: UITextField!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        titleLabel.text = "Cursos"
        searchTextField.layer.borderColor = UIColor(red: 128/255, green: 128/255, blue: 128/255, alpha: 1).cgColor
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
