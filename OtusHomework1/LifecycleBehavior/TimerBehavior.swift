//
//  TimerBehavior.swift
//  OtusHomework1
//
//  Created by MacMini Elis on 24/09/2019.
//  Copyright © 2019 Anastasiya Sachkova. All rights reserved.
//

import Foundation
import UIKit

class TimerBehavior: LifecycleBehaviorProtocol {
    private var timer:Timer? = Timer()
    
    func afterAppearing(_ viewController: UIViewController) {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(runTimed), userInfo: nil, repeats: true)
    }
    
    func beforeDisappearing(_ viewController: UIViewController) {
        if let timer = timer {
            timer.invalidate()
            self.timer = nil
        }
    }
    
    @objc private func runTimed() {
        print(Date())
    }
}
