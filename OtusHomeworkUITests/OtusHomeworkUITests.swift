//
//  OtusHomeworkUITests.swift
//  OtusHomeworkUITests
//
//  Created by 7Winds on 14.11.2019.
//  Copyright © 2019 Anastasiya Sachkova. All rights reserved.
//

import XCTest

class OtusHomeworkUITests: XCTestCase {
    
    var app = XCUIApplication()
    
    override func setUp() {
        app.launch()
        continueAfterFailure = false
    }

    override func tearDown() {
        app.terminate()
    }
    
    func testStratApp() {
        
        let tabBarsQuery = app.tabBars
        tabBarsQuery.buttons["Benchmark"].tap()
        tabBarsQuery.buttons["Profile"].tap()
        tabBarsQuery.buttons["Feed"].tap()
    }


    func testLaunchPerformance() {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
                XCUIApplication().launch()
            }
        }
    }
}
