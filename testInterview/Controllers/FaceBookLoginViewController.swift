//
//  FaceBookLoginViewController.swift
//  testInterview
//
//  Created by Asanka Gankewala on 6/28/19.
//  Copyright © 2019 Asanka. All rights reserved.
//

import Foundation
import UIKit
import FBSDKCoreKit
import FBSDKShareKit
import FBSDKLoginKit

class FaceBookLoginViewController: UIViewController, LoginButtonDelegate{
    func loginButton(_ loginButton: FBLoginButton, didCompleteWith result: LoginManagerLoginResult?, error: Error?) {
        if ((error) != nil){
            // Process error
        }
        else if (result?.isCancelled)! {
            // Handle cancellations
        }
        else {
            // If you ask for multiple permissions at once, you
            // should check if specific permissions missing
            if (result?.grantedPermissions.contains("email"))!{
                self.performSegue(withIdentifier: "showHomePageSeg", sender: self)
                // Do work
            }
        }
    }
    
    func loginButtonDidLogOut(_ loginButton: FBLoginButton) {
        print("User Logged Out")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if (AccessToken.current != nil) {
            self.performSegue(withIdentifier: "showHomePageSeg", sender: self)
        }
        else {
            let loginView : FBLoginButton = FBLoginButton()
            self.view.addSubview(loginView)
            loginView.center = self.view.center
            loginView.readPermissions = ["public_profile", "email", "user_friends"]
            loginView.delegate = self
        }
    }
}
