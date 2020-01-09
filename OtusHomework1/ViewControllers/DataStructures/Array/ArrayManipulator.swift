//
//  ArrayManipulator.swift
//  OtusHomework1
//
//  Created by 7Winds on 09.01.2020.
//  Copyright © 2020 Anastasiya Sachkova. All rights reserved.
//

import Foundation

/**
 * A protocol which will allow the easy swapping out of array subtypes
 */
protocol ArrayManipulator {
  func arrayHasObjects() -> Bool
  func setupWithObjectCount(_ count: Int) -> TimeInterval
  func insertNewObjectAtBeginning() -> TimeInterval
  func insertNewObjectInMiddle() -> TimeInterval
  func addNewObjectAtEnd() -> TimeInterval
  func removeFirstObject() -> TimeInterval
  func removeMiddleObject() -> TimeInterval
  func removeLastObject() -> TimeInterval
  func lookupByIndex() -> TimeInterval
  func lookupByObject() -> TimeInterval
}
