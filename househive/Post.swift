//
//  Post.swift
//  househive
//
//  Created by Piduri Venkata Santhosh on 4/21/17.
//  Copyright © 2017 Piduri Venkata Santhosh. All rights reserved.
//

import Foundation

class Post {
    private var _landMark : String
    private var _description : String
    private var _price : Float
    private var _address : Address
    private var _houseOwner : UserDetails
    
    init(landMark : String, description : String, price : Float, address: Address, houseOwner: UserDetails){
        _landMark = landMark
        _description = description
        _price = price
        _address = address
        _houseOwner = houseOwner
    }
    
    var landMark : String? {
        return _landMark
    }
    var description : String? {
        return _description
    }
    var price : Float? {
        return _price
    }
    var address : Address?{
        return _address
    }
    var houseOwner : UserDetails?{
        return _houseOwner
    }
    
}