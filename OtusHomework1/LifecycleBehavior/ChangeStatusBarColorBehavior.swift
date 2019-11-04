//
//  ChangeStatusBarColorBehavior.swift
//  OtusHomework1
//
//  Created by MacMini Elis on 24/09/2019.
//  Copyright © 2019 Anastasiya Sachkova. All rights reserved.
//

import Foundation
import UIKit

class ChangeStatusBarColorBehavior: LifecycleBehaviorProtocol {
    private let statusBar = UIApplication.shared.value(forKey: "statusBar")
    private var isDefaultStyle = false
    
//    var preferredStatusBarStyle : UIStatusBarStyle {
//        return isDefaultStyle ? .default : .lightContent
//    }
    
     func beforeAppearing(_ viewController: UIViewController) {
       // isDefaultStyle = true

        if let bar = statusBar as? UIView {
            bar.backgroundColor = .magenta
        }
    }
    
     func beforeDisappearing(_ viewController: UIViewController) {
       // isDefaultStyle = false

        if let bar = statusBar as? UIView {
            bar.backgroundColor = .clear
        }
    }
}
