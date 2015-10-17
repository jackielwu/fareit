//
//  SecondViewController.swift
//  FareIt
//
//  Created by Richard Ju on 10/17/15.
//  Copyright © 2015 FareIt. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    @IBAction func bikeSelected(sender: UIButton) {
        distancePref.text = "5"
        distancePrefAdjuster.value = 5
    }
    @IBAction func driveSelected(sender: UIButton) {
        distancePref.text = "15"
        distancePrefAdjuster.value = 15
    }
    @IBAction func walkSelected(sender: UIButton) {
        distancePref.text = "1"
        distancePrefAdjuster.value = 1
    }
    
    @IBOutlet weak var BikeDistance: UIButton!
    @IBOutlet weak var DriveDistance: UIButton!
    @IBOutlet weak var walkDistance: UIButton!
    
    @IBAction func distPrefValChanged(sender: UIStepper) {
        
        distancePref.text = Int(sender.value).description
    }
    
    @IBOutlet weak var distancePref: UITextField!
    @IBOutlet weak var distancePrefAdjuster: UIStepper!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        distancePrefAdjuster.wraps = true
        distancePrefAdjuster.autorepeat = true
        distancePrefAdjuster.maximumValue = 30
        distancePrefAdjuster.minimumValue = 0.5
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

