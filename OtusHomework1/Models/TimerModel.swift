//
//  TimerModel.swift
//  OtusHomework1
//
//  Created by MacMini Elis on 26/09/2019.
//  Copyright © 2019 Anastasiya Sachkova. All rights reserved.
//

import Foundation

protocol TimerModelDelegate {
    func updateTimerTick(sec: Int)
}

class TimerModel {
    private weak var timer: Timer?
    var delegate: TimerModelDelegate?
    private var isRunning = false
    private var counter = 0
    
    func startOrStopTimer() {
        if !isRunning {
        isRunning = true
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        } else {
           stopTimer()
        }
    }
    
    func stopTimer() {
        timer?.invalidate()
        isRunning = false
    }
    
    func removeTimer() {
        stopTimer()
        counter = 0
    }
    
    @objc func updateTimer() {
        counter += 1
        delegate?.updateTimerTick(sec: counter)
    }
}
