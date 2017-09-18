//
//  SignUpViewController.swift
//  househive
//
//  Created by Piduri Venkata Santhosh on 4/16/17.
//  Copyright © 2017 Piduri Venkata Santhosh. All rights reserved.
//

import UIKit
import FirebaseAuth
import SwiftKeychainWrapper

class SignUpViewController: UIViewController {
    
    @IBOutlet var userNameField: UITextField!
    @IBOutlet var emailField: UITextField!
    @IBOutlet var passwordField: UITextField!
    @IBOutlet var phonenumberField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func userTappedBackground(sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    @IBAction func signUpBtnTapped(sender: UIButton) {
        
        if let userName = userNameField.text, let email = emailField.text, let password = passwordField.text, let phonenumber = phonenumberField.text {
            
            if userName.characters.count > 0 && email.characters.count > 0 && password.characters.count > 0 && phonenumber.characters.count > 0 {
                FIRAuth.auth()?.createUserWithEmail(email, password: password, completion: { (user, error) in
                    if error != nil {
                        if let errorCode = FIRAuthErrorCode(rawValue: error!.code){
                            
                            switch (errorCode) {
                            case .ErrorCodeEmailAlreadyInUse, .ErrorCodeAccountExistsWithDifferentCredential:
                                let alert = UIAlertController(title: "Email already in use", message: "create with different email or click on reset password", preferredStyle: .Alert)
                                alert.addAction(UIAlertAction(title: "OK", style: .Cancel, handler: nil))
                                self.presentViewController(alert, animated: true, completion: nil)
                                break
                            default:
                                let alert = UIAlertController(title: "Please try again", message: "Something went wrong", preferredStyle: .Alert)
                                alert.addAction(UIAlertAction(title: "OK", style: .Cancel, handler: nil))
                                self.presentViewController(alert, animated: true, completion: nil)
                                break
                            }
                        }
                    
                    }else{
                        if user?.uid != nil {
                            
                            let userData : Dictionary<String,String> = ["username":userName, "phonenumber":phonenumber]
                            
                            FirebaseDataService.instance.createFirebaseDatabaseUser((user?.uid)!, userData: userData)
                            
                            FIRAuth.auth()?.signInWithEmail(email, password: password, completion: { (user, error) in
                                if error != nil {
                                    if let errorCode = FIRAuthErrorCode(rawValue: error!.code){
                                        
                                        switch (errorCode) {
                                        case .ErrorCodeUserNotFound:
                                            let alert = UIAlertController(title: "User Not Found", message: "Create account by clicking on signup button", preferredStyle: .Alert)
                                            alert.addAction(UIAlertAction(title: "OK", style: .Cancel, handler: nil))
                                            self.presentViewController(alert, animated: true, completion: nil)
                                            break
                                        case .ErrorCodeWrongPassword:
                                            let alert = UIAlertController(title: "Wrong password", message: "must enter valid password", preferredStyle: .Alert)
                                            alert.addAction(UIAlertAction(title: "OK", style: .Cancel, handler: nil))
                                            self.presentViewController(alert, animated: true, completion: nil)
                                            break
                                        case .ErrorCodeEmailAlreadyInUse, .ErrorCodeAccountExistsWithDifferentCredential:
                                            let alert = UIAlertController(title: "Email already in use", message: "create with different email or click on reset password", preferredStyle: .Alert)
                                            alert.addAction(UIAlertAction(title: "OK", style: .Cancel, handler: nil))
                                            self.presentViewController(alert, animated: true, completion: nil)
                                            break
                                        default:
                                            break
                                        }
                                    }
                                }else{
                                    print("user authentedacet with firebase")
                                    self.performSegueWithIdentifier("signuptohome", sender: self)
                                }
                            })
                        }
                    }
                })
  
            }else{
                let alert = UIAlertController(title: "All fields are required", message: "must enter username, password, email, and phonenumber", preferredStyle: .Alert)
                alert.addAction(UIAlertAction(title: "OK", style: .Cancel, handler: nil))
                presentViewController(alert, animated: true, completion: nil)
            }
        }
    }
}
