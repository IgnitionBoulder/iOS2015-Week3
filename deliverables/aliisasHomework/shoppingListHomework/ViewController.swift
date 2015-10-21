//
//  ViewController.swift
//  shoppingListHomework
//
//  Created by Aliisa Roe on 10/20/15.
//  Copyright © 2015 Aliisa Roe. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    var shoppingList = ShoppingList()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        shoppingList.addItem(ListItem(name: "butter", quantity: 4), category: "kitchen")
        shoppingList.addItem(ListItem(name: "almonds", quantity: 3), category: "kitchen")
        shoppingList.addItem(ListItem(name: "granola", quantity: 9), category: "kitchen")
        shoppingList.addItem(ListItem(name: "towell", quantity: 1), category: "bathroom")
        shoppingList.addItem(ListItem(name: "broom", quantity: 2), category: "household")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
    // list.sortedList(list.sortedcategories[section])
        switch section {
        case 0:
            return shoppingList.sortedList("kitchen").count //I'm not sure if we are supposed to hard code these or not.
        case 1:
            return shoppingList.sortedList("bathroom").count
        case 2:
            return shoppingList.sortedList("household").count
        default:
            return 0
        }
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        //return list.sortedcartegories()[section]
        switch section {
        case 0:
            return "Kitchen"
        case 1:
            return "Bathroom"
        case 2:
            return "Household"
        default:
            return nil
        }
    }

    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        switch indexPath.section {
        case 0:
            let row = indexPath.row
            let item = shoppingList.sortedList("kitchen")[row]
            cell.textLabel?.text = item.name
            cell.detailTextLabel?.text = "Quantity: \(item.quantity)"
        case 1:
            let row = indexPath.row
            let item = shoppingList.sortedList("bathroom")[row]
            cell.textLabel?.text = item.name
            cell.detailTextLabel?.text = "Quantity: \(item.quantity)"
        case 2:
            let row = indexPath.row
            let item = shoppingList.sortedList("household")[row]
            cell.textLabel?.text = item.name
            cell.detailTextLabel?.text = "Quantity: \(item.quantity)"
        default:
            cell.textLabel?.text = "empty"
        }
        return cell
    }

}

