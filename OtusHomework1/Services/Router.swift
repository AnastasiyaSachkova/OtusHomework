//
//  Router.swift
//  OtusHomework1
//
//  Created by 7Winds on 14/10/2019.
//  Copyright © 2019 Anastasiya Sachkova. All rights reserved.
//

import Foundation
import UIKit

class Router {
    static let shared = Router()
    
    
    func routToProfile(index: Int, text: String?) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        guard let window = appDelegate.window else { return}
        let tb = Initial.tabBarVC
        tb.selectedIndex = index
        
        let nc = tb.viewControllers?[index] as! UINavigationController
        if nc.topViewController is ProfileViewController {
            let vc = nc.topViewController as? ProfileViewController
            vc?.sharedText = text
        }
        
        window.rootViewController = tb
        window.makeKeyAndVisible()
    }
    
    func routToDataStructures(vc: UIViewController) {
        if let window = UIApplication.shared.windows.first {
            window.rootViewController?.present(vc, animated: true, completion: nil)
        }
    }
}
