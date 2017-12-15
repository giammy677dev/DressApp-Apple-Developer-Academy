//
//  WardrobeTableViewController.swift
//  DressApp
//
//  Created by Gian Marco Orlando on 14/12/17.
//  Copyright © 2017 Checkmate Team. All rights reserved.
//

import UIKit

class WardrobeTableViewController: UITableViewController {

    override func loadView() {
            super.loadView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        //        switch (genre) {
        //        case "male":
//        return 6
        //        case "female":
        return 7
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Your wardrobe"
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "prototypeCell", for: indexPath)

        // Configure the cell...
        switch indexPath.row {
        case 0:
            cell.textLabel?.text = "T-shirts"
            cell.imageView?.image = #imageLiteral(resourceName: "Maglietta160x160")
            cell.detailTextLabel?.text = "Prova"
        case 1:
            cell.textLabel?.text = "Shirts"
            cell.imageView?.image = #imageLiteral(resourceName: "T-Shirt")
            cell.detailTextLabel?.text = "Prova"
        case 2:
            cell.textLabel?.text = "Sweaters"
            cell.imageView?.image = #imageLiteral(resourceName: "Sweater")
            cell.detailTextLabel?.text = "Prova"
        case 3:
            cell.textLabel?.text = "Dresses"
            cell.imageView?.image = #imageLiteral(resourceName: "T-Shirt")
            cell.detailTextLabel?.text = "Prova"
        case 4:
            cell.textLabel?.text = "Trousers"
            cell.imageView?.image = #imageLiteral(resourceName: "Trouser")
            cell.detailTextLabel?.text = "Prova"
        case 5:
            cell.textLabel?.text = "Shoes"
            cell.imageView?.image = #imageLiteral(resourceName: "T-Shirt")
            cell.detailTextLabel?.text = "Prova"
        case 6:
            cell.textLabel?.text = "Skirts"
            cell.imageView?.image = #imageLiteral(resourceName: "T-Shirt")
            cell.detailTextLabel?.text = "Prova"
        default:
            cell.textLabel?.text = "Error! No category found!"
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
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
