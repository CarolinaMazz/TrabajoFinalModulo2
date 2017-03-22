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
    
    @IBOutlet weak var collectionView: UICollectionView!
    var itemsFiltrados = Array<item>()
    var items = Array<item>()
    @IBOutlet weak var txtBuscar: UITextField!
    var searchController : UISearchController!

    /*@IBAction func txtBuscarTexto(_ sender: AnyObject) {
        let texto = txtBuscar.text
        
        itemsFiltrados = items.filter({ (item) -> Bool in
            //connvertimos un numero a string para realizar la busqueda de numeros con un string
            return ("\(item.precio)".contains(texto!) || item.nombre.lowercased().contains(texto!))
            //return String(dispositivo.precio).contains(texto!)
            
            //return dispositivo.nombre.lowercased().contains(texto!)
            
        })
        
        collectionView.reloadData()
    }*/
    
    
    
    
    @IBAction func txtBuscarTexto(_ sender: AnyObject) {
        let texto = txtBuscar.text
        
        itemsFiltrados = items.filter({ (item) -> Bool in
            //connvertimos un numero a string para realizar la busqueda de numeros con un string
            return ("\(item.precio)".contains(texto!) || item.nombre.lowercased().contains(texto!))
            //return String(dispositivo.precio).contains(texto!)
            
            //return dispositivo.nombre.lowercased().contains(texto!)
            
        })
        
        collectionView.reloadData()
    }
    
    
    
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
        if (txtBuscar.text != ""){
            return itemsFiltrados.count
        }else{
            return items.count
        }
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //colocamos el controler que creamos con los metodos de la celda con el as
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ItemCell
        
        // Configure the cell metodo donde vamos a conigurar la celda y asignar los datos para que se muestren
        
        let indice = indexPath.row
        let item:item
        if (txtBuscar.text != ""){
            item = itemsFiltrados[indice]
        }else{
            item = items[indice]
        }
        
        
        cell.lbNombre.text = item.nombre
        cell.lbPrecio.text = "S/. \(item.precio!)"
        cell.imagen.image = item.imagen
        cell.tag = indexPath.row
        
        let longGestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(long))
        longGestureRecognizer.minimumPressDuration = 1 //segundos

        cell.addGestureRecognizer(longGestureRecognizer)
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let indice = indexPath.row
        let dato = items[indice]
        self.performSegue(withIdentifier: "detalle", sender: dato)
    }
    
    func long(sender: UILongPressGestureRecognizer) {
        
        let listdatos = compra()
        
        let indice = sender.view!.tag
        
        listdatos.nombre = items[indice].nombre
        listdatos.detalle = items[indice].detalle
        listdatos.precio = items[indice].precio
        listdatos.imagen = items[indice].imagen
        compras.append(listdatos)
        
        var alertControler:UIAlertController
        //definimos la alerta que se va a mostrar definimos un controler
        alertControler=UIAlertController(title: "Agregar al Carrito", message: "Fue Agregado al Carrito", preferredStyle: UIAlertControllerStyle.alert)
        //creamos la accion
        let accionOK = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: { (action) in
            print("Ok")})
        //asignamos la accion y motramos
        alertControler.addAction(accionOK)
        self.present(alertControler, animated: true, completion: {})
        
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "detalle" {
            let DetalleViewController: DetalleViewController = segue.destination as! DetalleViewController
        
            DetalleViewController.parametro = sender as! item
        }
        
    }
    
    @IBAction func btnCarro(_ sender: UIBarButtonItem) {
        self.performSegue(withIdentifier: "carrito", sender: sender)
    }
    

}

