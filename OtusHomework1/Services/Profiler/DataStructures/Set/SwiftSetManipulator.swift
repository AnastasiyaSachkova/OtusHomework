//
//  SwiftSetManipulator.swift
//  DataStructures
//
//  Created by Ellen Shapiro on 4/18/15.
//  Copyright (c) 2015 Ray Wenderlich Tutorial Team. All rights reserved.
//

import Foundation

open class SwiftSetManipulator : SetManipulator {
  fileprivate var setToManipulate = Set<String>()
  fileprivate let generator = StringGenerator()
  
  open func setHasObjects() -> Bool {
    if setToManipulate.count == 0 {
      return false
    } else {
      return true
    }
  }
  
  open func setupWithObjectCount(_ objectCount: Int) -> TimeInterval {
    return Profiler.runClosureForTime() {
      self.setToManipulate = Set<String>(minimumCapacity: objectCount)
      for _ in 0 ..< objectCount {
        self.setToManipulate.insert(self.generator.standardRandomString())
      }
    }
  }
  
  //MARK: Add tests
  
  fileprivate func addObjects(_ count: Int) -> TimeInterval {
    let originalCount = setToManipulate.count
    var objectsArray = [String]()
    for _ in 0 ..< count {
      //Generate the appropriate number of random strings
      objectsArray.append(generator.standardRandomString())
    }
    
    //Add them all to the set, and measure how long it takes.
    let timed = Profiler.runClosureForTime() {
      let _ = self.setToManipulate.union(objectsArray)
    }
    
    for removeMe in objectsArray {
      self.setToManipulate.remove(removeMe)
    }
    
    //Make sure we're back to where we need to be.
    assert(originalCount == setToManipulate.count, "Set is not back to the original #!")
    
    return timed
  }
  
  open func add1Object() -> TimeInterval {
    return addObjects(1)
  }
  
  open func add5Objects() -> TimeInterval {
    return addObjects(5)
  }
  
  open func add10Objects() -> TimeInterval {
    return addObjects(10)
  }
  
  //MARK: Remove tests
  
  fileprivate func removeObjects(_ count: Int) -> TimeInterval {
    let originalCount = setToManipulate.count
    var objectsArray = [String]()
    for _ in 0 ..< count {
      //Generate the appropriate number of random strings
      objectsArray.append(generator.standardRandomString())
    }
    //Add them all to the set
    let _ = self.setToManipulate.union(objectsArray)
    
    //measure how long it takes to remove them.
    let timed =  Profiler.runClosureForTime() {
      for removeMe in objectsArray {
        self.setToManipulate.remove(removeMe)
      }
    }
    
    //Make sure we're back to where we need to be.
    assert(originalCount == setToManipulate.count, "Set is not back to the original #!")
    
    return timed
  }
  
  open func remove1Object() -> TimeInterval {
    return removeObjects(1)
  }
  
  open func remove5Objects() -> TimeInterval {
    return removeObjects(5)
  }
  
  open func remove10Objects() -> TimeInterval {
    return removeObjects(10)
  }
  
  //MARK: Lookup tests
  
  fileprivate func lookupObjects(_ count: Int) -> TimeInterval {
    let originalCount = setToManipulate.count
    var objectsArray = [String]()
    for _ in 0 ..< count {
      //Generate the appropriate number of random strings
      objectsArray.append(generator.standardRandomString())
    }
    //Add them all to the set
    let _ = self.setToManipulate.union(objectsArray)
    
    //measure how long it takes to find them
    let timed =  Profiler.runClosureForTime() {
      for findMe in objectsArray {
        let _ = self.setToManipulate.firstIndex(of: findMe)
      }
    }
    
    //Remove that which was added
    for removeMe in objectsArray {
      self.setToManipulate.remove(removeMe)
    }
    
    //Make sure we're back to where we need to be.
    assert(originalCount == setToManipulate.count, "Set is not back to the original #!")
    
    return timed
  }
  
  open func lookup1Object() -> TimeInterval {
    return lookupObjects(1)
  }
  
  open func lookup10Objects() -> TimeInterval {
    return lookupObjects(10)
  }
}
