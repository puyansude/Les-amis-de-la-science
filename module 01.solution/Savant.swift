//
//  Savant.swift
//  Les amis de la science
//
//  Created by Alain on 2015-09-13.
//  Copyright (c) 2015 Production sur support. All rights reserved.
//

import UIKit

class Savant: UITableViewCell {

    @IBOutlet weak var savantNom: UILabel!
    @IBOutlet weak var savantImage: UIImageView!
    @IBOutlet weak var savantTexte: UITextView!
    @IBOutlet weak var savantAge: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
