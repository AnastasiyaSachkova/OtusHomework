//
//  DataStructuresViewController.swift
//  OtusHomework1
//
//  Created by 7Winds on 04.11.2019.
//  Copyright © 2019 Anastasiya Sachkova. All rights reserved.
//

import Foundation
import UIKit

/**
* Base subclass for the three view controllers, which handles most of the UI setup.
*/
class DataStructuresViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

  //MARK: - Variables

  //MARK: IBOutlets

  @IBOutlet weak var slider: UISlider!
  @IBOutlet weak var countLabel: UILabel!
  @IBOutlet weak var resultsTableView: UITableView!
  @IBOutlet weak var createAndTestButton: UIButton!
  @IBOutlet weak var testOnlyButton: UIButton!
  @IBOutlet weak var spinner: UIActivityIndicatorView!

  //MARK: item tracking

  fileprivate var numberOfItems: Int = 1000 //Default to 1000

  //MARK: Lazy-instantiated variables

  lazy fileprivate var numberFormatter: NumberFormatter = {
    var formatter = NumberFormatter()
    formatter.numberStyle = NumberFormatter.Style.decimal
    return formatter
    }()

  lazy fileprivate var timeNumberFormatter: NumberFormatter = {
    var formatter = NumberFormatter()
    formatter.numberStyle = NumberFormatter.Style.decimal
    let digits = 6
    formatter.minimumFractionDigits = digits
    formatter.maximumFractionDigits = digits
    return formatter
    }()

  //MARK: - Methods

  //MARK: Init

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)

  }

  //MARK: View lifecycle

  override func viewDidLoad() {
    super.viewDidLoad()
    testOnlyButton.isEnabled = false
    resultsTableView.isScrollEnabled = false
    updateCountLabel()
  }

  //MARK: Create/Test

  func create(_ size: Int) {
    print("Override this method in " + self.description + ", but do not call super.")
  }

  func test() {
    print("Override this method in " + self.description + ", but do not call super.")
  }

  //MARK: Convenience methods

  func updateCountLabel() {
    countLabel.text = "Number of items: \(numberFormatter.string(from: numberOfItems as NSNumber)!)"
  }

  func setSliderValueProgrammatically(_ value: Int) {
    slider.value = Float(value)
    sliderAdjusted(slider)
  }

  func setControlsEnabled(_ enabled: Bool) {
    testOnlyButton.isEnabled = enabled
    createAndTestButton.isEnabled = enabled
    slider.isEnabled = enabled
    if enabled {
      spinner.stopAnimating()
    } else {
      spinner.startAnimating()
    }
  }

  func formattedTime(_ time: TimeInterval) -> String? {
    return timeNumberFormatter.string(from: time as NSNumber)
  }

  //MARK: IBActions

  @IBAction func sliderAdjusted(_ adjustedSlider: UISlider) {
    numberOfItems = Int(ceil(adjustedSlider.value))
    testOnlyButton.isEnabled = false
    updateCountLabel()
  }

  @IBAction func createAndTest() {
    setControlsEnabled(false)

    //Fire the heavy lifting in the background
    DispatchQueue.global(qos: .background).async {
      self.create(self.numberOfItems)
      self.test()
      DispatchQueue.main.async {
        //Update the UI on the main thread
        self.resultsTableView.reloadData()
        self.setControlsEnabled(true)
      }
    }
  }

  @IBAction func testOnly() {
    setControlsEnabled(false)

    //Fire the heavy lifting in the background
    DispatchQueue.global(qos: .background).async {
      self.test()
      DispatchQueue.main.async {
        //Update the UI on the main thread
        self.resultsTableView.reloadData()
        self.setControlsEnabled(true)
      }
    }
  }

  //MARK: UITableViewDataSource
  func numberOfSections(in tableView: UITableView) -> Int {
    //There will always be one section
    return 1
  }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    //There are always 9 items
    return 9
  }

  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 26
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    //In the superclass, just return an empty cell
    let cell = UITableViewCell(style: UITableViewCell.CellStyle.value1, reuseIdentifier: "REUSE")

    cell.textLabel!.text = "OVERRIDE"
    cell.detailTextLabel!.text = "in subclass!"
    cell.detailTextLabel!.textColor = UIColor.black
    cell.selectionStyle = UITableViewCell.SelectionStyle.none
    return cell
  }
}
