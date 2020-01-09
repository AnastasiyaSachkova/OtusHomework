//
//  Services.swift
//  OtusHomework1
//
//  Created by 7Winds on 16.12.2019.
//  Copyright © 2019 Anastasiya Sachkova. All rights reserved.
//

import Foundation

class Services {
    
    static var fakeDataProvider: FakeDataProvider = {
        return FakeDataProvider()
    }()
    
    static var algoProvider: AlgoProvider = {
        return AlgoProvider()
    }()
}
