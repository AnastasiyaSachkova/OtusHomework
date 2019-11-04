//
//  UICollectionViewCell+Extension.swift
//  OtusHomework1
//
//  Created by 7Winds on 24.10.2019.
//  Copyright © 2019 Anastasiya Sachkova. All rights reserved.
//

import Foundation
import UIKit

extension UICollectionViewCell {
    
    static var nib: UINib {
           return UINib(nibName: identifier, bundle: nil)
       }
       
       static var identifier: String {
           return String(describing: self)
       }
}
