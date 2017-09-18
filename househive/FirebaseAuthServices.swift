//
//  FirebaseAuthServices.swift
//  househive
//
//  Created by Piduri Venkata Santhosh on 4/21/17.
//  Copyright © 2017 Piduri Venkata Santhosh. All rights reserved.
//

import Foundation
import FirebaseAuth


typealias OnComplete = (errorMessage : String? , data: AnyObject? ) -> Void

class FirebaseAuthServices {
    
    private static let firebaseAuthInstance = FirebaseAuthServices()
    
    static var instance : FirebaseAuthServices {
        return firebaseAuthInstance
    }
    
    func login(emailId: String, password: String, onComplete: OnComplete?){
        
        FIRAuth.auth()?.signInWithEmail(emailId, password: password, completion: { (user, error) in
            if error != nil {
                //if let errorCode = FIRAuthErrorCode(rawValue: error!.code){
                // print("\(.errorCodeInvalidEmail)")
                    
               // }
            }else{
                
            }
        })
        
    }
    
}
