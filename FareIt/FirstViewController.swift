//
//  FirstViewController.swift
//  FareIt
//
//  Created by Richard Ju on 10/17/15.
//  Copyright © 2015 FareIt. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    @IBOutlet weak var facebookConnect: UIButton!
    @IBOutlet weak var googleConnect: UIButton!
    @IBOutlet weak var indivList: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        facebookConnect.layer.cornerRadius = 10
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

