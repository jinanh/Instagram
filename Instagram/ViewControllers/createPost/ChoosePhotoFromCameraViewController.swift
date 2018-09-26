//
//  ChoosePhotoFromCameraViewController.swift
//  Instagram
//
//  Created by Jinan Huang on 9/25/18.
//  Copyright © 2018 Jinan Huang. All rights reserved.
//

import UIKit

import Parse

class ChoosePhotoFromCameraViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    let picker = UIImagePickerController()
    var image = [PFFile]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        // Get the image captured by the UIImagePickerController
        _ = info[UIImagePickerControllerOriginalImage] as! UIImage
        _ = info[UIImagePickerControllerEditedImage] as! UIImage
        
        //        postPhotoLabel.image = editedImage
        // Do something with the images (based on your use case)
        
        // Dismiss UIImagePickerController to go back to your original view controller
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        
        dismiss(animated: true, completion: { () -> Void in
            self.dismiss(animated: false, completion: nil)
            
            self.tabBarController?.selectedIndex = 0
        })
    }
    
    
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
    
    
}

