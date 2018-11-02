//
//  LoginViewController.swift
//  Instagram
//
//  Created by Jinan Huang on 9/25/18.
//  Copyright © 2018 Jinan Huang. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {
    
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func displayEmptyAlert(){
        let alertController = UIAlertController(title: "Empty Username or Password", message: "Please enter your username and password", preferredStyle: .alert)
        
        // create an OK action
        let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
            // handle response here.
        }
        // add the OK action to the alert controller
        alertController.addAction(OKAction)
        
        DispatchQueue.main.async {
            self.present(alertController, animated: true, completion: nil)
        }
    }
    
    func displayExistAlert(){
        let alertController = UIAlertController(title: "User already existed", message: "Please enter a valid username", preferredStyle: .alert)
        
        // create an OK action
        let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
            // handle response here.
        }
        // add the OK action to the alert controller
        alertController.addAction(OKAction)
        
        DispatchQueue.main.async {
            self.present(alertController, animated: true, completion: nil)
        }
    }
    
    @IBAction func onSignIn(_ sender: Any) {
        let username = usernameField.text ?? ""
        let password = passwordField.text ?? ""
        
        
        PFUser.logInWithUsername(inBackground: usernameField.text!, password: passwordField.text!) { (user: PFUser?, error: Error?) in
            if let error = error {
                if username.isEmpty || password.isEmpty{
                    self.displayEmptyAlert()
                }
                print("User log in failed: \(error.localizedDescription)")
            } else {
                print("User logged in successfully")
                // display view controller that needs to shown after successful login
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            }
        }
    }
    
    @IBAction func onSignUp(_ sender: Any) {
        let newUser = PFUser()
        
        newUser.username = usernameField.text
        newUser.password = passwordField.text
        
        newUser.signUpInBackground { (success: Bool, error: Error?) in
            if let error = error {
                if (newUser.username?.isEmpty)! || (newUser.password?.isEmpty)!{
                    self.displayEmptyAlert()
                }
                switch error._code{
                case 202:
                    self.displayExistAlert()
                    break
                    
                default:
                    break
                }
                print("User register failed: \(error.localizedDescription)")
            } else {
                print("User Registered successfully")
                // manually segue to logged in view
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
                
            }
        }
    }
    
    
}


