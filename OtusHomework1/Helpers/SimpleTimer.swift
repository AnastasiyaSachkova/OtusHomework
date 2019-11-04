//
//  SimpleTimer.swift
//  OtusHomework1
//
//  Created by MacMini Elis on 25/09/2019.
//  Copyright © 2019 Anastasiya Sachkova. All rights reserved.
//

import Foundation
import UIKit

class SimpleTimer: NSObject {
    static let shared: SimpleTimer = {
        let timer = SimpleTimer()
        return timer
    }()
    
    var internalTimer: Timer? = Timer()
    var jobs = [() -> Void]()
    
    func startTimer(withInterval interval: Double, andJob job: @escaping () -> Void) {
        if let timer = internalTimer {
            timer.invalidate()
            internalTimer = nil
        }
        jobs.append(job)
        
        self.internalTimer = Timer.scheduledTimer(timeInterval: interval, target: self, selector: #selector(self.doJob), userInfo: nil, repeats: true)
        RunLoop.current.add(self.internalTimer!, forMode: .common)
        self.internalTimer?.tolerance = 0.1
    }
  
    func stopTimer() {
        jobs = [()->()]()
        if let timer = internalTimer {
            timer.invalidate()
            internalTimer = nil
        }
    }
    
    @objc func doJob() {
        guard jobs.count > 0 else { return }
        for job in jobs {
            job()
        }
    }
    
    func timeString(time:TimeInterval) -> String {
        let hours = Int(time) / 3600
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        return String(format:"%02i:%02i", minutes, seconds)
    }
    
}
