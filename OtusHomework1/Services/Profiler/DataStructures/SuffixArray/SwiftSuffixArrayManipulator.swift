//
//  SwiftSuffixArrayManipulator.swift
//  DataStructuresProfiling
//
//  Created by Georgy Khaydenko on 26/10/2019.
//  Copyright © 2019 Exey Panteleev. All rights reserved.
//

import Foundation

open class SwiftSuffixArrayManipulator: SuffixArrayManipulator {
    var suffixArray = [(String, String)]()
    
    func suffixArrayHasObjects() -> Bool {
        if suffixArray.count == 0 {
            return false
        } else {
            return true
        }
    }
    
    func setup() -> TimeInterval {
        return Profiler.runClosureForTime() {
            var dataSource = SuffixArray()
            dataSource.getSuffixes()
            dataSource.sortSuffixes()
            self.suffixArray = dataSource.suffixes
        }
    }
    
    func changeEachSuffix() -> TimeInterval {
        let suffixes = suffixArray
        let time = Profiler.runClosureForTime {
            for var suffix in self.suffixArray {
                suffix.0.append("0")
            }
        }
        suffixArray = suffixes
        return time
    }
    
    func reverseSuffixArray() -> TimeInterval {
        let suffixes = suffixArray
        let time = Profiler.runClosureForTime {
            self.suffixArray.reverse()
        }
        suffixArray = suffixes
        return time
    }
    
    func searchFor10Tripples() -> (TimeInterval, Int) {
        var tripples = [String]()
        for _ in 0...9 {
            tripples.append(StringGenerator().generateRandomString(3))
        }
        var successSearches = 0
        let time = Profiler.runClosureForTime {
            for tripple in tripples {
                for suffix in self.suffixArray {
                    if suffix.0.contains(tripple) {
                        successSearches += 1
                    }
                }
            }
        }
        return (time, successSearches)
    }
    
    
}
