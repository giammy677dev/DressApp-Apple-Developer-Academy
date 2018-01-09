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
        
        let myCustomViewController: TodayViewController = TodayViewController(nibName: nil, bundle: nil)
        let getThatValue = myCustomViewController.cardView
        
        let swipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(myviewTapped(sender:)))
        swipeGesture.direction = .down
        getThatValue?.addGestureRecognizer(swipeGesture)
        getThatValue?.isUserInteractionEnabled = true
    }
    @IBAction func cold(_ sender: Any) {
        Wardrobe.shared.chooseCold = !Wardrobe.shared.chooseCold
    }
    

    @IBAction func elegant(_ sender: Any) {
        Wardrobe.shared.chooseElegant = !Wardrobe.shared.chooseElegant
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    @IBAction func saveFilters(_ sender: UIBarButtonItem) {
        self.navigationController?.popViewController(animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.tableFooterView = UIView(frame: .zero)
    }
    
    @objc func myviewTapped(sender: UITapGestureRecognizer) {
        print ("tap registrata")
        self.dismiss(animated: true, completion: nil)
        print ("tap registrata")
    }
    
}
