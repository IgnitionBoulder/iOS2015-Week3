//
//  ViewController.swift
//  Table
//
//  Created by Annie Lydens on 10/15/15.
//  Copyright © 2015 Annie Lydens. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var studentList = [Student]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        studentList.append(Student(name: "bob"))
        studentList.append(Student(name: "john"))
        studentList.append(Student(name: "rick"))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 5
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "First"
        case 1:
            return "Second"
        default:
            return "Extra"
        }
    }
    
    func tableView(tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        switch section {
        case 4:
            return "Last section"
        default:
            return nil
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return studentList.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        
        let row = indexPath.row
        let student = studentList[row]
        cell.textLabel?.text = student.name
        return cell
    }

}

