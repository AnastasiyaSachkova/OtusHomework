//
//  FakeData.swift
//  OtusHomework1
//
//  Created by MacMini Elis on 24/09/2019.
//  Copyright © 2019 Anastasiya Sachkova. All rights reserved.
//

import Foundation

struct FakeDatas: Decodable {
    let data: [FakeData]
}

struct FakeData: Codable {
    let id: Int
    let name: String
}

