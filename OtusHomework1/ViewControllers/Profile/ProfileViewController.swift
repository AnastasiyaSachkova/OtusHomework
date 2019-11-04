//
//  ProfileViewController.swift
//  OtusHomework1
//
//  Created by MacMini Elis on 24/09/2019.
//  Copyright © 2019 Anastasiya Sachkova. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, NavigationProtocol {
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var label: UILabel!
    private let matches = Matches()
    private var locale = "ru"
    var sharedText: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        label.text = updateText(value: sharedText, locale: locale)
    }
    
    @IBAction func segmentedControlChanged() {
        switch segmentedControl.selectedSegmentIndex {
        case 0:  locale = "ru"
        case 1:  locale = "en_US"
        case 2:  locale = "fr"
        case 3:  locale = "zh_CN"
        case 4:  locale = "es"
        default: locale = Locale.current.languageCode ?? "ru"
        }
        label.text = updateText(value: sharedText, locale: locale)
    }
    
    private func updateText(value: String?, locale: String) -> String{
        guard let tx = value else { return "" }
        var str = tx
        let locale = Locale(identifier: locale)
        
        let measurementFormatter = MeasurementFormatter()
        measurementFormatter.locale = locale
        let replace = tx.replacingOccurrences(of: ",", with: ".")
        let matched = matches.matches(for: "[+-]?([0-9]*[.])?[0-9]+", in: replace)
        let measurment = matched.map{ Measurement(value: Double($0)!, unit: UnitLength.kilometers) }
        str = measurment.compactMap{ measurementFormatter.string(for: $0) }.joined(separator:", ")
        
        return str
    }
    
}


