//
//  Invoice.swift
//  Invoice Generation Management
//
//  Created by HARSHIT JINDAL on 27/11/19.
//  Copyright © 2019 HARSHIT JINDAL. All rights reserved.
//

import Foundation
import RealmSwift

class Invoice: Object {
    @objc dynamic var invoiceNumber: Int = 0
    @objc dynamic var customerName: String = ""
    dynamic var purchaseItems = List<Inventory>()
}
