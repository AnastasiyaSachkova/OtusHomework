//
//  CustomButton.swift
//  OtusHomework1
//
//  Created by MacMini Elis on 28/08/2019.
//  Copyright © 2019 Anastasiya Sachkova. All rights reserved.
//

import UIKit

@IBDesignable class CustomButton: UIButton {

   @IBInspectable var bgColor: UIColor? {
        didSet {
           backgroundColor = bgColor
        }
    }
    
    @IBInspectable var radius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = radius
        }
    }
    
   @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
   @IBInspectable var borderColor: UIColor? {
        didSet {
            layer.borderColor = borderColor?.cgColor
        }
    }
    
    @IBInspectable var shadowColor: UIColor? {
        didSet {
            layer.shadowColor = shadowColor?.cgColor
        }
    }
    
    @IBInspectable var shadowOpacity: Float = 0 {
        didSet {
            layer.shadowOpacity = shadowOpacity
        }
    }

}
