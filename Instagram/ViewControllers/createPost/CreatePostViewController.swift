//
//  CreatePostViewController.swift
//  Instagram
//
//  Created by Jinan Huang on 9/25/18.
//  Copyright © 2018 Jinan Huang. All rights reserved.
//

import UIKit

class CreatePostViewController: UIViewController {
    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var captionTextField: UITextField!
    @IBOutlet weak var acitivityIndicator: UIActivityIndicatorView!
    
    var postImage: UIImage?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        postImageView.image = postImage
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Post", style: .plain, target: self, action: #selector(upload))
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func upload() -> Void {
        acitivityIndicator.startAnimating()
        
        Post.postUserImage(image: postImage,
                           withCaption: captionTextField.text,
                           withCompletion: { (success: Bool, error: Error?) -> Void in
                            DispatchQueue.main.async {
                                self.postImageView.image = nil
                                self.captionTextField.text = nil
                                //self.acitivityIndicatoracitivityIndicator.stopAnimating()
                            }}
        )
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}

