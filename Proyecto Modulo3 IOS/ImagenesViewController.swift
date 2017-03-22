//
//  ImagenesViewController.swift
//  Proyecto Modulo3 IOS
//
//  Created by Carolina Mazzaglia on 20/03/17.
//  Copyright © 2017 Carolina Mazzaglia. All rights reserved.
//

import UIKit

class ImagenesViewController: UIViewController {

    @IBOutlet weak var imagen: UIImageView!
    //@IBOutlet weak var nombre: UILabel!
    var dataObject: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //self.nombre!.text = dataObject
        self.imagen!.image = UIImage(named: dataObject)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //self.nombre!.text = dataObject
        self.imagen!.image = UIImage(named: dataObject)
    }

}
