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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerView.delegate = self
        pickerView.dataSource = self
        
        // Setting the end of the table
        tableView.tableFooterView = UIView(frame: .zero)
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
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
        return 5
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            pickerView.isHidden = false
        }
        }
    }

extension AddClothesTableViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return pickerElements.count
    }

}

