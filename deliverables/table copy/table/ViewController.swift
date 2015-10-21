//
//  ViewController.swift
//  table
//
//  Created by Eric Reid on 10/15/15.
//  Copyright © 2015 Eric Reid. All rights reserved.
//

//
//  ViewController.swift
//  table
//
//  Created by Michael Condon on 10/15/15.
//  Copyright © 2015 Michael Condon. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var list = ShoppingList()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let milk = ListItem(name: "milk", quantity: 2)
        let bread = ListItem(name: "bread", quantity: 3)
        let broom = ListItem(name: "broom", quantity: 1)
        let shirt = ListItem(name: "shirt", quantity: 1)
        let mop = ListItem(name: "mop", quantity: 1)
        list.addItem(bread, category: "Grocery")
        list.addItem(shirt, category: "Clothing")
        list.addItem(mop, category: "Household")
        list.addItem(milk, category: "Grocery")
        list.addItem(broom, category: "Household")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 3
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        var numberOfRows = 0
        switch section{
        case 0:
            numberOfRows = (list.items["Grocery"]?.count)!
        case 1:
            numberOfRows = (list.items["Household"]?.count)!
        case 2:
            numberOfRows = (list.items["Clothing"]?.count)!
        default:
            numberOfRows = 0
        }
        return numberOfRows
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section{
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
    
    func tableView(tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        switch section{
        case 4:
            return "last"
        default:
            return nil
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        
        let row = indexPath.row
        var name = String()
        var quantity = Int()
        switch indexPath.section{
        case 0:
            if let names = list.items["Grocery"] {
                let current = names[row]
                name = current.name
                quantity = current.quantity
            }
        case 1:
            if let names = list.items["Household"] {
                let current = names[row]
                name = current.name
                quantity = current.quantity
            }
        case 2:
            if let names = list.items["Clothing"] {
                let current = names[row]
                name = current.name
                quantity = current.quantity
            }
        default:
            name = ""
            quantity = 0
            
        }
        cell.textLabel?.text = name + " Quantity: " + String(quantity)
        
        return cell
    }
}

