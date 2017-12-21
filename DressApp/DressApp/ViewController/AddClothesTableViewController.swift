//
//  AddClothesTableViewController.swift
//  DressApp
//
//  Created by Gian Marco Orlando on 18/12/17.
//  Copyright © 2017 Checkmate Team. All rights reserved.
//

import UIKit

//This delegate passes the clothe that the user adds to WardrobeCollectionViewController, in way to add a new image that represents this new clothe.

protocol GetImageDelegate: class {
    func didChooseTShirtImage(tShirt: TShirt)
    func didChooseShirtImage(shirt: Shirt)
    func didChooseSweaterImage(sweater: Sweater)
    func didChooseDress(dress: Dress)
    func didChooseTrousers(trousers: Trousers)
    func didChooseShoes(shoes: Shoes)
    func didChooseSkirt(skirt: Skirt)
}

class AddClothesTableViewController: UITableViewController, UITextFieldDelegate {
    
    weak var getImageDelegate: GetImageDelegate?
    
    @IBOutlet weak var colorPickedLabel: UILabel!
    @IBOutlet weak var colorSelectionCell: UITableViewCell!
    @IBOutlet weak var pickerView: UIPickerView!
    
    var pickerElements: [String] = []
    var tissues: [String] = ["cotton", "wool", "cashmere", "synthetic", "jeans"]
    var colors: [String] = ["black", "white", "navajoWhite","red", "blue","lightSkyBlue","navy","torchRed","saddleBrown","pink","silver","maroon","myrtle","indigo","putty","yellow"]
    var tissue: Material = Material.cotton
    var color: Color = Color.black
    
    var elegant: Bool = false
    var sleeves: Model = Model.short
    var sweaterType: SweaterModels = SweaterModels.pullover
    var dressCategory: Int = 0      //This is necessary to understand what the user is adding. It's given by WardrobeCollectionViewController
    
    
    @IBOutlet weak var modelLabel: UILabel!
    
    @IBOutlet weak var chosenColorLabel: UILabel!
    
    @IBOutlet weak var chosenMaterialLabel: UILabel!
    
    @IBOutlet weak var descriptionText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        descriptionText.text = ""
        chosenColorLabel.text = ""
        chosenMaterialLabel.text = ""
        
        descriptionText.enablesReturnKeyAutomatically = true
        descriptionText.delegate = self
        
        pickerView.dataSource = self
        pickerView.delegate = self
        
        setUpLabels()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func setUpLabels(){
        
        if dressCategory == 0 || dressCategory == 1 {
            modelLabel.text = "Short/Long Sleeves"
        }
        if dressCategory == 2{
            modelLabel.text = "Pullover/Sweatshirt"
        }
        if dressCategory == 3{
            
        }
        if dressCategory == 4{
            modelLabel.text = "Short/Long"
        }
    }
    

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        descriptionText.resignFirstResponder()
        return true
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            pickerElements = colors
            pickerView.reloadAllComponents()
            pickerView.isHidden = false
        } else if indexPath.row == 1{
            pickerElements = tissues
            pickerView.reloadAllComponents()
            pickerView.isHidden = false
        }else{
            self.tableView.resignFirstResponder()
            if self.descriptionText.isEditing == true {
                self.pickerView.isHidden = true
            }
            pickerView.isHidden = true
            }
        self.view.endEditing(true)
        }
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if (dressCategory == 3 || dressCategory == 5 || dressCategory == 6) && indexPath.row == 2{
            return 0
        } else{
             return super.tableView(tableView, heightForRowAt: indexPath)
        }
        
    }
    
    
    @IBAction func modelSwitched(_ sender: UISwitch) {
        if sender.isOn == true{
            switch dressCategory{
            case 0,1,4:                     //SE STAI AGGIUNGENDO UNA MAGLIA O UNA CAMICIA O UN VESTITO, CAMBI SLEEVES
                sleeves = Model.long
            case 2:                         //SE STAI AGGIUNGENDO UN MAGLIONE, MODIFICHI sweaterType
                sweaterType = SweaterModels.sweatshirt
            default:
                break
            }
        }else if sender.isOn == false{      //QUA E' NEL CASO LO SWITCH SIA FALSO. RIPETI IL PROCEDIMENTO.
            switch dressCategory{
            case 0,1,4:
                sleeves = Model.short
            case 2:
                sweaterType = SweaterModels.pullover
                print (sweaterType)
            default:
                break
            }
        }
    }
        
    @IBAction func elegantSwitched(_ sender: UISwitch) {
        if sender.isOn == true{
            elegant = true
        }else{
            elegant = false
        }
    }
    
    
    @IBAction func saveClothe(_ sender: Any) {
        
        //Depending on the type of dress, the switch calls the appropriate function
        
        switch dressCategory{
        case 0:
            addTShirt()
        case 1:
            addShirt()
        case 2:
            addSweater()
        case 3:
            addDress()
        case 4:
            addTrousers()
        case 5:
            addShoes()
        case 6:
            addSkirts()
        default:
            break
        }
        
        self.navigationController?.popViewController(animated: true)
        
    }
    
    
    func addTShirt(){
        
        let newTShirt = TShirt(color: color, material: tissue, description: descriptionText.text, elegant: elegant, model: sleeves)
        getImageDelegate?.didChooseTShirtImage(tShirt: newTShirt)

    }
    
    func addShirt(){
        let newShirt = Shirt(color: color, material: tissue, description: descriptionText.text, elegant: elegant, model: sleeves)
        getImageDelegate?.didChooseShirtImage(shirt: newShirt)
        
    }
    
    func addSweater(){
        let newSweater = Sweater(color: color, material: tissue, description: descriptionText.text, elegant: elegant, model: sweaterType)
        getImageDelegate?.didChooseSweaterImage(sweater: newSweater)
        
    }
    
    func addDress(){
        let newDress = Dress(color: color, material: tissue, description: descriptionText.text, elegant: elegant)
        getImageDelegate?.didChooseDress(dress: newDress)
        
    }
    
    func addTrousers(){
        let newTrousers = Trousers(color: color, material: tissue, description: descriptionText.text, elegant: elegant, model: sleeves)
        getImageDelegate?.didChooseTrousers(trousers: newTrousers)
        
        
    }
    
    func addShoes(){
        let newShoes = Shoes(color: color, material: tissue, description: descriptionText.text, elegant: elegant)
        getImageDelegate?.didChooseShoes(shoes: newShoes)
        
    }
    
    func addSkirts(){
        let newSkirt = Skirt(color: color, material: tissue, description: descriptionText.text, elegant: elegant)
        getImageDelegate?.didChooseSkirt(skirt: newSkirt)
    }
    
    
}


extension AddClothesTableViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return pickerElements.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerElements[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerElements == colors{
            switch self.pickerView.selectedRow(inComponent: 0){
            case 0:
                color = .black
            case 1:
                color = .white
            case 2:
                color = .navajoWhite
            case 3:
                color = .red
            case 4:
                color = .blue
            case 5:
                color = .lightSkyBlue
            case 6:
                color = .navy
            case 7:
                color = .torchRed
            case 8:
                color = .saddleBrown
            case 9:
                color = .pink
            case 10:
                color = .silver
            case 11:
                color = .maroon
            case 12:
                color = .myrtle
            case 13:
                color = .indigo
            case 14:
                color = .putty
            case 15:
                color = .yellow
            default:
                break
            }
            chosenColorLabel.text = pickerElements[row].description
            
        }
        else if pickerElements == tissues{
            switch self.pickerView.selectedRow(inComponent: 0){
                
            case 0:
                tissue = .cotton
            case 1:
                tissue = .wool
            case 2:
                tissue = .cashmere
            case 3:
                tissue = .synthetic
            case 4:
                tissue = .jeans
            default:
                break
            }
            chosenMaterialLabel.text = pickerElements[row].description
        }
//        pickerView.isHidden = true
    }
    

}

