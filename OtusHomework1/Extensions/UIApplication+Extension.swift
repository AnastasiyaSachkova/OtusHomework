//
//  UIApplication+Extension.swift
//  OtusHomework1
//
//  Created by 7Winds on 14/10/2019.
//  Copyright © 2019 Anastasiya Sachkova. All rights reserved.
//

import Foundation
import UIKit

extension UIApplication {
    
    class func topViewController(controller: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let navigationController = controller as? UINavigationController {
            return topViewController(controller: navigationController.visibleViewController)
        }
        if let tabController = controller as? UITabBarController {
            if let selected = tabController.selectedViewController {
                return topViewController(controller: selected)
            }
        }
        if let presented = controller?.presentedViewController {
            return topViewController(controller: presented)
        }
        return controller
    }
}
