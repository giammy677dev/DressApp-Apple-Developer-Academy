//
//  AddClothesTableViewController.swift
//  DressApp
//
//  Created by Gian Marco Orlando on 18/12/17.
//  Copyright © 2017 Checkmate Team. All rights reserved.
//

import UIKit

class AddClothesTableViewController: UITableViewController {
    @IBOutlet weak var colorPickedView: UIView!
    @IBOutlet weak var colorPickedLabel: UILabel!
    @IBOutlet weak var colorSelectionCell: UITableViewCell!
    @IBOutlet weak var pickerView: UIPickerView!
    
    var pickerElements: [String] = []
    var tissues: [String] = ["Cotton", "Wool", "Cashmere"]
    var colors: [String] = ["Black", "White", "Red", "Green" ]
    var color: String = ""      //PROVA PER VEDERE SE STAMPA IL COLORE
    var tissue: String = ""     //PROVA PER VEDERE SE STAMPA IL TESSUTO
    var dressCategory: Int = 0
    var categoryName: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerView.delegate = self
        pickerView.dataSource = self

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            pickerElements = tissues
            pickerView.reloadAllComponents()
            pickerView.isHidden = false
        } else if indexPath.row == 1{
            pickerElements = colors
            pickerView.reloadAllComponents()
            pickerView.isHidden = false
        }else{
            //CON QUESTE DUE RIGHE, SE CLICCHI SULLA TABLE SPARISCE IL PICKER. FAI LE RIGHE PIU' ALTE CHE COSI' PRENDONO PIU' SPAZIO E VIENE MEGLIO L'EFFETTO VOLUTO.
            self.tableView.resignFirstResponder()
            pickerView.isHidden = true
        }
        }
    
    //BOTTONE SALVA
    @IBAction func saveClothe(_ sender: Any) {
        //A SECONDA DI COSA STO AGGIUNGENDO, CHIAMO LA FUNZIONE CHE SALVA QUELL'INDUMENTO
        switch dressCategory {
        case 0:
            //addTShirt()
            categoryName = "T-Shirt"
            break
        case 1:
            //addTShirt()
            categoryName = "Shirt"
            break
        case 2:
            //addTShirt()
            categoryName = "Sweater"
            break
        case 3:
            //addTShirt()
            categoryName = "Dress"
            break
        case 4:
            //addTShirt()
            categoryName = "Trouser"
            break
        case 5:
            //addTShirt()
            categoryName = "Shoes"
            break
        case 6:
            //addTShirt()
            categoryName = "Skirt"
            break
        default:
            break
        }
        self.navigationController?.popViewController(animated: true)
        
        //Set the checkmark alert when new cloth is succesfully saved
        SweetAlert().showAlert("Saved succesfully!", subTitle: "\(categoryName) added to your wardrobe!", style: AlertStyle.success)
        
    }
    
    
//    func addTShirt(){           //VIENE CHIAMATA SE STAI AGGIUNGENDO UNA MAGLIETTA
//
//        let tShirt = TShirt(color: .black, material: .cotton, description: nil, elegant: true, model: .long)
//
//
////        (color: color, material: tissue, description: nil, elegant: elegant, model: sleeves) //CREO UN OGGETTO MAGLIA CON LE CARATTERISTICHE SCELTE. DESCRIPTION PER ORA NON L'HO CAGATA.
//
//        Wardrobe.shared.add(cloth: tShirt)  //SE HO CAPITO BENE, QUESTA FUNZIONE DOVREBBE FARE UN APPEND NEL VETTORE DELLE T-SHIRT
//
////        //ORA DEVO FARE UNA SERIE DI IF PER CAPIRE CHE IMMAGINE AGGIUNGERE ALLA COLLECTION
//
//        if elegant == true {
//            if sleeves == Model.short {
////                //POI QUI DEVO VEDERE ANCHE DI CHE COLORE E' STA MAGLIETTA. MA HO ANCORA DEI DUBBI SU COME FAREMO STO CASPITO DI COLORE.
//                                switch color{
//                                case .black:
////                                    ...
//
//                                delegate?.getImage(image: "Batman")       //QUESTO SERVE PER PASSARE L'IMG ALLA COLLECTION VIEW.
//
//            }
//            else if sleeves == Model.long {
//                //                STESSO PROCEDIMENTO CON COLORI
//                //                delegate?.getImage(image: "Trouser")
//            }
//
//        } else if elegant == false {
//         if sleeves == Model.short{
//                //                STESSO PROCEDIMENTO CON COLORI
//                //                delegate?.getImage(image: "Batman")
//
//
//            }
//            else if sleeves == Model.long{
//                //                STESSO PROCEDIMENTO CON COLORI
//                //                delegate?.getImage(image: "Trouser")
//            }
//        }
//    }
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
        if pickerElements == tissues{
            tissue = pickerElements[row]        //METTO IL TESSUTO SCELTO IN TISSUE PER PROVA.
        }else if pickerElements == colors{
            color = pickerElements[row]         //METTO IL COLORE SCELTO IN COLOR PER PROVA
        }
        print ("Tessuto: \(tissue)")            //STAMPO TISSUE E COLOR PER VEDERE SE FUNZIONA
        print ("Colore: \(color)")
        pickerView.isHidden = true
    }

}

