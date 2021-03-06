//
//  ComprasTableViewController.swift
//  Proyecto Modulo3 IOS
//
//  Created by Carolina Mazzaglia on 20/03/17.
//  Copyright © 2017 Carolina Mazzaglia. All rights reserved.
//

import UIKit

class ComprasTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        self.navigationItem.backBarButtonItem?.title=" "
        super.viewDidLoad()
        
            //UIBarButtonItem(title:"", style:nil, target:nil, action:nil)
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return compras.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let indice = indexPath.row
        let item = compras[indice]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "celda", for: indexPath) as! itemCompra
        
        cell.nombre.text = item.nombre
        cell.imagen.image = item.imagen
        cell.precio.text = "S./ \(item.precio!)"
        cell.tag = indexPath.row
        
        let swipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(screen))
        swipeGestureRecognizer.direction = UISwipeGestureRecognizerDirection.left
        swipeGestureRecognizer.numberOfTouchesRequired = 1
        cell.addGestureRecognizer(swipeGestureRecognizer)
        
        return cell
    }
    
    /*override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
     let indice = indexPath.row
     print(indice)
     compras.remove(at: indice)
     tableView.reloadData()
    }*/
    
    /*func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let indice = indexPath.row
        let dato = items[indice]
        self.performSegue(withIdentifier: "detalle", sender: dato)
    }*/
    
    func screen(sender: UISwipeGestureRecognizer) {
        
        let indice = sender.view!.tag
        print(indice)
        compras.remove(at: indice)
        tableView.reloadData()
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
