//
//  UserDetails.swift
//  househive
//
//  Created by Piduri Venkata Santhosh on 4/21/17.
//  Copyright © 2017 Piduri Venkata Santhosh. All rights reserved.
//

import Foundation

class UserDetails {
    
    private var _userName : String
    private var _emailId: String
    private var _address: Address
    
    init(userName: String, emailId: String, address:Address){
        _userName = userName
        _emailId = emailId
        _address = address
    }
    
    var userName : String? {
        return _userName
    }
    var emailId: String? {
        return _emailId
    }
    var address : Address?{
        return _address
    }
}
