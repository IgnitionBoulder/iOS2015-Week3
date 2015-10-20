//
//  ShoppingList.swift
//  Wk3
//
//  Created by Annie Lydens on 10/19/15.
//  Copyright © 2015 Annie Lydens. All rights reserved.
//

import Foundation

class ShoppingList {
    var items = [String: [ListItem]]()
    
    func addItem(item: ListItem, category: String) {
        var itemsForCategory = items[category]
        if itemsForCategory == nil {
            itemsForCategory = [ListItem]()
        }
        itemsForCategory?.append(item)
        items[category] = itemsForCategory
    }
    
    func sortedList(category: String) -> [ListItem] {
        guard let itemsForCategory = items[category] else {
            return [ListItem]()
        }
        
        return itemsForCategory.sort({ $0.name.compare($1.name) == .OrderedAscending })
    }
    
    func sortedCategories() -> [String] {
        return items.keys.sort()
    }
    
    func categoryFirstLetters() -> [String] {
        var firstLetters = [String]()
        for item in items.keys {
            let firstLetter = String(item.characters.first!).uppercaseString
            if !firstLetters.contains(firstLetter) {
                firstLetters.append(firstLetter)
            }
        }
        
        return firstLetters.sort()
    }
    
    func itemsMatching(searchString: String) -> [ListItem] {
        var matchingItems = [ListItem]()
        for array in items.values {
            for listItem in array {
                if listItem.name.lowercaseString.containsString(searchString.lowercaseString) {
                    matchingItems.append(listItem)
                }
            }
        }
        
        return matchingItems
    }
}