//
//  ListItem.swift
//  week3_solution
//
//  Created by Eric Reid on 10/15/15.
//  Copyright © 2015 Eric Reid. All rights reserved.
//

import Foundation

struct ListItem {
    let name: String
    var quantity: Double
    init(name: String, quantity: Double) {
        self.name = name
        self.quantity = quantity
    }
}