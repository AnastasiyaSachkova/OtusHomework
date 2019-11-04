//
//  CustomImageView.swift
//  OtusHomework1
//
//  Created by MacMini Elis on 28/08/2019.
//  Copyright © 2019 Anastasiya Sachkova. All rights reserved.
//

import UIKit

class CustomImageView: UIImageView {
    
    @IBInspectable var img: UIImage? {
        didSet {
            image = img
        }
    }
    
    @IBInspectable var radius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = radius
        }
    }

}
