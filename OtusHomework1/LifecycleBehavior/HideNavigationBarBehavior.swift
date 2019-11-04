//
//  HideNavigationBarBehavior.swift
//  OtusHomework1
//
//  Created by MacMini Elis on 24/09/2019.
//  Copyright © 2019 Anastasiya Sachkova. All rights reserved.
//

import Foundation
import UIKit

struct HideNavigationBarBehavior: LifecycleBehaviorProtocol {
    func beforeAppearing(_ viewController: UIViewController) {
        viewController.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    func beforeDisappearing(_ viewController: UIViewController) {
        viewController.navigationController?.setNavigationBarHidden(false, animated: true)
    }
}

