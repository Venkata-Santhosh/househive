//
//  Address.swift
//  househive
//
//  Created by Piduri Venkata Santhosh on 4/21/17.
//  Copyright © 2017 Piduri Venkata Santhosh. All rights reserved.
//

import Foundation

class Address {
    private var _streetName : String
    private var _city : String
    private var _country : String
    private var _pinCode : Int
    
    init(streetName : String, city : String, country : String, pinCode: Int){
        _streetName = streetName
        _city = city
        _country = country
        _pinCode = pinCode
    }
    
    var streetName : String? {
        return _streetName
    }
    var city : String? {
        return _city
    }
    var country : String?{
        return _country
    }
    var pinCode : Int? {
        return _pinCode
    }
    
}