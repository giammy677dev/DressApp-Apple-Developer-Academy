//
//  AddClothesTableViewController.swift
//  DressApp
//
//  Created by Gian Marco Orlando on 18/12/17.
//  Copyright © 2017 Checkmate Team. All rights reserved.
//

import UIKit

class AddClothesTableViewController: UITableViewController, UITextFieldDelegate {
    
    
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
    var dressCategory: Int = 0      //SERVE PER CAPIRE COSA STAI AGGIUNGENDO. TE LO PASSA LA WARDROBECOLLECTION
    
    
    @IBOutlet weak var modelLabel: UILabel!
    
    @IBOutlet weak var chosenColorLabel: UILabel!
    
    @IBOutlet weak var chosenMaterialLabel: UILabel!
    
    @IBOutlet weak var descriptionText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        descriptionText.enablesReturnKeyAutomatically = true
        descriptionText.delegate = self
        
        chosenColorLabel.text = ""
        chosenMaterialLabel.text = ""
        
        pickerView.dataSource = self
        pickerView.delegate = self
        

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
        }else{
            //VESTITINI ETC BOH
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        view.endEditing(true)             //O fai così
        descriptionText.resignFirstResponder()    //O fai così
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
            //CON QUESTE DUE RIGHE, SE CLICCHI SULLA TABLE SPARISCE IL PICKER. FAI LE RIGHE PIU' ALTE CHE COSI' PRENDONO PIU' SPAZIO E VIENE MEGLIO L'EFFETTO VOLUTO.
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
            }   //AND SO ON...........
    }
}
        
    @IBAction func elegantSwitched(_ sender: UISwitch) {
        if sender.isOn == true{
            elegant = true
        }else{
            elegant = false
    }
}
    
    //BOTTONE SALVA
    @IBAction func saveClothe(_ sender: Any) {
        //A SECONDA DI COSA STO AGGIUNGENDO, CHIAMO LA FUNZIONE CHE SALVA QUELL'INDUMENTO
       
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
    
    func addTShirt(){           //VIENE CHIAMATA SE STAI AGGIUNGENDO UNA MAGLIETTA
        
        
        _ = TShirt(color: color, material: tissue, description: descriptionText.text, elegant: elegant, model: sleeves)
        
        
//        delegate?.getImage(image: "T-Shirt") //NON VA MESSO QUI, MA VA BEH, PER PROVA

//
//        if elegant == true{
//            if sleeves == Model.long{
//
//            }
//        }
    }
    
    func addShirt(){
        _ = Shirt(color: color, material: tissue, description: descriptionText.text, elegant: elegant, model: sleeves)
        
    }
    
    func addSweater(){
        _ = Sweater(color: color, material: tissue, description: descriptionText.text, elegant: elegant, model: sweaterType)
    }
    
    func addDress(){
        _ = Dress(color: color, material: tissue, description: descriptionText.text, elegant: elegant)
    }
    
    func addTrousers(){
        _ = Trousers(color: color, material: tissue, description: descriptionText.text, elegant: elegant, model: sleeves)
    }
    
    func addShoes(){
        _ = Shoes(color: color, material: tissue, description: descriptionText.text, elegant: elegant)
    }
    
    func addSkirts(){
        _ = Skirt(color: color, material: tissue, description: descriptionText.text, elegant: elegant)
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

