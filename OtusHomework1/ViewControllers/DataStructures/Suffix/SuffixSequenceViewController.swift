//
//  SuffixSequenceViewController.swift
//  OtusHomework1
//
//  Created by 7Winds on 04.11.2019.
//  Copyright © 2019 Anastasiya Sachkova. All rights reserved.
//

private enum SuffixArrayVCRow: Int {
  case creation = 0,
  changeSuffixes,
  reverseSuffixArray,
  searchFor10Tripples,
  find10Tripples

}


import UIKit

class SuffixSequenceViewController: DataStructuresViewController {
      //MARK: - Variables

    let suffixArrayManipulator: SuffixArrayManipulator = SwiftSuffixArrayManipulator()

    var creationTime: TimeInterval = 0
    var changingSuffixesTime: TimeInterval = 0
    var reverseSuffixArrayTime: TimeInterval = 0
    var searchFor10TripplesTime: TimeInterval = 0


      //MARK: - Methods

      //MARK: View lifecycle

      override func viewDidLoad() {
        super.viewDidLoad()
        createAndTestButton.setTitle("Create SuffixIterator and Test", for: [])
      }

      //MARK: Superclass creation/testing overrides

      override func create(_ size: Int) {
        creationTime = suffixArrayManipulator.setup()
      }

    override func test() {
        if (suffixArrayManipulator.suffixArrayHasObjects()) {
            changingSuffixesTime = suffixArrayManipulator.changeEachSuffix()
            reverseSuffixArrayTime = suffixArrayManipulator.reverseSuffixArray()
            searchFor10TripplesTime = suffixArrayManipulator.searchFor10Tripples().0
        } else {
            print("SuffixArray is not set up yet")
        }
    }

      //MARK: Table View Override


      override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = super.tableView(tableView, cellForRowAt: indexPath)
        switch (indexPath as NSIndexPath).row {
        case SuffixArrayVCRow.creation.rawValue:
          cell.textLabel?.text = "SuffixArray Creation:"
          cell.detailTextLabel?.text = formattedTime(creationTime)
        case SuffixArrayVCRow.changeSuffixes.rawValue:
            cell.textLabel?.text = "Changing Each Suffix in Array:"
            cell.detailTextLabel?.text = formattedTime(changingSuffixesTime)
        case SuffixArrayVCRow.reverseSuffixArray.rawValue:
            cell.textLabel?.text = "Reverse SuffixArray:"
            cell.detailTextLabel?.text = formattedTime(reverseSuffixArrayTime)
        case SuffixArrayVCRow.searchFor10Tripples.rawValue:
            cell.textLabel?.text = "Search For 10 Random Tripples:"
            cell.detailTextLabel?.text = formattedTime(searchFor10TripplesTime)
        case SuffixArrayVCRow.find10Tripples.rawValue:
            cell.textLabel?.text = "Find 10 Random Tripples Times:"
            cell.detailTextLabel?.text = String(suffixArrayManipulator.searchFor10Tripples().1)
        default:
            print("Unhandled row \((indexPath as NSIndexPath).row)")
        }
        
        return cell
    }
    
}
