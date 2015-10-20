//
//  ViewController.swift
//  Shopping List
//
//  Created by Krizia Conrad on 10/15/15.
//  Copyright © 2015 Krizia Conrad. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var shoppingList = ShoppingList()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        shoppingList.addItem(ListItem(name: "Bread", quantity: 1), category: "Grocery")
        shoppingList.addItem(ListItem(name: "Lamp", quantity: 2), category: "Household")
        shoppingList.addItem(ListItem(name: "Pants", quantity: 3), category: "Clothing")
        shoppingList.addItem(ListItem(name: "Eggs", quantity: 1), category: "Grocery")
        shoppingList.addItem(ListItem(name: "Socks", quantity: 2), category: "Clothing")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return shoppingList.items.count
        switch section {
        case 0:
            return shoppingList.sortedList("Grocery").count
        case 1:
            return shoppingList.sortedList("Household").count
        case 2:
            return shoppingList.sortedList("Clothing").count
        default:
            return Int(0)
        }
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Grocery"
        case 1:
            return "Household"
        case 2:
            return "Clothing"
        default:
            return nil
        }
    }
    
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        
//        let row = indexPath.row
        let section = indexPath.indexAtPosition(0)
        let itemInSection = indexPath.indexAtPosition(1)
//        var listItem = shoppingList.sortedList("Grocery")[row]
        var listItem = ListItem.self
        
        func getListItem(section: Int, itemInSection: Int) -> ListItem {
            switch section {
            case 0:
                return shoppingList.sortedList("Grocery")[itemInSection]
            case 1:
                return shoppingList.sortedList("Household")[itemInSection]
            case 2:
                return shoppingList.sortedList("Clothing")[itemInSection]
            default:
                return ListItem(name: "Error", quantity: 1)
            }
        }
        
        cell.textLabel?.text = getListItem(section , itemInSection: itemInSection).name
        return cell
    }
    
}

