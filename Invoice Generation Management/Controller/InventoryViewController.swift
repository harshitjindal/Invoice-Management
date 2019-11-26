//
//  ViewController.swift
//  Invoice Generation Management
//
//  Created by HARSHIT JINDAL on 25/11/19.
//  Copyright © 2019 HARSHIT JINDAL. All rights reserved.
//

import UIKit
import RealmSwift

class InventoryViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let realm = try! Realm()
    
    var inventory: Results<Inventory>?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return inventory?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let inventoryCell = tableView.dequeueReusableCell(withIdentifier: "inventoryCell", for: indexPath) as! InventoryTableViewCell
        inventoryCell.updateCell(name: inventory?[indexPath.row].name ?? "", qty: inventory?[indexPath.row].qty ?? 0)
        inventoryCell.accessoryType = .disclosureIndicator
        return inventoryCell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
//        loadInventory()
    }


}

