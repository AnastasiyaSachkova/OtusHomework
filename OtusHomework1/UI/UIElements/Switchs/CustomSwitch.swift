//
//  CustomSwitch.swift
//  OtusHomework1
//
//  Created by MacMini Elis on 28/08/2019.
//  Copyright © 2019 Anastasiya Sachkova. All rights reserved.
//

import UIKit

class CustomSwitch: UISwitch {
    
    @IBInspectable var thumbColor: UIColor? {
        didSet {
           thumbTintColor = thumbColor
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        didSet {
            layer.borderColor = borderColor?.cgColor
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
}
