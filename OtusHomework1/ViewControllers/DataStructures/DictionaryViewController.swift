//
//  DictionaryViewController.swift
//  OtusHomework1
//
//  Created by 7Winds on 04.11.2019.
//  Copyright © 2019 Anastasiya Sachkova. All rights reserved.
//

import Foundation
import UIKit

private enum DictionaryVCRow: Int {
  case creation = 0,
  add1Entry,
  add5Entries,
  add10Entries,
  remove1Entry,
  remove5Entries,
  remove10Entries,
  lookup1Entry,
  lookup10Entries
}

class DictionaryViewController: DataStructuresViewController {

  //MARK: - Variables

  let dictionaryManipulator: DictionaryManipulator = SwiftDictionaryManipulator()

  var creationTime: TimeInterval = 0
  var add1EntryTime: TimeInterval = 0
  var add5EntriesTime: TimeInterval = 0
  var add10EntriesTime: TimeInterval = 0
  var remove1EntryTime: TimeInterval = 0
  var remove5EntriesTime: TimeInterval = 0
  var remove10EntriesTime: TimeInterval = 0
  var lookup1EntryTime: TimeInterval = 0
  var lookup10EntriesTime: TimeInterval = 0

  //MARK: - Methods

  //MARK: View lifecycle

  override func viewDidLoad() {
    super.viewDidLoad()
    createAndTestButton.setTitle("Create Dictionary and Test", for: UIControl.State())
  }

  //MARK: Superclass creation/testing overrides

  override func create(_ size: Int) {
    creationTime = dictionaryManipulator.setupWithEntryCount(size)
  }

  override func test() {
    if dictionaryManipulator.dictHasEntries() {
      add1EntryTime = dictionaryManipulator.add1Entry()
      add5EntriesTime = dictionaryManipulator.add5Entries()
      add10EntriesTime = dictionaryManipulator.add10Entries()
      remove1EntryTime = dictionaryManipulator.remove1Entry()
      remove5EntriesTime = dictionaryManipulator.remove5Entries()
      remove10EntriesTime = dictionaryManipulator.remove10Entries()
      lookup1EntryTime = dictionaryManipulator.lookup1EntryTime()
      lookup10EntriesTime = dictionaryManipulator.lookup10EntriesTime()
    } else {
      print("Dictionary not yet set up")
    }
  }

  //MARK: Table View Override

  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = super.tableView(tableView, cellForRowAt: indexPath)

    switch (indexPath as NSIndexPath).row {
    case DictionaryVCRow.creation.rawValue:
      cell.textLabel?.text = "Dictionary Creation:"
      cell.detailTextLabel?.text = formattedTime(creationTime)
    case DictionaryVCRow.add1Entry.rawValue:
      cell.textLabel?.text = "Add 1 Entry:"
      cell.detailTextLabel?.text = formattedTime(add1EntryTime)
    case DictionaryVCRow.add5Entries.rawValue:
      cell.textLabel?.text = "Add 5 Entries:"
      cell.detailTextLabel?.text = formattedTime(add5EntriesTime)
    case DictionaryVCRow.add10Entries.rawValue:
      cell.textLabel?.text = "Add 10 Entries:"
      cell.detailTextLabel?.text = formattedTime(add10EntriesTime)
    case DictionaryVCRow.remove1Entry.rawValue:
      cell.textLabel?.text = "Remove 1 Entry:"
      cell.detailTextLabel?.text = formattedTime(remove1EntryTime)
    case DictionaryVCRow.remove5Entries.rawValue:
      cell.textLabel?.text = "Remove 5 Entries:"
      cell.detailTextLabel?.text = formattedTime(remove5EntriesTime)
    case DictionaryVCRow.remove10Entries.rawValue:
      cell.textLabel?.text = "Remove 10 Entries:"
      cell.detailTextLabel?.text = formattedTime(remove10EntriesTime)
    case DictionaryVCRow.lookup1Entry.rawValue:
      cell.textLabel?.text = "Lookup 1 Entry:"
      cell.detailTextLabel?.text = formattedTime(lookup1EntryTime)
    case DictionaryVCRow.lookup10Entries.rawValue:
      cell.textLabel?.text = "Lookup 10 Entries:"
      cell.detailTextLabel?.text = formattedTime(lookup10EntriesTime)
    default:
      print("Unhandled row \((indexPath as NSIndexPath).row)")
    }

    return cell
  }
}
