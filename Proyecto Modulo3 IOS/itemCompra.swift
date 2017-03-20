//
//  itemCompra.swift
//  Proyecto Modulo3 IOS
//
//  Created by Carolina Mazzaglia on 20/03/17.
//  Copyright © 2017 Carolina Mazzaglia. All rights reserved.
//

import UIKit

class itemCompra: UITableViewCell {
    
    @IBOutlet weak var imagen: UIImageView!
    
    @IBOutlet weak var nombre: UILabel!
    
    @IBOutlet weak var precio: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
