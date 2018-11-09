//
//  SettingsControllerTableViewController.swift
//  CSUtils
//
//  Created by Chrystian on 20/10/18.
//

import UIKit

class SettingsControllerTableViewController: UITableViewController {
    
    var settingItens: [Bool]?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return settingItens?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.cellForRow(at: indexPath) as? SwitchSettingsCell else {
            return UITableViewCell()
        }
        
        cell.configure(text: "Texxxxxtanto")
        return cell
    }
}
