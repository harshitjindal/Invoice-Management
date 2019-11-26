//
//  ViewController.swift
//  Invoice Generation Management
//
//  Created by HARSHIT JINDAL on 25/11/19.
//  Copyright © 2019 HARSHIT JINDAL. All rights reserved.
//

import UIKit

class InventoryViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let inventoryCell = tableView.dequeueReusableCell(withIdentifier: "inventoryCell", for: indexPath)
//        inventoryCell.textLabel?.text = categories?[indexPath.row].name ?? "No Categories Added"
        inventoryCell.accessoryType = .disclosureIndicator
        return inventoryCell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

