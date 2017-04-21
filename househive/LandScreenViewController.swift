//
//  LandScreenViewController.swift
//  househive
//
//  Created by Piduri Venkata Santhosh on 4/16/17.
//  Copyright © 2017 Piduri Venkata Santhosh. All rights reserved.
//

import UIKit

class LandScreenViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewDidAppear(animated: Bool) {
        self.performSegueWithIdentifier("landtologinview", sender: self)
    }
    
}
