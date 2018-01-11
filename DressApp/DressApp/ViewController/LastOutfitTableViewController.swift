//
//  LastOutfitTableViewController.swift
//  DressApp
//
//  Created by Gian Marco Orlando on 21/12/17.
//  Copyright © 2017 Checkmate Team. All rights reserved.
//

import UIKit

class LastOutfitTableViewController: UITableViewController {
    @IBOutlet weak var todayDateLabel: UILabel!
    @IBOutlet weak var yesterdayDateLabel: UILabel!
    let date = Date()
    let yesterdayDate = Date().yesterday
    let formatter = DateFormatter()
    @IBOutlet weak var yesterdayImageView: UIImageView!
    @IBOutlet weak var todayImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        formatter.dateFormat = "dd/MM/yyyy"
        let result = formatter.string(from: date)
        let yesterdayResult = formatter.string(from: yesterdayDate)
        todayDateLabel.text = result
        yesterdayDateLabel.text = yesterdayResult
        if User.shared.genre == .male {
            todayImageView.image = #imageLiteral(resourceName: "SweatersMan")
            yesterdayImageView.image = #imageLiteral(resourceName: "TShirtMan")
        }
        else {
            todayImageView.image = #imageLiteral(resourceName: "TShirtWoman")
            yesterdayImageView.image = #imageLiteral(resourceName: "FemminaElegant")
        }
        
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
}

extension Date {
    var yesterday: Date {
        return Calendar.current.date(byAdding: .day, value: -1, to: noon)!
    }
    var tomorrow: Date {
        return Calendar.current.date(byAdding: .day, value: 1, to: noon)!
    }
    var noon: Date {
        return Calendar.current.date(bySettingHour: 12, minute: 0, second: 0, of: self)!
    }
    var month: Int {
        return Calendar.current.component(.month,  from: self)
    }
    var isLastDayOfMonth: Bool {
        return tomorrow.month != month
    }
}
