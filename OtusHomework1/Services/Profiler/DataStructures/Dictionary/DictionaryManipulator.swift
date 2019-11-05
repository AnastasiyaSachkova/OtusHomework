//
//  DictionaryManipulator.swift
//  DataStructures
//
//  Created by Ellen Shapiro on 8/3/14.
//  Copyright (c) 2014 Ray Wenderlich Tutorial Team. All rights reserved.
//

import Foundation

/**
 * A protocol which will allow the easy swapping out of dictionary subtypes
 */
protocol DictionaryManipulator {
  func dictHasEntries() -> Bool
  func setupWithEntryCount(_ count: Int) -> TimeInterval
  func add1Entry() -> TimeInterval
  func add5Entries() -> TimeInterval
  func add10Entries() -> TimeInterval
  func remove1Entry() -> TimeInterval
  func remove5Entries() -> TimeInterval
  func remove10Entries() -> TimeInterval
  func lookup1EntryTime() -> TimeInterval
  func lookup10EntriesTime() -> TimeInterval
}
