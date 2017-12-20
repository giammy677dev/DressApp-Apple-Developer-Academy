//
//  MeTableViewController.swift
//  DressApp
//
//  Created by Gian Marco Orlando on 15/12/17.
//  Copyright © 2017 Checkmate Team. All rights reserved.
//

import UIKit

class MeTableViewController: UITableViewController {
    @IBOutlet weak var userProfileCell: UITableViewCell!
    @IBOutlet weak var userProfileImageView: UIImageView!
    @IBOutlet weak var userNameCell: UITableViewCell!
    @IBOutlet weak var userAgeCell: UITableViewCell!
    @IBOutlet weak var userGenreCell: UITableViewCell!
    @IBOutlet weak var lastOutfitCell: UITableViewCell!
    @IBOutlet weak var changeSettingsCell: UITableViewCell!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.prefersLargeTitles = true //set large title
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        // Set the image
        self.userProfileImageView.image = User.shared.profilePic()
        self.userProfileImageView.layer.cornerRadius = self.userProfileImageView.frame.size.width / 2;
        userProfileImageView.clipsToBounds = true
        userProfileImageView.layer.borderWidth = 3.0;
        userProfileImageView.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor
        userProfileImageView.layer.borderWidth = 2 // as you wish
        
        // Setting the interaction with the table
        tableView.isScrollEnabled = false
        userProfileCell.isUserInteractionEnabled = false
        userNameCell.isUserInteractionEnabled = false
        userAgeCell.isUserInteractionEnabled = false
        userGenreCell.isUserInteractionEnabled = false
        
        // Setting the end of the table
        tableView.tableFooterView = UIView(frame: .zero)
        
        // Setting the content of the rows
        userNameCell.textLabel?.text = User.shared.name
        userAgeCell.textLabel?.text = User.shared.age.description
        userGenreCell.textLabel?.text = User.shared.genre?.string()
        
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
        return 6
    }
}
