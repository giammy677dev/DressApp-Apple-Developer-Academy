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
    var datePickerVisible: Bool = false
    var dueDate = Date()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.enablesReturnKeyAutomatically = true
        self.nameTextField.delegate = self
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
        
        UserDefaults.standard.set(true, forKey: "termsAccepted")
        performSegue(withIdentifier: "toPeekView", sender: sender)
    }
    
    func showDatePicker() {
        datePickerVisible = true
        let indexPathDatePicker = IndexPath(row: 2, section: 0)
        tableView.insertRows(at: [indexPathDatePicker], with: .fade)
        datePicker.maximumDate = Date()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 && indexPath.row == 2  {
            return datePickerCell
        } else {
            return super.tableView(tableView, cellForRowAt: indexPath)
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 && datePickerVisible {
            return 5
        } else {
            return super.tableView(tableView, numberOfRowsInSection: section)
        }
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 && indexPath.row == 2 {
            return 217
        } else {
            return super.tableView(tableView, heightForRowAt: indexPath)
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        dueDateLabel.resignFirstResponder()
        if indexPath.section == 0 && indexPath.row == 1 {
            if !datePickerVisible {
                showDatePicker()
            } else {
                hideDatePicker()
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        if indexPath.section == 0 && indexPath.row == 1 {
            return indexPath
        } else {
            return nil
        }
    }
    
    override func tableView(_ tableView: UITableView, indentationLevelForRowAt indexPath: IndexPath) -> Int {
        var newIndexPath = indexPath
        if indexPath.section == 0 && indexPath.row == 2 {
            newIndexPath = IndexPath(row: 0, section: indexPath.section)
        }
        return super.tableView(tableView, indentationLevelForRowAt: newIndexPath)
    }
    
    func updateDueDateLabel() {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        dueDateLabel.text = formatter.string(from: dueDate)
    }
    
    @IBAction func dateChanged(_ sender: UIDatePicker) {
        dueDate = datePicker.date
        updateDueDateLabel()
    }
    
    func hideDatePicker() {
        if datePickerVisible == true {
            datePickerVisible = false
            let indexPathDateRow = IndexPath(row: 1, section: 0)
            let indexPathDatePicker = IndexPath(row: 2, section: 0)
            if let cell = tableView.cellForRow(at: indexPathDateRow) {
                cell.detailTextLabel!.textColor = UIColor.black
            }
            tableView.beginUpdates()
            tableView.reloadRows(at: [indexPathDateRow], with: .none)
            tableView.deleteRows(at: [indexPathDatePicker], with: .fade)
            tableView.endUpdates()
        }
    }
    
}
