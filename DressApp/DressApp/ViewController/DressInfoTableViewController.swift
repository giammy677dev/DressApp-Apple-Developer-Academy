//
//  DressInfoTableViewController.swift
//  DressApp
//
//  Created by Giulio Izzo on 20/12/17.
//  Copyright © 2017 Checkmate Team. All rights reserved.
//

import UIKit

class DressInfoTableViewController: UITableViewController {

    var tShirtWardrobe = Wardrobe.shared.getTShirts()
    var shirtWardrobe = Wardrobe.shared.getShirts()
    var sweaterWardrobe = Wardrobe.shared.getSweaters()
    var dressWardrobe = Wardrobe.shared.getDresses()
    var trousersWardrobe = Wardrobe.shared.getTrousers()
    var shoesWardrobe = Wardrobe.shared.getShoes()
    var skirtsWardrobe = Wardrobe.shared.getSkirts()
    
    
    var cellRowSelected = 0
    var dressCategory = 0
    
    
    @IBOutlet weak var chosenColorLabel: UILabel!
    
    @IBOutlet weak var chosenMaterialLabel: UILabel!
    
    @IBOutlet weak var chosenModelLabel: UILabel!
    
    @IBOutlet weak var chosenElegantLabel: UILabel!
    
    
    @IBOutlet weak var chosenDescriptionLabel: UILabel!
    
    
    @IBOutlet weak var modelLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.tableFooterView = UIView(frame: .zero)
        
        switch dressCategory{
            case 0:
            loadTshirt()
            modelLabel.text = "Short/Long sleeves:"
            case 1:
            loadShirt()
            modelLabel.text = "Short/Long sleeves:"
        case 2:
            loadSweater()
            modelLabel.text = "Sweatshirt/Pullover"
        case 3:
            loadDress()
        case 4:
            loadTrousers()
            modelLabel.text = "Short/Long"
        case 5:
            loadShoes()
        case 6:
            loadSkirts()
            
            default:
            break
        }
        
        if chosenElegantLabel.text == "true"{
            chosenElegantLabel.text = "Yes"
        }else if chosenElegantLabel.text == "false"{
            chosenElegantLabel.text = "No"
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if (dressCategory == 3 || dressCategory == 5 || dressCategory == 6) && indexPath.row == 2{
            return 0
        } else{
            return super.tableView(tableView, heightForRowAt: indexPath)
        }
    }
    
    
    func loadTshirt(){

        chosenColorLabel.text = String(describing: tShirtWardrobe[cellRowSelected].color)
        chosenMaterialLabel.text = String(describing: tShirtWardrobe[cellRowSelected].material)
        chosenDescriptionLabel.text = String(describing: tShirtWardrobe[cellRowSelected].description!)
        chosenElegantLabel.text = String(describing: tShirtWardrobe[cellRowSelected].isElegant)
        chosenModelLabel.text = String(describing: tShirtWardrobe[cellRowSelected].sleeves)
    }


    func loadShirt(){
        chosenColorLabel.text = String(describing: shirtWardrobe[cellRowSelected].color)
        chosenMaterialLabel.text = String(describing: shirtWardrobe[cellRowSelected].material)
        chosenDescriptionLabel.text = String (describing: shirtWardrobe[cellRowSelected].description!)
        chosenElegantLabel.text = String(describing: shirtWardrobe[cellRowSelected].isElegant)
        chosenModelLabel.text = String(describing: shirtWardrobe[cellRowSelected].model)

    }
    
    func loadSweater(){
        chosenColorLabel.text = String (describing: sweaterWardrobe[cellRowSelected].color)
        chosenMaterialLabel.text = String (describing: sweaterWardrobe[cellRowSelected].material)
        chosenDescriptionLabel.text = String (describing: sweaterWardrobe[cellRowSelected].description!)
        chosenElegantLabel.text = String(describing: sweaterWardrobe[cellRowSelected].isElegant)
        chosenModelLabel.text = String(describing: sweaterWardrobe[cellRowSelected].model)
    }
    
    func loadDress(){
        chosenColorLabel.text = String (describing: dressWardrobe[cellRowSelected].color)
        chosenMaterialLabel.text = String (describing: dressWardrobe[cellRowSelected].material)
        chosenDescriptionLabel.text = String (describing: dressWardrobe[cellRowSelected].description!)
        chosenElegantLabel.text = String(describing: dressWardrobe[cellRowSelected].isElegant)
    }
    
    func loadTrousers(){
        
        chosenColorLabel.text = String (describing: trousersWardrobe[cellRowSelected].color)
        chosenMaterialLabel.text = String (describing: trousersWardrobe[cellRowSelected].material)
        chosenDescriptionLabel.text = String (describing: trousersWardrobe[cellRowSelected].description!)
        chosenElegantLabel.text = String(describing: trousersWardrobe[cellRowSelected].isElegant)
        chosenModelLabel.text = String(describing: trousersWardrobe[cellRowSelected].model)
    }
    
    func loadShoes(){
        chosenColorLabel.text = String (describing: shoesWardrobe[cellRowSelected].color)
        chosenMaterialLabel.text = String (describing: shoesWardrobe[cellRowSelected].material)
        chosenDescriptionLabel.text = String (describing: shoesWardrobe[cellRowSelected].description!)
        chosenElegantLabel.text = String(describing: shoesWardrobe[cellRowSelected].isElegant)
        
    }
    
    func loadSkirts(){
        chosenColorLabel.text = String (describing: skirtsWardrobe[cellRowSelected].color)
        chosenMaterialLabel.text = String (describing: skirtsWardrobe[cellRowSelected].material)
        chosenDescriptionLabel.text = String (describing: skirtsWardrobe[cellRowSelected].description!)
        chosenElegantLabel.text = String(describing: skirtsWardrobe[cellRowSelected].isElegant)
    }
    
    
    
    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        return 0
//    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */


}
