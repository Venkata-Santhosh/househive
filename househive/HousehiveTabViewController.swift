//
//  HousehiveTabViewController.swift
//  househive
//
//  Created by Piduri Venkata Santhosh on 4/16/17.
//  Copyright © 2017 Piduri Venkata Santhosh. All rights reserved.
//

import UIKit

class HouseHiveTabViewController : UITabBarController{
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        self.tabBar.tintColor = UIColor.redColor()
        self.tabBar.barTintColor = UIColor.whiteColor()
      
    }
    
}
