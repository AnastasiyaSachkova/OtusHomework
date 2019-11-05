//
//  SetManipulator.swift
//  DataStructures
//
//  Created by Ellen Shapiro on 4/18/15.
//  Copyright (c) 2015 Ray Wenderlich Tutorial Team. All rights reserved.
//

import Foundation

protocol SetManipulator {
  func setHasObjects() -> Bool
  func setupWithObjectCount(_ objectCount: Int) -> TimeInterval
  func add1Object() -> TimeInterval
  func add5Objects() -> TimeInterval
  func add10Objects() -> TimeInterval
  func remove1Object() -> TimeInterval
  func remove5Objects() -> TimeInterval
  func remove10Objects() -> TimeInterval
  func lookup1Object() -> TimeInterval
  func lookup10Objects() -> TimeInterval
}
