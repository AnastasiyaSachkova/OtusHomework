//
//  SwiftDictionaryManipulator.swift
//  DataStructures
//
//  Created by Ellen Shapiro on 8/3/14.
//  Copyright (c) 2014 Ray Wenderlich Tutorial Team. All rights reserved.
//

import Foundation

class SwiftDictionaryManipulator: DictionaryManipulator {
  var intDictionary = [Int: Int]()
  
  
  func dictHasEntries() -> Bool {
    if (intDictionary.count == 0) {
      return false
    } else {
      return true
    }
  }
  
  //MARK: Setup
  
  func setupWithEntryCount(_ count: Int) -> TimeInterval {
    return Profiler.runClosureForTime() {
      for i in 0 ..< count {
        self.intDictionary.updateValue(i, forKey: i)
      }
    }
  }
  
  fileprivate func nextElement() -> Int {
    return intDictionary.count + 1
  }
  
  //MARK: Adding entries
  
  func addEntries(_ count: Int) -> TimeInterval {
    var array = [Int]()
    let next = nextElement()
    for i in 0 ..< count {
      let plusI = next + i
      array.append(plusI)
    }
    
    let time = Profiler.runClosureForTime() {
      for key in array {
        self.intDictionary.updateValue(key, forKey: key)
      }
    }
    
    //Restore to original state
    for key in array {
      intDictionary.removeValue(forKey: key)
    }
    
    return time
  }
  
  func add1Entry() -> TimeInterval {
    return addEntries(1)
  }
  func add5Entries() -> TimeInterval {
    return addEntries(5)
  }
  func add10Entries() -> TimeInterval {
    return addEntries(10)
  }
  
  //MARK: Removing entries
  
  func removeEntries(_ count: Int) -> TimeInterval {
    var array = [Int]()
    let next = nextElement()
    for i in 0 ..< count {
      let plusI = next + i
      array.append(plusI)
    }
    
    for key in array {
      intDictionary.updateValue(key, forKey: key)
    }
    
    return Profiler.runClosureForTime() {
      //Restore to original state
      for key in array {
        self.intDictionary.removeValue(forKey: key)
      }
    }
  }
  
  func remove1Entry() -> TimeInterval {
    return removeEntries(1)
  }
  
  func remove5Entries() -> TimeInterval {
    return removeEntries(5)
  }
  
  func remove10Entries() -> TimeInterval {
    return removeEntries(10)
  }
  
  //MARK: Looking up entries
  
  func lookupEntries(_ count: Int) -> TimeInterval {
    var array = [Int]()
    let next = nextElement()
    for i in 0 ..< count {
      let plusI = next + i
      array.append(plusI)
    }
    
    for key in array {
      intDictionary.updateValue(key, forKey: key)
    }
    
    let time = Profiler.runClosureForTime() {
      //Look up by key
      for key in array {
        let _ = self.intDictionary[key]
      }
    }
    
    //Restore to original state
    for key in array {
      intDictionary.removeValue(forKey: key)
    }
    
    return time
  }
  
  func lookup1EntryTime() -> TimeInterval {
    return lookupEntries(1)
  }
  
  func lookup10EntriesTime() -> TimeInterval {
    return lookupEntries(10)
  }
}
