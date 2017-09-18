//
//  FirebaseDataServices.swift
//  househive
//
//  Created by Piduri Venkata Santhosh on 4/21/17.
//  Copyright © 2017 Piduri Venkata Santhosh. All rights reserved.
//

import Foundation
import FirebaseDatabase

let DATABASE_SERVICE_BASE_REF = FIRDatabase.database().reference()

class FirebaseDataService {
    
    static let instance = FirebaseDataService()
    
    private var _BASE_REF = DATABASE_SERVICE_BASE_REF
    private var _USER_REF = DATABASE_SERVICE_BASE_REF.child(USERS)
    private var _POSTS_REF = DATABASE_SERVICE_BASE_REF.child(POSTS)
    private var _ADDRESSES_REF = DATABASE_SERVICE_BASE_REF.child(ADDRESSES)

    
    var BASE_REF : FIRDatabaseReference {
        return _BASE_REF
    }
    
    var USER_REF : FIRDatabaseReference {
        return _USER_REF
    }
    
    var POSTS_REF : FIRDatabaseReference {
        return _POSTS_REF
    }
    
    var ADDRESSES_REF : FIRDatabaseReference {
        return _ADDRESSES_REF
    }
    
    func createFirebaseDatabaseUser(uid : String, userData: Dictionary<String,AnyObject>) {
        
        let key = ADDRESSES_REF.childByAutoId().key
        
        let address = [ "city" : "Syracuse",
                        "country" : "United States",
                        "pincode" : 13210,
                        "state" : "New York",
                        "street-name" : "830 Lancaster"]
        let childUpdates = ["/addresses/\(key)" : address,
                            "/users/\(uid)/addresses":key]
        
        BASE_REF.updateChildValues(childUpdates as [NSObject : AnyObject])
    }
    
    func retrieveUserInformation(uid: String){
       
    }
}