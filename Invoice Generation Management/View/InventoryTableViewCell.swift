//
//  InventoryTableViewCell.swift
//  Invoice Generation Management
//
//  Created by HARSHIT JINDAL on 26/11/19.
//  Copyright © 2019 HARSHIT JINDAL. All rights reserved.
//

import UIKit

class InventoryTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateCell(name: String = "", qty: Int = 0) {
        inventoryItemOutlet.text = name
        inventoryItemQty.text = String(qty)
    }

    @IBOutlet weak var inventoryItemOutlet: UILabel!
    @IBOutlet weak var inventoryItemQty: UILabel!
    
}
