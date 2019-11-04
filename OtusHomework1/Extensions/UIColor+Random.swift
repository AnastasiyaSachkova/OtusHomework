//
//  UIColor+Random.swift
//  OtusHomework1
//
//  Created by MacMini Elis on 25/09/2019.
//  Copyright © 2019 Anastasiya Sachkova. All rights reserved.
//

import UIKit

extension UIColor {
    static var random: UIColor {
        return UIColor(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1),
            alpha: 0.8
        )
    }
    
}
