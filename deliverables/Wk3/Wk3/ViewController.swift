//
//  ViewController.swift
//  Wk3
//
//  Created by Annie Lydens on 10/19/15.
//  Copyright © 2015 Annie Lydens. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var list = ShoppingList()
    let apple = ListItem(name: "apple", quantity: 2)
    let lemon = ListItem(name: "lemon", quantity: 3)
    let sponge = ListItem(name: "sponge", quantity: 1)
    let dogFood = ListItem(name: "dog food", quantity: 1)
    let shampoo = ListItem(name: "shampoo", quantity: 4)
    let lotion = ListItem(name: "lotion", quantity: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        list.addItem(apple, category: "Grocery")
        list.addItem(lemon, category: "Grocery")
        list.addItem(sponge, category: "Household")
        list.addItem(dogFood, category: "Pet")
        list.addItem(shampoo, category: "Household")
        list.addItem(lotion, category: "Household")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return list.sortedCategories().count
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return list.sortedCategories()[section]
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionTitle = list.sortedCategories()[section]
        return list.sortedList(sectionTitle).count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("item",forIndexPath: indexPath)

        let categoryKey = list.sortedCategories()[indexPath.section]
        let items = list.sortedList(categoryKey)
        cell.textLabel!.text = items[indexPath.row].name
        cell.detailTextLabel!.text = "Quantity: \(String(items[indexPath.row].quantity))"

        return cell
    }

}

