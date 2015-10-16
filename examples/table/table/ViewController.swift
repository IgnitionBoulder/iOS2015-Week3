//
//  ViewController.swift
//  table
//
//  Created by Eric Reid on 10/15/15.
//  Copyright © 2015 Eric Reid. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var studentList = [Student]()

    override func viewDidLoad() {
        super.viewDidLoad()

        studentList.append(Student(name: "Spark Student"))
        studentList.append(Student(name: "Another Student"))
        studentList.append(Student(name: "Mickey Mouse"))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 5
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return studentList.count
    }

    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "First"
        case 1:
            return "Second"
        default:
            return nil
        }
    }

    func tableView(tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        switch section {
        case 4:
            return "Last Section"
        default:
            return nil
        }
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)

        let row = indexPath.row
        let student = studentList[row]

        cell.textLabel?.text = student.name

        return cell
    }
}

