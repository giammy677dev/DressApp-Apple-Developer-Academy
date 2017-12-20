//
//  WardrobeTableViewController.swift
//  DressApp
//
//  Created by Gian Marco Orlando on 14/12/17.
//  Copyright © 2017 Checkmate Team. All rights reserved.
//

import UIKit

class WardrobeTableViewController: UITableViewController {
    
    var segueID = "toCollection"
    var selectedRow: Int = 0
    

    override func loadView() {
        super.loadView()
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
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
        
                switch (User.shared.genre) {
                case .male?:
                return 6
                    
                case .female?:
        return 7
                default:
                    return 0
        }
    }
    
    //    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    //        return "Your wardrobe"
    //    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "prototypeCell", for: indexPath)
        
        
        
        // Configure the cell...
        switch indexPath.row {
        case 0:
            cell.textLabel?.text = "T-shirts"
            cell.imageView?.image = #imageLiteral(resourceName: "T-Shirt")
            cell.detailTextLabel?.text = "Prova"
        case 1:
            cell.textLabel?.text = "Shirts"
                        cell.imageView?.image = #imageLiteral(resourceName: "Shirt")
            cell.detailTextLabel?.text = "Prova"
        case 2:
            cell.textLabel?.text = "Sweaters"
            cell.imageView?.image = #imageLiteral(resourceName: "Sweater")
            cell.detailTextLabel?.text = "Prova"
        case 3:
            cell.textLabel?.text = "Dresses"
            cell.imageView?.image = #imageLiteral(resourceName: "Man Dress")
            cell.detailTextLabel?.text = "Prova"
        case 4:
            cell.textLabel?.text = "Trousers"
            cell.imageView?.image = #imageLiteral(resourceName: "Trouser")
            cell.detailTextLabel?.text = "Prova"
        case 5:
            cell.textLabel?.text = "Shoes"
            cell.imageView?.image = #imageLiteral(resourceName: "Shoes")
            cell.detailTextLabel?.text = "Prova"
        case 6:
            cell.textLabel?.text = "Skirts"
            cell.imageView?.image = #imageLiteral(resourceName: "Skirts")
            cell.detailTextLabel?.text = "Prova"
        default:
            cell.textLabel?.text = "Error! No category found!"
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // get a reference to the second view controller
        let secondViewController = segue.destination as! WardrobeCollectionViewController
        
        // set a variable in the second view controller with the data to pass
        let selectedRowNumber = tableView.indexPathForSelectedRow!.last
        secondViewController.cellPushed = selectedRowNumber
        
    }
}
