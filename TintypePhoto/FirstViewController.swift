//
//  FirstViewController.swift
//  TintypePhoto
//
//  Created by Adrian Marszałek on 05/08/16.
//  Copyright © 2016 Adrian Marszałek. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func goToAnotherView(sender: AnyObject) {
        self.performSegueWithIdentifier("AnotherViewController", sender: sender)
    }

}

