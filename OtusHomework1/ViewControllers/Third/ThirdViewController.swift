//
//  ThirdViewController.swift
//  OtusHomework1
//
//  Created by MacMini Elis on 24/09/2019.
//  Copyright © 2019 Anastasiya Sachkova. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func toFeedVC(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
        
//        if let controllers = navigationController?.viewControllers {
//            let newStack = controllers.filter {!($0 is FeedVC)}
//            navigationController?.setViewControllers(newStack, animated: true)
//        }
    }
}
