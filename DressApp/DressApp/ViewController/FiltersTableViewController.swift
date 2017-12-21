//
//  FiltersTableViewController.swift
//  DressApp
//
//  Created by Gian Marco Orlando on 21/12/17.
//  Copyright © 2017 Checkmate Team. All rights reserved.
//

import UIKit

class FiltersTableViewController: UITableViewController {
    
    @IBOutlet weak var elegantSwitch: UISwitch!
    @IBOutlet weak var coldSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        elegantSwitch.isOn = Wardrobe.shared.chooseElegant
        coldSwitch.isOn = Wardrobe.shared.chooseCold
    }
    @IBAction func cold(_ sender: Any) {
        Wardrobe.shared.chooseCold = !Wardrobe.shared.chooseCold
    }
    
    @IBAction func elegant(_ sender: Any) {
        Wardrobe.shared.chooseElegant = !Wardrobe.shared.chooseElegant
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
        return 2
    }
    
    @IBAction func saveFilters(_ sender: UIBarButtonItem) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
}
