//
//  ViewController.swift
//  Week3
//
//  Created by Eric Reid on 10/13/15.
//  Copyright © 2015 Eric Reid. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var textField: UITextField!

    @IBAction func update(sender: AnyObject) {
        nameLabel.text = textField.text
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

