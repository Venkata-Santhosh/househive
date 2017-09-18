//
//  SettingsViewController.swift
//  househive
//
//  Created by Piduri Venkata Santhosh on 4/21/17.
//  Copyright © 2017 Piduri Venkata Santhosh. All rights reserved.
//

import UIKit
import FirebaseAuth

class SettingsViewController : UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func SignOut(sender: UIButton) {
        try! FIRAuth.auth()?.signOut()
        performSegueWithIdentifier("signout", sender: nil)
        
    }
}