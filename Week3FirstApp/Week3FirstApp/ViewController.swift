//
//  ViewController.swift
//  Week3FirstApp
//
//  Created by Adele Bible on 10/19/15.
//  Copyright © 2015 Andrew Candelaresi. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var list = ShoppingList()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        list.addItem(ListItem(name: "bread", quantity: 5 ), category: "Grocery")
        list.addItem(ListItem(name: "watermelon", quantity: 5 ), category: "Grocery")
        list.addItem(ListItem(name: "Shrimp", quantity: 5 ), category: "Grocery")
        list.addItem(ListItem(name: "dress", quantity: 6), category: "Household")
        list.addItem(ListItem(name: "cheese", quantity: 3), category: "Grocery")
        list.addItem(ListItem(name: "spoon", quantity: 1), category: "Household")
        list.addItem(ListItem(name: "cups", quantity: 1), category: "Household")
        list.addItem(ListItem(name: "carrots", quantity: 5), category: "Grocery")
        list.addItem(ListItem(name: "cheese", quantity: 2), category: "Grocery")
        list.addItem(ListItem(name: "gas", quantity: 80), category: "Auto")
        list.addItem(ListItem(name: "blood of Christ", quantity: 4), category: "Household")
        
        
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return list.items.count
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String?
    {
        return Array(list.items.keys)[section]
        
    
    }
        
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        var cat = Array(list.items.keys)[section]
        return (list.items[cat]?.count)!
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        
        let row = indexPath.row
        let section = indexPath.section
        
        var cat = Array(list.items.keys)[section]
        var litem = list.items[cat]
        var item = litem?[row]
        var name = item!.name
        var quan = item!.quantity
        cell.textLabel?.text = name
        cell.detailTextLabel?.text = "quantity =  \(quan)"
        
        return cell
    }

}

