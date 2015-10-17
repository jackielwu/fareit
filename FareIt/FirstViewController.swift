//
//  FirstViewController.swift
//  FareIt
//
//  Created by Richard Ju on 10/17/15.
//  Copyright © 2015 FareIt. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit

class FirstViewController: UIViewController, FBSDKLoginButtonDelegate {
    @IBOutlet weak var facebookConnect: UIButton!
    @IBOutlet weak var googleConnect: UIButton!
    @IBOutlet weak var indivList: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (FBSDKAccessToken.currentAccessToken() == nil) {
            print("Not logged in.")
        } else {
        print("Logged in.")
        }
        
        var loginButton = FBSDKLoginButton()
        loginButton.readPermissions = ["public_profile", "email", "user_friends"]
        loginButton.center = self.view.center
        loginButton.delegate = self
        
        self.view.addSubview(loginButton)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Facebook Login
    
    func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!) {
        if error == nil {
            print("Login complete.")
        } else {
            print(error.localizedDescription)
        }
    }
    
    func loginButtonDidLogOut(loginButton: FBSDKLoginButton!) {
        print("User logged out...")
    }

}

