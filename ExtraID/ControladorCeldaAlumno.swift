//
//  ControladorCeldaAlumno.swift
//  ExtraID
//
//  Created by Iván Martínez on 21/11/19.
//  Copyright © 2019 Macnificos. All rights reserved.
//

import UIKit

class ControladorCeldaAlumno: UITableViewCell {

    @IBOutlet weak var fotoAlumnoCell: UIImageView!
    
    @IBOutlet weak var nombreAlumnoCell: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
