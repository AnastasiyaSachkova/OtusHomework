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
         //  app.navigationBars["Feed"].otherElements["Feed"].tap()
         //  app.tables.staticTexts["SuffixArray"].tap()
         //  app.buttons["Create Suffix Array and Test"].tap()
           
           let tabBarsQuery = app.tabBars
           let benchmarkButton = tabBarsQuery.buttons["Benchmark"]
           benchmarkButton.tap()
           tabBarsQuery.buttons["Profile"].tap()
           benchmarkButton.tap()
           
           let benchmarkNavigationBar = app.navigationBars["Benchmark"]
          // benchmarkNavigationBar.buttons["Update PieCharts"].tap()
          // benchmarkNavigationBar.buttons["Update layout"].tap()
           tabBarsQuery.buttons["Feed"].tap()
          // app.navigationBars["Otus_HW_16.SuffixArrayView"].buttons["Назад"].tap()
       }


    func testLaunchPerformance() {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
                XCUIApplication().launch()
            }
        }
    }
}
