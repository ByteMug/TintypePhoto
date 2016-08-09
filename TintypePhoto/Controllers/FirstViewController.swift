//
//  FirstViewController.swift
//  TintypePhoto
//
//  Created by Adrian Marszałek on 05/08/16.
//  Copyright © 2016 Adrian Marszałek. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {


    @IBOutlet private weak var startButton: UIButton!
    @IBOutlet private weak var aboutButton: UIButton!
    @IBOutlet private weak var exitButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        roundButtonsBorder(startButton, aboutButton, exitButton)
    }

    @IBAction func goToPhotoFilterView(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
        self.performSegueWithIdentifier("PhotoFilterScene", sender: sender)
    }

    @IBAction func closeApplication(sender: UIButton) {
        exit(0)
    }

    private func roundButtonsBorder(buttons: UIButton...) {
        let borderColor = UIColor(red: 76.0 / 255.0, green: 72.0 / 255.0, blue: 73.0 / 255.0, alpha: 1).CGColor as CGColorRef
        for button in buttons {
            button.layer.cornerRadius = 0.1 * button.bounds.size.width
            button.layer.borderColor = borderColor
            button.layer.borderWidth = 2.0
            button.clipsToBounds = true
        }
    }

}

