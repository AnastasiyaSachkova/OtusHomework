//
//  SwiftArrayManipulator.swift
//  DataStructures
//
//  Created by Ellen Shapiro on 8/3/14.
//  Copyright (c) 2014 Ray Wenderlich Tutorial Team. All rights reserved.
//

import Foundation

open class SwiftArrayManipulator: ArrayManipulator {
  fileprivate var intArray = [Int]()
  
  open func arrayHasObjects() -> Bool {
    if intArray.count == 0 {
      return false
    } else {
      return true
    }
  }
  
  open func setupWithObjectCount(_ count: Int) -> TimeInterval {
    return Profiler.runClosureForTime() {
      self.intArray = [Int]()
      for i in 0 ..< count {
        self.intArray.append(i)
      }
    }
  }
  
  fileprivate func nextElement() -> Int {
    return intArray.count + 1
  }
  
  //MARK: Addition Tests
  
  open func insertNewObjectAtBeginning() -> TimeInterval {
    let next = nextElement()
    let time = Profiler.runClosureForTime() {
      self.intArray.insert(next, at: 0)
    }
    
    assert(intArray[0] == next, "First object was not changed!")
    intArray.remove(at: 0)
    assert(intArray[0] != next, "First object not back to original!")
    
    return time
  }
  
  open func insertNewObjectInMiddle() -> TimeInterval {
    let half = Float(intArray.count) / Float(2)
    let middleIndex = Int(ceil(half))
    let next = nextElement()
  
    let time = Profiler.runClosureForTime() {
      self.intArray.insert(next, at: middleIndex)
    }
    
    assert(intArray[middleIndex] == next, "Middle object didn't change!")
    
    //Reset
    self.intArray.remove(at: middleIndex)
    
    assert(intArray[middleIndex] != next, "Middle object is not the same after removal!")
    
    return time
  }
  
  open func addNewObjectAtEnd() -> TimeInterval {
    let next = nextElement()
    let time = Profiler.runClosureForTime() {
      self.intArray.append(next)
    }
    
    //Remove the added string
    self.intArray.removeLast()
    return time
  }
  
  //MARK: Removal tests
  
  func removeFirstObject() -> TimeInterval {
    let originalFirst = intArray[0] as Int
    let time = Profiler.runClosureForTime() {
      self.intArray.remove(at: 0)
    }
    
    assert(intArray[0] != originalFirst, "First object didn't change!")
    intArray.insert(originalFirst, at: 0)
    assert(intArray[0] == originalFirst, "First object is not the same after removal!")
    return time
  }
  
  func removeMiddleObject() -> TimeInterval {
    let half = Float(intArray.count) / Float(2)
    let middleIndex = Int(ceil(half))
    let originalMiddle = intArray[middleIndex] as Int
    
    let time = Profiler.runClosureForTime() {
      self.intArray.remove(at: middleIndex)
    }
    
    assert(intArray[middleIndex] != originalMiddle, "Middle object didn't change!")
    intArray.insert(originalMiddle, at: middleIndex)
    assert(intArray[middleIndex] == originalMiddle, "Middle object is not the same after being added back!")
    
    return time
  }
  
  func removeLastObject() -> TimeInterval {
    intArray.append(nextElement())
    return Profiler.runClosureForTime() {
      self.intArray.removeLast()
    }
  }
  
  //MARK: Lookup tests

  func lookupByIndex() -> TimeInterval {
    let elements = UInt32(intArray.count)
    let randomIndex = Int(arc4random_uniform(elements))
    
    let time = Profiler.runClosureForTime() {
      _ = self.intArray[randomIndex]
    }
    
    return time
  }
  
  func lookupByObject() -> TimeInterval {
    //Add a known object at a random index.
    let next = nextElement()
    let elements = UInt32(intArray.count)
    let randomIndex = Int(arc4random_uniform(elements))
    intArray.insert(next, at: randomIndex)
    
    let time = Profiler.runClosureForTime() {
        let _ = self.intArray.firstIndex(of: next)//find(self.intArray, next)
    }

    return time
  }
}
