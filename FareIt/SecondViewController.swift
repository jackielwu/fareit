//
//  SecondViewController.swift
//  FareIt
//
//  Created by Richard Ju on 10/17/15.
//  Copyright © 2015 FareIt. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    @IBOutlet weak var styDelivery: UIButton!
    @IBOutlet weak var styTakeOut: UIButton!
    @IBOutlet weak var styDineIn: UIButton!
    @IBOutlet weak var gfAlcohol: UIButton!
    @IBOutlet weak var gfGroups: UIButton!
    @IBOutlet weak var gfKids: UIButton!
    @IBOutlet weak var priceFour: UIButton!
    @IBOutlet weak var priceThree: UIButton!
    @IBOutlet weak var priceTwo: UIButton!
    @IBOutlet weak var priceOne: UIButton!
    @IBOutlet weak var commonDistanceGroup: UIView!
    @IBAction func bikeSelected(sender: UIButton) {
        distancePref.text = "5 mi"
        distancePrefAdjuster.value = 5
    }
    @IBAction func driveSelected(sender: UIButton) {
        distancePref.text = "15 mi"
        distancePrefAdjuster.value = 15
    }
    @IBAction func walkSelected(sender: UIButton) {
        distancePref.text = "1 mi"
        distancePrefAdjuster.value = 1
    }
    
    @IBOutlet weak var BikeDistance: UIButton!
    @IBOutlet weak var DriveDistance: UIButton!
    @IBOutlet weak var walkDistance: UIButton!
    
    @IBAction func distPrefValChanged(sender: UIStepper) {
        
        distancePref.text = Int(sender.value).description + " mi"
    }
    
    @IBOutlet weak var distancePref: UITextField!
    @IBOutlet weak var distancePrefAdjuster: UIStepper!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        distancePrefAdjuster.wraps = true
        distancePrefAdjuster.autorepeat = true
        distancePrefAdjuster.maximumValue = 30
        distancePrefAdjuster.minimumValue = 1
        distancePrefAdjuster.layer.cornerRadius = 10
        
        walkDistance.layer.cornerRadius = 10
        DriveDistance.layer.cornerRadius = 10
        priceOne.layer.cornerRadius = 10
        priceFour.layer.cornerRadius = 10
        
        commonDistanceGroup.layer.cornerRadius = 10
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

