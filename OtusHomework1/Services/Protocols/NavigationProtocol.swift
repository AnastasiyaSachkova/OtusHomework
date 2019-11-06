//
//  NavigationProtocol.swift
//  OtusHomework1
//
//  Created by 7Winds on 14/10/2019.
//  Copyright © 2019 Anastasiya Sachkova. All rights reserved.
//

import Foundation
import UIKit

protocol NavigationProtocol {
    var topVC: UIViewController? { get }
    func presentOrPush(vc: UIViewController, removeCurrent: Bool, animated: Bool, removeCount: Int, _ completion: (() -> ())?)

}

extension NavigationProtocol where Self: UIResponder {
    var topVC: UIViewController? {
        get { return UIApplication.topViewController() }
    }
    
    func presentOrPush(vc: UIViewController, removeCurrent: Bool = false, animated: Bool = true, removeCount: Int = 2, _ completion: (() -> ())? = nil) {
        if let topVC = topVC{
            if topVC.isModal{
                topVC.present(vc, animated: animated, completion: completion)
            } else {
                topVC.navigationController?.pushViewController(vc, animated: animated)
                guard removeCurrent, let count = topVC.navigationController?.viewControllers.count, count >= removeCount else { return }
                topVC.navigationController?.viewControllers.remove(at: count - removeCount)
            }
        }
    }
}
