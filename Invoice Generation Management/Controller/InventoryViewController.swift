//
//  ViewController.swift
//  Invoice Generation Management
//
//  Created by HARSHIT JINDAL on 25/11/19.
//  Copyright © 2019 HARSHIT JINDAL. All rights reserved.
//

import UIKit
import RealmSwift
import SwipeCellKit

class InventoryViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let realm = try! Realm()
    
    var inventory: Results<Inventory>?
    @IBOutlet weak var tableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return inventory?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let inventoryCell = tableView.dequeueReusableCell(withIdentifier: "inventoryCell", for: indexPath) as! InventoryTableViewCell
        inventoryCell.updateCell(name: inventory?[indexPath.row].name ?? "", qty: inventory?[indexPath.row].qty ?? 0)
        inventoryCell.accessoryType = .detailButton
        return inventoryCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadInventory()
    }
    
    @IBAction func addInventoryItem(_ sender: Any) {
        var itemNameTextField = UITextField()
        var itemQtyTextField = UITextField()
        
        let alert = UIAlertController(title: "Add Inventory Item", message: "Please Enter Item Name and Quantity", preferredStyle: .alert)
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Inventory Item"
            itemNameTextField = alertTextField
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Inventory Quantity"
            itemQtyTextField = alertTextField
        }
        
        let addAction = UIAlertAction(title: "Done", style: .default) { (addAction) in
            let item = Inventory()
            if let textInTextfield = itemNameTextField.text {
                item.name = itemNameTextField.text!
                item.qty = Int(itemQtyTextField.text!) ?? 0
            }
            self.save(inventoryItem: item)
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (cancelAction) in }
        
        alert.addAction(addAction)
        alert.addAction(cancelAction)
        present(alert, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            if let item = inventory?[indexPath.row] {
                do {
                    try realm.write() {
                        realm.delete(item)
                    }
                } catch {
                    print("Error Deleting Realm Object")
                }
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            tableView.reloadData()
        }
    }
    
    func loadInventory() {
        inventory = realm.objects(Inventory.self)
        tableView.reloadData()
    }
    
    func save(inventoryItem: Inventory) {
        do {
            try realm.write {
                realm.add(inventoryItem)
            }
        } catch {
            print("Error saving to Realm: \(error.localizedDescription)")
        }
        tableView.reloadData()
    }
}

