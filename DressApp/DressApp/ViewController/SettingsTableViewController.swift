//
//  SettingsTableViewController.swift
//  DressApp
//
//  Created by Gian Marco Orlando on 15/12/17.
//  Copyright © 2017 Checkmate Team. All rights reserved.
//

import UIKit
import UserNotifications

class SettingsTableViewController: UITableViewController, UITextFieldDelegate {
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var datePickerCell: UITableViewCell!
    @IBOutlet weak var dueDateLabel: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var genreSegmentedControl: UISegmentedControl!
    @IBOutlet weak var appleButton: UIButton!
    @IBOutlet weak var pearButton: UIButton!
    @IBOutlet weak var timeSandButton: UIButton!
    
    var datePickerVisible: Bool = false
    var dueDate = Date()
    var switchState: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userNameTextField.text = User.shared.name!
        userNameTextField.enablesReturnKeyAutomatically = true
        userNameTextField.delegate = self
        
        if User.shared.bodyShape == .apple {
            pearButton.alpha = 0.3
            timeSandButton.alpha = 0.3
        } else if User.shared.bodyShape == .pear {
            appleButton.alpha = 0.3
            timeSandButton.alpha = 0.3
        } else {
            appleButton.alpha = 0.3
            pearButton.alpha = 0.3
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        userNameTextField.resignFirstResponder()
        return true
    }
    
    @IBAction func saveChangeSettingsButton(_ sender: UIButton) {

        var selectedGender: UserGenre {
            switch self.genreSegmentedControl.selectedSegmentIndex {
            case 0:
                return .male
            case 1:
                return .female
            default: return .other
            }
        }

        var selectedBodyShape: BodyShape {

            if appleButton.isSelected {
                return .apple
            } else if pearButton.isSelected {
                return .pear
            } else {
                return .sandTimer
            }

        }

        User.shared.setUserInfo(genre: selectedGender, bodyShape: selectedBodyShape, dateOfBirth: dueDate, name: userNameTextField.text!)
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func dateChanged(_ sender: UIDatePicker) {
        dueDate = datePicker.date
        updateDueDateLabel()
    }
    func updateDueDateLabel() {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        dueDateLabel.text = formatter.string(from: dueDate)
    }
    
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
}
