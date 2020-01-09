//
//  SuffixArrayManipulatorProtocol.swift
//  OtusHomework1
//
//  Created by 7Winds on 09.01.2020.
//  Copyright © 2020 Anastasiya Sachkova. All rights reserved.
//

import Foundation
protocol SuffixArrayManipulatorProtocol {
    func setupWithObjectCount(_ count: Int) -> TimeInterval
    func arrayHasObjects() -> Bool
    func insertNewObject() -> TimeInterval
    func lookupByObject()  -> TimeInterval
    func lookupBy10RandomeString() -> TimeInterval
    func lookupAllAlgo()  -> TimeInterval
}
