//
//  FirstCollectionViewCell.swift
//  WBWaterfallFlow
//
//  Created by caowenbo on 16/2/20.
//  Copyright © 2016年 曹文博. All rights reserved.
//

import UIKit

class FirstCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    
    var name:String = ""{
        didSet{
            self.imageView.image = UIImage.init(named:name)
        }
    }


    
}
