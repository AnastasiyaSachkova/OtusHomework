//
//  SuffixArrayManipulator.swift
//  DataStructuresProfiling
//
//  Created by Georgy Khaydenko on 26/10/2019.
//  Copyright © 2019 Exey Panteleev. All rights reserved.
//

import Foundation


protocol SuffixArrayManipulator {
    func suffixArrayHasObjects() -> Bool
    func setup() -> TimeInterval
    func changeEachSuffix() -> TimeInterval
    func reverseSuffixArray() -> TimeInterval
    func searchFor10Tripples() -> (TimeInterval, Int)
}
