//
//  ViewController.swift
//  Proyecto Modulo3 IOS
//
//  Created by Carolina Mazzaglia on 16/03/17.
//  Copyright © 2017 Carolina Mazzaglia. All rights reserved.
//

import UIKit
private let reuseIdentifier = "celda"
var compras = Array<compra>()

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var items = Array<item>()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        for i in 1...8 {
            let datos = item()
            datos.nombre = "Carro modelo \(i)"
            datos.precio =  Double(i) * 10000.0
            datos.imagen = UIImage(named: "carro\(i)")
            datos.detalle = "El carro modelo \(i) Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
            items.append(datos)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //colocamos el controler que creamos con los metodos de la celda con el as
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ItemCell
        
        // Configure the cell metodo donde vamos a conigurar la celda y asignar los datos para que se muestren
        
        let indice = indexPath.row
        let item = items[indice]
        
        cell.lbNombre.text = item.nombre
        cell.lbPrecio.text = "S/. \(item.precio!)"
        cell.imagen.image = item.imagen
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let indice = indexPath.row
        let dato = items[indice]
        
        self.performSegue(withIdentifier: "detalle", sender: dato)
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        let DetalleViewController: DetalleViewController = segue.destination as! DetalleViewController
        
        DetalleViewController.parametro = sender as! item
        
    }


}

