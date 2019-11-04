//
//  LifecycleBehaviorProtocol.swift
//  OtusHomework1
//
//  Created by MacMini Elis on 04/09/2019.
//  Copyright © 2019 Anastasiya Sachkova. All rights reserved.
//

import Foundation
import UIKit


protocol LifecycleBehaviorProtocol {
    
    func afterLoading(_ viewController: UIViewController)
    
    func beforeAppearing(_ viewController: UIViewController)
    
    func afterAppearing(_ viewController: UIViewController)
    
    func beforeDisappearing(_ viewController: UIViewController)
    
    func afterDisappearing(_ viewController: UIViewController)
    
    func beforeLayingOutSubviews(_ viewController: UIViewController)
    
    func afterLayingOutSubviews(_ viewController: UIViewController)
}

extension LifecycleBehaviorProtocol {
    func afterLoading(_ viewController: UIViewController) {}
    
    func beforeAppearing(_ viewController: UIViewController) {}
    
    func afterAppearing(_ viewController: UIViewController) {}
    
    func beforeDisappearing(_ viewController: UIViewController) {}
    
    func afterDisappearing(_ viewController: UIViewController) {}
    
    func beforeLayingOutSubviews(_ viewController: UIViewController) {}
    
    func afterLayingOutSubviews(_ viewController: UIViewController) {}
}
