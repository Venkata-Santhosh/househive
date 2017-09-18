//
//  ViewController.swift
//  househive
//
//  Created by Piduri Venkata Santhosh on 4/16/17.
//  Copyright © 2017 Piduri Venkata Santhosh. All rights reserved.
//

import UIKit
import FirebaseAuth
class SignInViewController: UIViewController {
    
    @IBOutlet var emailField: CustomizedTextFieldView!
    @IBOutlet var passwordField: CustomizedTextFieldView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func userTappedBackground(sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }

    //func alertMessage(alertControllerTitle: String, alertControllerMessage: String, alertController:UIAlertControllerStyle, alertActionTitle: String, alertActionStyle: UIAlertViewStyle,handl) {
        
    //}
    @IBAction func tappedSignInBtn(sender: UIButton) {
        
        if let email = emailField.text, let password = passwordField.text {
            
            if email.characters.count > 0 && password.characters.count > 0 {
                // validations
                FIRAuth.auth()?.signInWithEmail(email, password: password, completion: { (user, error) in
                    if error == nil {
                        // user exists and password are correct
                        print("user authentedacet with firebase")
                        self.performSegueWithIdentifier("signintohome", sender: self)
                    }else{
                        if let errorCode = FIRAuthErrorCode(rawValue: error!.code){
                            
                            switch (errorCode) {
                            case .ErrorCodeUserNotFound:
                                let alert = UIAlertController(title: "User Not Found", message: "Create account by clicking on signup button", preferredStyle: .Alert)
                                alert.addAction(UIAlertAction(title: "OK", style: .Cancel, handler: nil))
                                self.presentViewController(alert, animated: true, completion: nil)
                                break
                            /*case .ErrorCodeInvalidEmail:
                                let alert = UIAlertController(title: "Invalid email", message: "must enter valid email", preferredStyle: .Alert)
                                alert.addAction(UIAlertAction(title: "OK", style: .Cancel, handler: nil))
                                self.presentViewController(alert, animated: true, completion: nil)
                                break*/
                            case .ErrorCodeWrongPassword:
                                let alert = UIAlertController(title: "Wrong password", message: "must enter valid password", preferredStyle: .Alert)
                                alert.addAction(UIAlertAction(title: "OK", style: .Cancel, handler: nil))
                                self.presentViewController(alert, animated: true, completion: nil)
                                break
                                //for creating account
                            case .ErrorCodeEmailAlreadyInUse, .ErrorCodeAccountExistsWithDifferentCredential:
                                let alert = UIAlertController(title: "Email already in use", message: "create with different email or click on reset password", preferredStyle: .Alert)
                                alert.addAction(UIAlertAction(title: "OK", style: .Cancel, handler: nil))
                                self.presentViewController(alert, animated: true, completion: nil)
                                break
                            default:
                                break
                            }
                        }
                        
                    }
                })
 
            }else{
                let alert = UIAlertController(title: "Username and password required", message: "must enter both username and password", preferredStyle: .Alert)
                alert.addAction(UIAlertAction(title: "OK", style: .Cancel, handler: nil))
                presentViewController(alert, animated: true, completion: nil)
        
            }
            
            
        }
        
    }
    
    func retrieveUserInformation(uid: String) {
        
    }
}

