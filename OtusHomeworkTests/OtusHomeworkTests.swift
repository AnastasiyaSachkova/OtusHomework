//
//  OtusHomeworkTests.swift
//  OtusHomeworkTests
//
//  Created by 7Winds on 14.11.2019.
//  Copyright © 2019 Anastasiya Sachkova. All rights reserved.
//

import XCTest

class OtusHomeworkTests: XCTestCase {

    var stringGenerator: StringGenerator!
    
    override func setUp() {
        super.setUp()
        
        stringGenerator = StringGenerator()
    }

    override func tearDown() {
        stringGenerator = nil
        super.tearDown()
    }

    //MARK: Тестируем класс StringGenerator
    //standardRandomString() - проверяем что резултат строка длиной 12 символов
    func testStrGeneratorStandardRandomStrin() {
        
        let randomStr = stringGenerator.generateRandomString(10)
        let result = randomStr.count == 10
        XCTAssert(result, "standardRandomString() - OK")
    }
    
    //проверяем что метод generateRandomString() возвращает строку нужной длины
    func testStrGeneratorRandomStringStrCount() {
        var result = true
        for i in 1...100 {
            let rendomStr = stringGenerator.generateRandomString(i)
            if rendomStr.count != i {
                result = false
                break
            }
        }
        XCTAssert(result, "generateRandomString() - OK")
    }
    
    //проверяем что метод randomSingleCharacterString() возвращает один символ из заданного множества
    func testRandomSingleCharacterString() {

        let rendomStr = stringGenerator.randomSingleCharacterString()
        let result = rendomStr.count == 1 && "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789".contains(rendomStr)
        XCTAssert(result, "randomSingleCharacterString - OK")
    }
    


//    func testPerformanceExample() {
//        // This is an example of a performance test case.
//        measure {
//            // Put the code you want to measure the time of here.
//        }
//    }

}

open class StringGenerator {
    fileprivate let alphanumericCharacterString: String = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    
    open func generateRandomString(_ length: Int) -> String {
        var randomString = String()
        for _ in 0 ..< length {
            let elements = UInt32(alphanumericCharacterString.count)
            let randomIndex = Int(arc4random_uniform(elements))
            randomString += String(Array(alphanumericCharacterString)[randomIndex])
        }
        
        return randomString
    }
    
    open func standardRandomString() -> String {
        return generateRandomString(12)
    }
    
    open func randomSingleCharacterString() -> String {
        return generateRandomString(1)
    }
}
