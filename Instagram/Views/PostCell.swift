//
//  PostCell.swift
//  Instagram
//
//  Created by Jinan Huang on 9/25/18.
//  Copyright © 2018 Jinan Huang. All rights reserved.
//

import UIKit

import Parse
import ParseUI
import AlamofireImage


class PostCell: UICollectionViewCell {

    @IBOutlet weak var postImageView: PFImageView!

    
    var post: PFObject! {
        didSet {

            
            self.postImageView.file = post["image"] as? PFFile
            self.postImageView.loadInBackground()

        }
    }
    
    
}
