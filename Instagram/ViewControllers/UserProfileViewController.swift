//
//  ViewController.swift
//  Instagram
//
//  Created by Jinan Huang on 9/23/18.
//  Copyright © 2018 Jinan Huang. All rights reserved.
//

import UIKit

import Parse

class UserProfileViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "My profile"
        
        if let navigationBar = navigationController?.navigationBar {
            navigationBar.tintColor = UIColor(red: 1.0, green: 0.25, blue: 0.25, alpha: 0.8)
            
            let shadow = NSShadow()
            shadow.shadowColor = UIColor.gray.withAlphaComponent(0.5)
            shadow.shadowOffset = CGSize(width: 2, height: 2)
            
            shadow.shadowBlurRadius = 4
            
            navigationBar.titleTextAttributes = [
                NSAttributedStringKey.font : UIFont.boldSystemFont(ofSize: 22),
                NSAttributedStringKey.foregroundColor : UIColor(red: 0.5, green: 0.15, blue: 0.15, alpha: 0.8),
                NSAttributedStringKey.shadow : shadow
            ]
        }
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(logout))
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func logout() -> Void {
        PFUser.logOut()
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "UserDidLogOut"), object: nil)
    }
}


