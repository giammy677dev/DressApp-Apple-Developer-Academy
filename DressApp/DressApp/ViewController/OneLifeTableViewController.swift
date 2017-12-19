//
//  OneLifeTableViewController.swift
//  DressApp
//
//  Created by Gian Marco Orlando on 18/12/17.
//  Copyright © 2017 Checkmate Team. All rights reserved.
//

import UIKit

class OneLifeTableViewController: UITableViewController, UITextFieldDelegate {
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var datePickerCell: UITableViewCell!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var dueDateLabel: UILabel!
    @IBOutlet weak var genreSegmentedControl: UISegmentedControl!
    @IBOutlet weak var appleButton: UIButton!
    @IBOutlet weak var pearButton: UIButton!
    @IBOutlet weak var timeSandButton: UIButton!
    
    
    
    var datePickerVisible: Bool = false
    var dueDate = Date()

    
    
    @IBAction func bodyShapeSet(_ sender: UIButton) {
        
        datePickerVisible = false
        tableView.reloadData()
        let buttons: [UIButton] = [appleButton, pearButton, timeSandButton]
        for button in buttons {
            
            if button != sender {
                button.alpha = 0.3
                button.isSelected = false
            }
        }
        sender.alpha = 1.0
        sender.isSelected = true
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.enablesReturnKeyAutomatically = true
        self.nameTextField.delegate = self
        datePicker.maximumDate = Date()
        tableView.contentInsetAdjustmentBehavior = .always
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(_ nameTextField: UITextField) -> Bool {
        nameTextField.resignFirstResponder()
        return true
    }

    @IBAction func changeUserName(_ sender: UITextField) {
            User.shared.name = nameTextField.text
            defaults.set(nameTextField.text, forKey: "username")
        }
    
    // End the one-life view forever
    @IBAction func acceptButtonTapped(_ sender: Any) {
        
        var selectedGender: User.UserGenre {
            
            switch self.genreSegmentedControl.selectedSegmentIndex {
                case 0:
                    return User.UserGenre.male
                case 1:
                    return User.UserGenre.female
                default: return User.UserGenre.other
                }
        }
        
        var selectedBodyShape: User.BodyShape {
            
            if appleButton.isSelected {
                return .apple
            } else if pearButton.isSelected {
                return .pear
            } else {
                return .sandTimer
            }
            
        }
        
        User.shared.setUserInfo(genre: selectedGender, bodyShape: selectedBodyShape, dateOfBirth: dueDate, name: nameTextField.text!)
        UserDefaults.standard.set(true, forKey: "termsAccepted")
        performSegue(withIdentifier: "toPeekView", sender: sender)
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 2  {
            return datePickerCell
        } else {
            return super.tableView(tableView, cellForRowAt: indexPath)
        }
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if datePickerVisible {
            return 5
        } else {
            return super.tableView(tableView, numberOfRowsInSection: section)
        }
        
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 2 {
            let cond = datePickerVisible
            return cond ? 217 : 0
        } else {
            return super.tableView(tableView, heightForRowAt: indexPath)
        }
    }
    
    
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        
        if indexPath.row == 1 {
            datePickerVisible = !datePickerVisible
            tableView.reloadData()
            return indexPath
        } else if indexPath.row == 3 {
            datePickerVisible = false
            tableView.reloadData()
            return indexPath
        } else {
            datePickerVisible = false
            tableView.reloadData()
            return nil
        }
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, indentationLevelForRowAt indexPath: IndexPath) -> Int {
        var newIndexPath = indexPath
        if indexPath.section == 0 && indexPath.row == 2 {
            newIndexPath = IndexPath(row: 0, section: indexPath.section)
        }
        return super.tableView(tableView, indentationLevelForRowAt: newIndexPath)
    }
    
    /*
     Birthdate functions
     */
    @IBAction func dateChanged(_ sender: UIDatePicker) {
        dueDate = datePicker.date
        updateDueDateLabel()
    }
    func updateDueDateLabel() {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        dueDateLabel.text = formatter.string(from: dueDate)
    }

    
    
}



