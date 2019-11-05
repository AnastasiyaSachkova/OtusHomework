//
//  Profiler.swift
//  DataStructures
//
//  Created by Ellen Shapiro on 8/2/14.
//  Copyright (c) 2014 Ray Wenderlich Tutorial Team. All rights reserved.
//

import Foundation

class Profiler {
    
  class func runClosureForTime(_ closure: (() -> Void)!) -> TimeInterval {
    //Timestamp before
    let startDate = Date()
    //Run the closure
    closure()
    
    //Timestamp after
    let endDate = Date()
    
    //Calculate the interval.
    let interval = endDate.timeIntervalSince(startDate)
    
    return interval
  }
    
  class func formattedTime(_ time: TimeInterval) -> String {
           let formatter = NumberFormatter()
           formatter.numberStyle = NumberFormatter.Style.decimal
           let digits = 6
           formatter.minimumFractionDigits = digits
           formatter.maximumFractionDigits = digits
           
           return formatter.string(from: time as NSNumber) ?? ""
       }
}
