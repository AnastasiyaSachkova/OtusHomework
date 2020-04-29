//
//  UnitTest.swift
//  OtusHomeworkTests
//
//  Created by Elis on 29.04.2020.
//  Copyright © 2020 Anastasiya Sachkova. All rights reserved.
//

import XCTest
@testable import OtusHomework1

class UnitTest: XCTestCase {
    var sut: SwiftArrayManipulator!

    override func setUp() {
       super.setUp()
        
        sut = SwiftArrayManipulator()
    }

    override func tearDown() {
       sut = nil
       super.tearDown()
    }
    
    //MARK: Тестируем класс SwiftArrayManipulator
    func testSetupObjects() {
        let res = sut.setupWithObjectCount(100)
        let result = res > 0
        XCTAssert(result, "setupWithObjectCount() - OK")
    }
    
    func testInsertNewObjectAtBeginning() {
        let res = sut.insertNewObjectAtBeginning()
        let result = res > 0
        XCTAssert(result, "insertNewObjectAtBeginning() - OK")
    }
    
    func testInsertNewObjectInMiddle() {
        let res = sut.insertNewObjectInMiddle()
        let result = res > 0
        XCTAssert(result, "insertNewObjectInMiddle() - OK")
    }
    
    func testAddNewObjectAtEnd() {
        let res = sut.addNewObjectAtEnd()
        let result = res > 0
        XCTAssert(result, "addNewObjectAtEnd() - OK")
    }
    
    func testRemoveFirstObject() {
       
        appendIntArray()
        let res = sut.removeFirstObject()
        let result = res > 0
        XCTAssert(result, "removeFirstObject() - OK")
       
    }
    
    func testRemoveMiddleObject() {
        appendIntArray()
        let res = sut.removeMiddleObject()
        let result = res > 0
        XCTAssert(result, "removeMiddleObject() - OK")
    }
    
    func testRemoveLastObject() {
        appendIntArray()
        let res = sut.removeLastObject()
        let result = res > 0
        XCTAssert(result, "removeLastObject() - OK")
    }
    
    func testLookupByIndex() {
        let res = sut.lookupByIndex()
        let result = res > 0
        XCTAssert(result, "lookupByIndex() - OK")
    }
    
    func testLookupByObject() {
        let res = sut.lookupByObject()
        let result = res > 0
        XCTAssert(result, "lookupByObject() - OK")
    }
    
    func appendIntArray() {
        for i in 0 ..< 100 {
          sut.intArray.append(i)
        }
    }
}
