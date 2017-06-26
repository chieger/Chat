//
//  ViewController.swift
//  parse_demo_01
//
//  Created by Charles Hieger on 6/25/17.
//  Copyright © 2017 Charles Hieger. All rights reserved.
//

import UIKit
import Parse

class ViewController: UIViewController {


   @IBOutlet weak var usernameField: UITextField!
   @IBOutlet weak var passwordField: UITextField!


   override func viewDidLoad() {
      super.viewDidLoad()

      

   }

   @IBAction func didTapSignUp(_ sender: Any) {
      print("Did press sign up")
      if usernameField.text!.isEmpty || passwordField.text!.isEmpty {
         // Show alert
      } else {
         // Sign up new user
         let user = PFUser()
         user.username = usernameField.text
         user.password = passwordField.text
         user.signUpInBackground(block: { (success, error) in
            if let error = error {
               print("🛑 Error signing up: \(error.localizedDescription)")
            } else {
               print("👍 User signed up successfully")
               self.performSegue(withIdentifier: "loginSegue", sender: nil)
            }
         })
      }
   }

   @IBAction func didTapLogin(_ sender: Any) {
      print("Did press sign up")
      if usernameField.text!.isEmpty || passwordField.text!.isEmpty {
         // Show alert
      } else {
         PFUser.logInWithUsername(inBackground: usernameField.text!, password: passwordField.text!, block: { (user, error) in
            if let error = error {
               print("🛑 Error logging in: \(error.localizedDescription)")
            } else if let user = user {
               print("👍 User, \(String(describing: user.username)) has logged in successfully")
               self.performSegue(withIdentifier: "loginSegue", sender: nil)
            }
         })
      }
   }


   override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
      // Dispose of any resources that can be recreated.
   }
   
   
}

