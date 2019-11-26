//
//  Inventory.swift
//  Invoice Generation Management
//
//  Created by HARSHIT JINDAL on 26/11/19.
//  Copyright © 2019 HARSHIT JINDAL. All rights reserved.
//

import Foundation
import RealmSwift

class Inventory: Object {
    @objc dynamic var name: String = ""
    @objc dynamic var qty: Int = 0
    @objc dynamic var price: Int = 0
}
